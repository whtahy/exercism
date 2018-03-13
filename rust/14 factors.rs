pub fn factors(mut n: u64) -> Vec<u64> {
    let mut i = 2;
    let mut v = Vec::new();

    while n > 1 {
        while n % i == 0 {
            n /= i;
            v.push(i);
        }
        i += 1;
    }

    v
}
