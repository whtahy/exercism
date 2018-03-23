pub struct PascalsTriangle(Vec<Vec<u32>>);

impl PascalsTriangle {
    pub fn new(n: u32) -> Self {
        let mut v: Vec<Vec<u32>> = Vec::new();

        for i in 0..n {
            let mut x = Vec::new();
            x.push(1);

            if i >= 2 {
                for j in 1..i {
                    let a = i as usize;
                    let b = j as usize;
                    x.push(v[a - 1][b - 1] + v[a - 1][b]);
                }
            }

            if i >= 1 {
                x.push(1);
            }

            v.push(x);
        }

        Self { 0: v }
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        self.0.clone()
    }
}
