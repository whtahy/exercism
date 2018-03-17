use std::cmp::Ordering::{Equal, Greater, Less};
use Classification::{Abundant, Deficient, Perfect};

#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Deficient,
    Perfect,
}

pub fn classify(n: u64) -> Option<Classification> {
    if n == 0 {
        return None;
    }

    match aliquot_sum(n).cmp(&n) {
        Less => Some(Deficient),
        Equal => Some(Perfect),
        Greater => Some(Abundant),
    }
}

fn aliquot_sum(n: u64) -> u64 {
    if n == 1 {
        return 0;
    }

    let lim = (n as f64).sqrt().ceil() as u64;
    (2..lim)
        .filter(|x| n % x == 0)
        .map(|x| x + n / x)
        .sum::<u64>() + 1
}
