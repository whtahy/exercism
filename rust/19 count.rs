const NAMES: [&str; 6] = [
    "thousand",
    "million",
    "billion",
    "trillion",
    "quadrillion",
    "quintillion",
];

pub fn encode(mut x: u64) -> String {
    if x == 0 {
        return "zero".to_string();
    }

    let m = (x as f64).log10() as u32 / 3;

    let mut v = Vec::new();
    for i in (0..m + 1).rev() {
        let n = x / 10_u64.pow(i * 3);
        if n > 0 {
            v.push(hundreds(n));
            if i > 0 {
                v.push(NAMES[i as usize - 1].to_string());
            }
        }
        x %= 10_u64.pow(i * 3);
    }
    v.join(" ")
}

fn hundreds(x: u64) -> String {
    match x {
        0...99 => tens(x),
        _ if x % 100 == 0 => format!("{} hundred", smalls(x / 100)),
        _ => format!("{} hundred {}", smalls(x / 100), tens(x % 100)),
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
        _ => panic!("Ha ha ha!"),
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
