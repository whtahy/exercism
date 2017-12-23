/*
exercism.io go #11

Given a number determine whether or not it is valid per the Luhn formula.

http://rosettacode.org/wiki/Luhn_test_of_credit_card_numbers#Nim

The Luhn algorithm is a simple checksum formula used to validate a variety of
identification numbers, such as credit card numbers and Canadian Social
Insurance Numbers.

The task is to check if a given string is valid.
*/
package luhn

import "strings"

func Valid(id string) bool {
	id = strings.Replace(id, " ", "", -1)

	if len(id) <= 1 {
		return false
	}

	odd := len(id)%2 == 1
	sum := 0
	for _, ru := range id {
		if ru < '0' || ru > '9' {
			return false
		} else {
			n := int(ru - '0')
			if odd {
				sum += n
			} else {
				sum += even(n)
			}
			odd = !odd
		}
	}
	return sum%10 == 0
}

func digitSum(n int) int {
	sum := 0
	for n > 0 {
		sum += n % 10
		n = n / 10
	}
	return sum
}

func even(digit int) int {
	prod := digit * 2
	if prod > 9 {
		return digitSum(prod)
	} else {
		return prod
	}
}
