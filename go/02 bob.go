/*
exercism.io go #2

Bob is a lackadaisical teenager. In conversation, his responses are very limited.

Bob answers 'Sure.' if you ask him a question.

He answers 'Whoa, chill out!' if you yell at him.

He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

He says 'Fine. Be that way!' if you address him without actually saying anything.

He answers 'Whatever.' to anything else.
*/
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
