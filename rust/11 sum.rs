// Credit to: https://github.com/pravic
// Adapted from: http://exercism.io/submissions/26f3accc50354546b3992a3243c2abd6

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let factor = |x: &u32| -> bool {
        factors.iter().any(|y| x % y == 0)
    };

    (1..limit).filter(factor).sum()
}
