// Sieve of Erathosthenes
// Adapted from: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

pub fn nth(n: u32) -> Option<u32> {
    let n = n as usize;
    if n == 0 {
        None
    } else if n <= 6 {
        Some(sieve(100)[n - 1])
    } else {
        Some(sieve(upper_bound(n))[n - 1])
    }
}

fn sieve(n: u32) -> Vec<u32> {
    let n = n as usize;
    let l = (n as f64).sqrt().ceil() as usize;

    let mut v = vec![true; n];

    for i in 2..l {
        if v[i] {
            let mut j = i * i;
            while j < n {
                v[j] = false;
                j += i;
            }
        }
    }

    let mut out = Vec::new();
    for i in 2..n {
        if v[i] {
            out.push(i as u32);
        }
    }

    out
}

fn upper_bound(n: usize) -> u32 {
    let x = n as f64;
    (x * (x.ln() + x.ln().ln())).ceil() as u32
}
