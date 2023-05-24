package core

import (
	"time"

	"github.com/go-co-op/gocron"
)

func CreateJobs(ts []Task) {
	var shed = gocron.NewScheduler(time.UTC)

	task := func(t Task) {
		b := &Bugger{
			task: t,
		}

		b.Run()
	}

	for _, t := range ts {
		if len(t.Cron) > 0 {
			_, _ = shed.Tag(t.Name).Cron(t.Cron).Do(func() {
				task(t)
			})
		} else {
			task(t)
		}
	}

	shed.StartAsync()
}

func DeleteJobs(tags ...string) {
	var shed = gocron.NewScheduler(time.UTC)

	shed.RemoveByTags(tags...)
}
