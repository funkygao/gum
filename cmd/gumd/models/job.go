package models

import (
	"fmt"
)

type Job struct {
	BookmarkId int64
	Uri        string
}

func (j *Job) Path() string {
	return fmt.Sprintf("assets/img/%d.png", j.BookmarkId)
}

var (
	jobCh = make(chan Job, 10)
)

func EmitJob(j Job) {
	jobCh <- j
}

func JobStream() <-chan Job {
	return jobCh
}
