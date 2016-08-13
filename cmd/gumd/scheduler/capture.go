package scheduler

import (
	"github.com/funkygao/gum/cmd/gumd/models"
)

func RunForever() {
	for job := range models.JobStream() {
		go captureSnapshort(job)
	}
}

func captureSnapshort(job models.Job) {

}
