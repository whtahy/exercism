pub fn hamming_distance(a: &str, b: &str) -> Result<u64, &'static str> {
    if a.len() != b.len() {
        return Err("length mismatch!");
    }

    let x = a.chars().zip(b.chars()).filter(|&(x, y)| x != y).count();
    Ok(x as u64)
}
