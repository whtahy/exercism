package acronym

import (
    "regexp"
    "strings"
)

var re = regexp.MustCompile("\\b[a-zA-Z]")

func Abbreviate(phrase string) string {
    words := re.FindAllString(strings.ToUpper(phrase), -1)
    return strings.Join(words, "")
}
