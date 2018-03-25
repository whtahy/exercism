use std::collections::HashMap;

pub fn word_count(s: &str) -> HashMap<String, u32> {
    let mut h = HashMap::new();

    let s = s.to_lowercase()
        .chars()
        .filter(|x| x.is_alphanumeric() || x.is_whitespace())
        .collect::<String>();

    for word in s.split_whitespace() {
        *h.entry(word.to_string()).or_insert(0) += 1;
    }

    h
}
