package scheduler

import (
	"bufio"
	"fmt"
	"io/ioutil"
	"os"

	"github.com/astaxie/beego"
	"github.com/funkygao/golib/pipestream"
	"github.com/funkygao/gum/cmd/gumd/models"
)

func RunForever() {
	for job := range models.JobStream() {
		go captureSnapshort(job)
	}
}

func captureSnapshort(job models.Job) {
	beego.Debug(fmt.Sprintf("capturing %s", job.Uri))

	args := []string{"--ignore-ssl-errors=true", "--ssl-protocol=any", "--web-security=false"}
	wrapper, err := ioutil.TempFile("", "go-phantom-wrapper")
	if err != nil {
		beego.Error(fmt.Sprintf("%+v: %s", job, err))
		return
	}
	defer func() {
		wrapper.Close()
		os.Remove(wrapper.Name())

		beego.Info(fmt.Sprintf("captured %s", job.Uri))
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
	js := fmt.Sprintf(jsTpl, job.Uri, job.Path())
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
