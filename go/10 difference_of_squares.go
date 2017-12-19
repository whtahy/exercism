/*
exercism.io go #10

Find the difference between the square of the sum and the sum of the squares of
the first N natural numbers.

The square of the sum of the first ten natural numbers is
(1 + 2 + ... + 10)**2 = 55**2 = 3025.

The sum of the squares of the first ten natural numbers is
1**2 + 2**2 + ... + 10**2 = 385.

Hence the difference between the square of the sum of the first
ten natural numbers and the sum of the squares of the first ten
natural numbers is 3025 - 385 = 2640.
*/
package diffsquares

func ConsecSum(n int) int {
	return n * (n + 1) / 2
}

func SquareOfSums(n int) int {
	sum := ConsecSum(n)
	return sum * sum
}

func SumOfSquares(n int) int {
	return n * (n + 1) * (2*n + 1) / 6
}

func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
