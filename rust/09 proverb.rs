pub fn build_proverb(v: Vec<&str>) -> String {
    let mut s = String::new();

    if v.is_empty() {
        return s
    }

    for i in 1..v.len() {
        s.push_str(&format!(
            "For want of a {} the {} was lost.\n",
            v[i - 1],
            v[i]
        ));
    }

    s + &format!("And all for the want of a {}.", v[0])
}
