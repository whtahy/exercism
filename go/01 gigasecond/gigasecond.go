/*
exercism.io go #1

Calculate the moment when someone has lived for 10**9 seconds.

A gigasecond is 10**9 (1,000,000,000) seconds.
*/
package gigasecond

import "time"

const gigasec = time.Second * 1e9

func AddGigasecond(start time.Time) time.Time {
	return start.Add(gigasec)
}
