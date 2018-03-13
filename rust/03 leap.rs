pub fn is_leap_year(year: i32) -> bool {
    let div = |x| year % x == 0;

    if year < 0 {
        false
    } else if div(400) {
        true
    } else if div(100) {
        false
    } else {
        div(4)
    }
}
