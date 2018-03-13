pub fn reply(msg: &str) -> &str {
    let msg = msg.trim();
    if msg.is_empty() {
        "Fine. Be that way!"
    } else if query(msg) && shout(msg) {
        "Calm down, I know what I'm doing!"
    } else if query(msg) {
        "Sure."
    } else if shout(msg) {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}
fn query(msg: &str) -> bool {
    msg.ends_with('?')
}
fn shout(msg: &str) -> bool {
    let upper = msg.to_uppercase();
    upper == msg && upper != msg.to_lowercase()
}
