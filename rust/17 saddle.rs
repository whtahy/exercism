#[macro_use] extern crate itertools;

pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    if input.is_empty() {
        return Vec::new()
    }

    let n_rows = input.len();
    let n_cols = input[0].len();

    let check_row = |i: usize, j: usize| -> bool {
        (0..n_cols).all(|x| input[i][j] >= input[i][x])
    };

    let check_col = |i: usize, j: usize| -> bool {
        (0..n_rows).all(|x| input[i][j] <= input[x][j])
    };

    iproduct!(0..n_rows, 0..n_cols)
        .filter(|&(i,j)| check_row(i,j) && check_col(i,j))
        .collect()
}
