package scheduler

import (
	"testing"
	"time"

	"github.com/funkygao/gum/cmd/gumd/models"
)

func TestCaptureSnapshort(t *testing.T) {
	j := models.Job{
		BookmarkId: 0,
		Uri:        "http://phantomjs.org/download.html",
	}

	t0 := time.Now()
	captureSnapshort(j)
	t.Logf("%s", time.Since(t0))
}
