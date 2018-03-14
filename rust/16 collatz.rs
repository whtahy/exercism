pub fn collatz(mut n: u64) -> Option<u64> {
    if n == 0 {
        return None;
    }

    for i in 0.. {
        if n == 1 {
            return Some(i);
        }
        if n % 2 == 0 {
            n /= 2;
        } else {
            n = 3 * n + 1;
        }
    }

    None
}
