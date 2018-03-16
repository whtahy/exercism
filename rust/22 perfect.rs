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
    (1..n).filter(|x| n % x == 0).sum()
}
