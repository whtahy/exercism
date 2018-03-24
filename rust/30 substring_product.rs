#[derive(Debug, Eq, PartialEq)]
pub enum LspError {
    BadString,
    BadSpan,
}

pub fn lsp(s: &str, n: u64) -> Result<u64, LspError> {
    let mut v = Vec::new();
    for ch in s.chars() {
        match ch.to_digit(10) {
            Some(x) => v.push(u64::from(x)),
            None => return Err(LspError::BadString),
        }
    }

    if n == 0 {
        return Ok(1);
    }

    v.windows(n as usize)
        .map(|x| x.iter().product())
        .max()
        .ok_or(LspError::BadSpan)
}
