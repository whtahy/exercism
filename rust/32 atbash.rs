pub fn encode(s: &str) -> String {
    atbash_vec(s)
        .chunks(5)
        .map(|x| x.iter().collect::<String>())
        .collect::<Vec<String>>()
        .join(" ")
}

pub fn decode(s: &str) -> String {
    atbash_vec(s).iter().collect()
}

fn atbash_vec(s: &str) -> Vec<char> {
    s.to_lowercase()
        .chars()
        .filter(|ch| ch.is_ascii_alphanumeric())
        .map(|ch| atbash(ch))
        .collect()
}

fn atbash(ch: char) -> char {
    if ch.is_digit(10) {
        return ch;
    }

    (ord('z') - ord(ch) + ord('a')) as char
}

fn ord(ch: char) -> u8 {
    ch as u8
}
