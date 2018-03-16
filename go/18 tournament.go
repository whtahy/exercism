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
