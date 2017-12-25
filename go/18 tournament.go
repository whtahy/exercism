/*
exercism.io go #18

Tally the results of a small football competition.

Based on an input file containing which team played against which and what
the outcome was, create a file with a table like this:

Team                           | MP |  W |  D |  L |  P
Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
Blithering Badgers             |  3 |  1 |  0 |  2 |  3
Courageous Californians        |  3 |  0 |  1 |  2 |  1

MP: Matches Played
W: Matches Won
D: Matches Drawn (Tied)
L: Matches Lost
P: Points

A win earns a team 3 points. A draw earns 1. A loss earns 0.

The outcome should be ordered by points, descending. In case of a tie, teams
are ordered alphabetically.

Input

Your tallying program will receive input that looks like:

Allegoric Alaskans;Blithering Badgers;win
Devastating Donkeys;Courageous Californians;draw
Devastating Donkeys;Allegoric Alaskans;win
Courageous Californians;Blithering Badgers;loss
Blithering Badgers;Devastating Donkeys;loss
Allegoric Alaskans;Courageous Californians;win

The result of the match refers to the first team listed.

Allegoric Alaskans;Blithering Badgers;win
Means that the Allegoric Alaskans beat the Blithering Badgers.

Courageous Californians;Blithering Badgers;loss
Means that the Blithering Badgers beat the Courageous Californians.

Devastating Donkeys;Courageous Californians;draw
Means that the Devastating Donkeys and Courageous Californians tied.
*/
package tournament

import (
	"bufio"
	"errors"
	"fmt"
	"io"
	"sort"
	"strings"
)

type teamStats struct {
	mp, w, d, l, p int
}

const (
	header = "Team                           | MP |  W |  D |  L |  P\n"
	format = "%-30s |%3d |%3d |%3d |%3d |%3d\n"
)

var pointMap = map[string]int{
	"w": 3, // win
	"d": 1, // draw
	"l": 0, // loss
}

var teamnameSlice = []string{
	"Allegoric Alaskians",
	"Blithering Badgers",
	"Courageous Californians",
	"Devastating Donkeys",
}

func Tally(rdr io.Reader, wtr io.Writer) error {
	leaderboard := map[string]*teamStats{}
	for _, name := range teamnameSlice {
		leaderboard[name] = &teamStats{}
	}

	scanner := bufio.NewScanner(rdr)

	for scanner.Scan() {
		line := scanner.Text()

		// skip comments and empty lines
		if strings.HasPrefix(line, "#") || len(line) == 0 {
			continue
		}

		scoreSlice := strings.Split(line, ";")

		// hardcode 3 pieces
		if len(scoreSlice) != 3 {
			return errors.New("invalid input")
		}

		teamL := scoreSlice[0]
		teamR := scoreSlice[1]

		switch scoreSlice[2] {
		case "win": // teamL win
			leaderboard[teamL].w += 1
			leaderboard[teamL].p += pointMap["w"]
			leaderboard[teamR].l += 1
			leaderboard[teamR].p += pointMap["l"]
		case "draw":
			leaderboard[teamL].d += 1
			leaderboard[teamL].p += pointMap["d"]
			leaderboard[teamR].d += 1
			leaderboard[teamR].p += pointMap["d"]
		case "loss": // teamL loss
			leaderboard[teamL].l += 1
			leaderboard[teamL].p += pointMap["l"]
			leaderboard[teamR].w += 1
			leaderboard[teamR].p += pointMap["w"]
		default:
			return errors.New("invalid input")
		}

		leaderboard[teamL].mp += 1
		leaderboard[teamR].mp += 1
	}

	sort.Slice(teamnameSlice,
		func(l, r int) bool {
			teamL := teamnameSlice[l]
			teamR := teamnameSlice[r]
			pointsL := leaderboard[teamL].p
			pointsR := leaderboard[teamR].p
			if pointsL == pointsR {
				// alphabetical order in case of tie
				return strings.Compare(teamL, teamR) == -1
			}
			return pointsL > pointsR // bigger is better
		})

	io.WriteString(wtr, header)
	for _, team := range teamnameSlice {
		fmt.Fprintf(wtr,
			format,
			team,
			leaderboard[team].mp,
			leaderboard[team].w,
			leaderboard[team].d,
			leaderboard[team].l,
			leaderboard[team].p)
	}

	return nil
}
