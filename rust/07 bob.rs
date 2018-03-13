pub fn reply(msg: &str) -> &str {
    let msg = msg.trim();

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

    msg.ends_with('?')
}

    let upper = msg.to_uppercase();
    upper == msg && upper != msg.to_lowercase()
}