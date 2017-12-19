/*
exercism.io go #8

Given a word, compute the scrabble score for that word.

Letter                           Value
A, E, I, O, U, L, N, R, S, T         1
D, G                                 2
B, C, M, P                           3
F, H, V, W, Y                        4
K                                    5
J, X                                 8
Q, Z                                10
*/
package scrabble

import "strings"

var letterMap = map[rune]int{
	'A': 1,
	'B': 3,
	'C': 3,
	'D': 2,
	'E': 1,
	'F': 4,
	'G': 2,
	'H': 4,
	'I': 1,
	'J': 8,
	'K': 5,
	'L': 1,
	'M': 3,
	'N': 1,
	'O': 1,
	'P': 3,
	'Q': 10,
	'R': 1,
	'S': 1,
	'T': 1,
	'U': 1,
	'V': 4,
	'W': 4,
	'X': 8,
	'Y': 4,
	'Z': 10,
}

func Score(word string) int {
	score := 0
	runes := []rune(strings.ToUpper(word))
	for _, letter := range letters {
		score += letterMap[letter]
	}
	return score
}
