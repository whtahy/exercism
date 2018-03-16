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
