/*
exercism.io go #12

Calculate the number of grains of wheat on a chessboard given that the number
on each square doubles.

There once was a wise servant who saved the life of a prince. The king
promised to pay whatever the servant could dream up. Knowing that the king
loved chess, the servant told the king he would like to have grains of wheat.
One grain on the first square of a chess board. Two grains on the next. Four
on the third, and so on.

There are 64 squares on a chessboard.

Write code that shows:

(a) how many grains were on each square
(b) the total number of grains

#########

For bonus points

Optimize for speed.
Optimize for readability.
*/
package grains

import "errors"

const nSquares = 64

func Square(n int) (uint64, error) {
	if n < 1 || n > nSquares {
		return uint64(n), errors.New("That's no square!")
	}
	// 1 << x = 2 ** x
	return 1 << uint(n-1), nil
}

func Total() uint64 {
	/*
		geometric series
		a * (1 - r ** n) / (1 - r) = (1 - 2 ** 64) / (1 - 2)
		                           = 2 ** 64 - 1
		                           = MaxUint64
	*/
	return 18446744073709551615 // 1<<64 - 1
}
