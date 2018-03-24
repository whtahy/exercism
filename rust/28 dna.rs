use std::collections::HashMap;

const NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'T'];

#[derive(Debug, Eq, PartialEq)]
pub enum DnaError {
    BadString,
    BadChar,
}

pub fn count(ch: char, s: &str) -> Result<usize, DnaError> {
    nucleotide_counts(s).and_then(|h| match h.get(&ch) {
        Some(&x) => Ok(x),
        None => Err(DnaError::BadChar),
    })
}

pub fn nucleotide_counts(s: &str) -> Result<HashMap<char, usize>, DnaError> {
    let mut h = HashMap::new();

    for ch in &NUCLEOTIDES {
        h.insert(*ch, 0);
    }

    for ch in s.chars() {
        if NUCLEOTIDES.contains(&ch) {
            *h.entry(ch).or_insert(0) += 1;
        } else {
            return Err(DnaError::BadString);
        }
    }

    Ok(h)
}
