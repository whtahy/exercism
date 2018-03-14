pub fn series(_digits: &str, _len: usize) -> Vec<String> {
    if _len == 0 {
        return vec!["".to_string(); _digits.len() + 1]
    }

    _digits
        .chars()
        .collect::<Vec<_>>()
        .windows(_len)
        .map(|s| s.iter().collect())
        .collect()
}
