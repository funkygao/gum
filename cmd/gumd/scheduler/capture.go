package scheduler

import (
	"bufio"
	"fmt"
	"image/png"
	"io/ioutil"
	"os"

	"github.com/astaxie/beego"
	"github.com/funkygao/golib/pipestream"
	"github.com/funkygao/gum/cmd/gumd/models"
	"github.com/nfnt/resize"
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

		createThumbnail(job)
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

func createThumbnail(job models.Job) {
	beego.Debug(fmt.Sprintf("thumbnailing %d: %s", job.BookmarkId, job.SnapshotPath()))

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

	m := resize.Resize(320, 240, img, resize.Lanczos3)
	out, err := os.Create(job.ThumbnailPath())
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer out.Close()

	// write new image to file
	png.Encode(out, m)

	beego.Debug(fmt.Sprintf("thumbnailed %d: %s", job.BookmarkId, job.ThumbnailPath()))
}
