pub fn encode(s: &str) -> String {
    let mut code = String::new();
    let mut n = 1;
    let v = s.chars().collect::<Vec<_>>();
    for i in 0..v.len() {
        if v.get(i) == v.get(i + 1) {
            n += 1;
        } else {
            if n > 1 {
                code.push_str(&n.to_string());
            }
            code.push(v[i]);
            n = 1;
        }
    }

    code
}

pub fn decode(code: &str) -> String {
    let mut s = String::new();
    let mut n = String::new();
    for ch in code.chars() {
        if ch.is_digit(10) {
            n.push(ch);
        } else if n.is_empty() {
            s.push(ch);
        } else {
            let r = n.parse().unwrap();
            s.push_str(&ch.to_string().repeat(r));
            n.clear();
        }
    }

    s
}
