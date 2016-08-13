package models

type Job struct {
	BookmarkId int64
	Uri        string
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
