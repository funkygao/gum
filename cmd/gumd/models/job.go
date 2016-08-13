package models

import (
	"fmt"
)

type Job struct {
	BookmarkId int64
	Uri        string
}

func (j *Job) Path() string {
	return fmt.Sprintf("static/assets/img/%d.png", j.BookmarkId)
}

var (
	jobCh = make(chan Job, 100)
)

func EmitJob(j Job) {
	jobCh <- j
}

func JobStream() <-chan Job {
	return jobCh
}
