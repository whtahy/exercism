pub fn raindrops(n: usize) -> String {
    let div = |x| n % x == 0;
    let mut string = String::new();

    if div(3) {
        string.push_str("Pling");
    }
    if div(5) {
        string.push_str("Plang");
    }
    if div(7) {
        string.push_str("Plong");
    }

    if string.is_empty() {
        n.to_string()
    } else {
        string
    }
}
