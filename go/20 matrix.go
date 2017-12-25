/*
exercism.io go #20

Given a string representing a matrix of numbers, return the rows and columns
of that matrix.

Your code should be able to return:

A list of the rows, left-to-right, top-to-bottom.
A list of the cols, left-to-right, top-to-bottom.

Example matrix:

9 8 7
5 3 2
6 6 7

Rows:

[9, 8, 7]
[5, 3, 2]
[6, 6, 7]

Columns:

[9, 5, 6]
[8, 3, 6]
[7, 2, 7]
*/
package matrix

import (
	"errors"
	"strconv"
	"strings"
)

type Mat [][]int

func New(s string) (Mat, error) {
	rows := strings.Split(s, "\n")
	m := make(Mat, len(rows))
	for i, r := range rows {
		rowSlice := strings.Split(strings.TrimSpace(r), " ")
		for _, numStr := range rowSlice {
			num, err := strconv.Atoi(numStr)
			if err != nil {
				return nil, err
			}
			m[i] = append(m[i], num)
		}
		if len(m[i]) != len(m[0]) {
			return nil, errors.New("invalid input: row length mismatch")
		}
	}
	return m, nil
}

func (m Mat) Rows() [][]int {
	kopy := makeSliceMat(len(m), len(m[0]))
	for r := range kopy {
		for c := range kopy[0] {
			kopy[r][c] = m[r][c] // copy
		}
	}
	return kopy
}

func (m Mat) Cols() [][]int {
	kopy := makeSliceMat(len(m[0]), len(m))
	for r := range kopy {
		for c := range kopy[0] {
			kopy[r][c] = m[c][r] // transpose
		}
	}
	return kopy
}

func (m Mat) Set(row, col, val int) bool {
	if row < 0 || row >= len(m) || col < 0 || col >= len(m[0]) {
		return false // index out of bounds
	}
	m[row][col] = val
	return true // success!
}

func makeSliceMat(nrows, ncols int) [][]int {
	square := make([][]int, nrows)
	for i := range square {
		square[i] = make([]int, ncols)
	}
	return square
}
