pub fn is_valid(s: &str) -> bool {
    let mut v = Vec::new();
    for ch in s.chars() {
        if ch.is_digit(10) {
            v.push(ch.to_digit(10).unwrap() as usize);
        } else if ch.is_whitespace() {
            continue;
        } else {
            return false;
        }
    }

    if v.len() <= 1 {
        return false;
    }

    let sum = v.iter()
        .rev()
        .enumerate()
        .fold(0, |sum, (i, x)| sum + transform(*x, i % 2 == 1));

    sum % 10 == 0
}

fn transform(x: usize, double: bool) -> usize {
    if double {
        x * 2 - 9 * (x >= 5) as usize
    } else {
        x
    }
}
