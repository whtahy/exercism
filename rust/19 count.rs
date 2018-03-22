pub fn encode(n: u64) -> String {
    if n == 0 {
        return "zero".to_string();
    }

    chunks(n)
        .iter()
        .filter(|&&(x, _)| x != 0)
        .map(|&x| encode_chunk(x))
        .collect::<Vec<String>>()
        .join(" ")
}

fn encode_chunk((x, p): (u64, u8)) -> String {
    if p == 0 {
        return hundreds(x);
    }
    format!("{} {}", hundreds(x), powers(p))
}

fn chunks(mut n: u64) -> Vec<(u64, u8)> {
    let mut v = Vec::new();

    let m = (n as f64).log10() as u32 / 3;
    for i in (0..m + 1).rev() {
        v.push((n / 10_u64.pow(i * 3), i as u8 * 3));
        n %= 10_u64.pow(i * 3);
    }
    v
}

fn powers(x: u8) -> String {
    match x {
        3 => "thousand",
        6 => "million",
        9 => "billion",
        12 => "trillion",
        15 => "quadrillion",
        18 => "quintillion",
        _ => panic!("Ho, ho, ho!"),
    }.to_string()
}

fn hundreds(x: u64) -> String {
    if x < 100 {
        tens(x)
    } else if x % 100 == 0 {
        format!("{} hundred", smalls(x / 100))
    } else {
        format!("{} hundred {}", smalls(x / 100), tens(x % 100))
    }
}

fn tens(x: u64) -> String {
    if x < 20 {
        return smalls(x);
    }

    let s = match x / 10 {
        2 => "twenty",
        3 => "thirty",
        4 => "forty",
        5 => "fifty",
        6 => "sixty",
        7 => "seventy",
        8 => "eighty",
        9 => "ninety",
        _ => panic!("Ha, ha, ha!"),
    }.to_string();

    if x % 10 == 0 {
        s
    } else {
        format!("{}-{}", s, smalls(x % 10))
    }
}

fn smalls(x: u64) -> String {
    match x {
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        5 => "five",
        6 => "six",
        7 => "seven",
        8 => "eight",
        9 => "nine",
        10 => "ten",
        11 => "eleven",
        12 => "twelve",
        13 => "thirteen",
        14 => "fourteen",
        15 => "fifteen",
        16 => "sixteen",
        17 => "seventeen",
        18 => "eighteen",
        19 => "nineteen",
        _ => panic!("Ah, ah, ah!"),
    }.to_string()
}
