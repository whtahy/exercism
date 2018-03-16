pub fn is_valid_isbn(isbn: &str) -> bool {
    let mut iter = isbn.chars().filter(|&x| x.is_digit(10) || x == 'X');

    let mut n = 0;
    for i in 0.. {
        if i > 10 {
            return false;
        }

        let x = iter.next();

        if x.is_none() {
            if i == 10 {
                break;
            } else {
                return false;
            }
        }

        let x = x.unwrap();

        if x != 'X' {
            n += x.to_digit(10).unwrap() * (10 - i);
        } else if i == 9 {
            n += 10;
        } else {
            return false;
        }
    }

    n % 11 == 0
}
