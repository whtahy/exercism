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
