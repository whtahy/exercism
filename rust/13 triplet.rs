pub fn find() -> Option<u32> {
    let n = 1000;
    for i in 1.. {
        for j in i + 1..(n - i) / 2 {
            let k = n - i - j;
            if i*i + j*j == k*k {
                return Some(i * j * k)
            }
        }
    }

    None
}
