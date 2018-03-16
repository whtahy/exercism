package bob

import (
    "regexp"
    "strings"
)

var reAlpha = regexp.MustCompile("[a-zA-Z]")

func Hey(remark string) string {
    remark = strings.TrimSpace(remark)
    if isShoutQuery(remark) {
        return "Calm down, I know what I'm doing!"
    } else if isShout(remark) {
        return "Whoa, chill out!"
    } else if isQuery(remark) {
        return "Sure."
    } else if isMute(remark) {
        return "Fine. Be that way!"
    } else {
        return "Whatever."
    }
}

func isShoutQuery(remark string) bool {
    return isShout(remark) && isQuery(remark)
}

func isShout(remark string) bool {
    return remark == strings.ToUpper(remark) && reAlpha.MatchString(remark)
}

func isQuery(remark string) bool {
    return strings.HasSuffix(remark, "?")
}

func isMute(remark string) bool {
    return remark == ""
}
