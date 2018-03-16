package gigasecond

import "time"

const gigasec = time.Second * 1e9

func AddGigasecond(start time.Time) time.Time {
    return start.Add(gigasec)
}
