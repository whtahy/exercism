/*
exercism.io go #3

Convert a phrase to its acronym.

Techies love their TLA (Three Letter Acronyms)!

Help generate some jargon by writing a program that converts a long name like
Portable Network Graphics to its acronym (PNG).
*/
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
