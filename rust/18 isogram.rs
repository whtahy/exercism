use std::collections::HashSet;

pub fn check(s: &str) -> bool {
    let mut set = HashSet::new();
    for mut ch in s.to_lowercase().chars().filter(|x| x.is_alphabetic()) {
        if set.contains(&ch) {
            return false;
        }
        set.insert(ch);
    }
    true
}
