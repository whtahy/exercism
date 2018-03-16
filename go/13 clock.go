package clock

import "fmt"

const (
    hrPerDay  = 24
    minPerHr  = 60
    minPerDay = minPerHr * hrPerDay
)

type Clock struct {
    minutes int
}

func New(hr, min int) Clock {
    totalMin := (min + hr*minPerHr) % minPerDay
    if totalMin < 0 {
        totalMin += minPerDay // minPerDay - abs(newMin)
    }
    return Clock{totalMin % minPerDay}
}

func (c Clock) Add(min int) Clock {
    return New(0, c.minutes+min)
}

func (c Clock) String() string {
    return fmt.Sprintf("%02d:%02d", c.Hours(), c.Minutes())
}

func (c Clock) Hours() int {
    return c.minutes / minPerHr
}

func (c Clock) Minutes() int {
    return c.minutes % minPerHr
}
