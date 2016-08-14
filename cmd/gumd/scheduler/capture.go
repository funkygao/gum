package scheduler

import (
	"bufio"
	"fmt"
	"image"
	"image/png"
	"io/ioutil"
	"os"

	"github.com/astaxie/beego"
	"github.com/funkygao/golib/pipestream"
	"github.com/funkygao/gum/cmd/gumd/models"
	"github.com/nfnt/resize"
	"github.com/oliamb/cutter"
)

func RunForever() {
	for job := range models.JobStream() {
		go captureSnapshot(job)
	}
}

func captureSnapshot(job models.Job) {
	beego.Debug(fmt.Sprintf("capturing %d: %s", job.BookmarkId, job.Uri))

	args := []string{"--ignore-ssl-errors=true", "--ssl-protocol=any", "--web-security=false"}
	wrapper, err := ioutil.TempFile("", "go-phantom-wrapper")
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer func() {
		wrapper.Close()
		os.Remove(wrapper.Name())

		beego.Info(fmt.Sprintf("captured %d: %s", job.BookmarkId, job.SnapshotPath()))

		cropSnapshot(job)
	}()

	jsTpl := `
var page = require('webpage').create();
//pageWidth = 320;
//pageHeight = 240;
//page.viewportSize = { width: pageWidth, height: pageHeight };
//page.clipRect = { top: 0, left: 0, width: pageWidth, height: pageHeight };
page.open('%s', function() {
  page.render('%s');
  phantom.exit();
});
`
	js := fmt.Sprintf(jsTpl, job.Uri, job.SnapshotPath())
	args = append(args, wrapper.Name())
	if err = ioutil.WriteFile(wrapper.Name(), []byte(js), os.ModeType); err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}

	cmd := pipestream.New("phantomjs", args...)
	err = cmd.Open()
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer cmd.Close()

	scanner := bufio.NewScanner(cmd.Reader())
	for scanner.Scan() {
	}
}

func cropSnapshot(job models.Job) {
	beego.Debug(fmt.Sprintf("cropping %d: %s", job.BookmarkId, job.SnapshotPath()))

	file, err := os.Open(job.SnapshotPath())
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer file.Close()

	img, err := png.Decode(file)
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}

	m, err := cutter.Crop(img, cutter.Config{
		Height:  500,                 // height in pixel or Y ratio(see Ratio Option below)
		Width:   500,                 // width in pixel or X ratio
		Mode:    cutter.TopLeft,      // Accepted Mode: TopLeft, Centered
		Anchor:  image.Point{10, 10}, // Position of the top left point
		Options: 0,                   // Accepted Option: Ratio
	})
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}

	out, err := os.Create(job.ThumbnailPath())
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer out.Close()

	// write new image to file
	png.Encode(out, m)

	beego.Debug(fmt.Sprintf("cropped %d: %s", job.BookmarkId, job.ThumbnailPath()))
}

func resizeSnapshot(job models.Job) {
	beego.Debug(fmt.Sprintf("resizing %d: %s", job.BookmarkId, job.SnapshotPath()))

	file, err := os.Open(job.SnapshotPath())
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer file.Close()

	img, err := png.Decode(file)
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}

	m := resize.Resize(0, 240, img, resize.Lanczos3)
	out, err := os.Create(job.ThumbnailPath())
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer out.Close()

	// write new image to file
	png.Encode(out, m)

	beego.Debug(fmt.Sprintf("resized %d: %s", job.BookmarkId, job.ThumbnailPath()))
}
