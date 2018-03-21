use std::fmt;

const MIN_PER_HR: i64 = 60;
const HR_PER_DAY: i64 = 24;
const MIN_PER_DAY: i64 = MIN_PER_HR * HR_PER_DAY;

#[derive(Debug, Eq, PartialEq)]
pub struct Clock(u16);

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let h = self.0 / MIN_PER_HR as u16;
        let m = self.0 % MIN_PER_HR as u16;
        write!(f, "{:02}:{:02}", h, m)
    }
}

impl Clock {
    pub fn new(hr: i64, min: i64) -> Clock {
        Clock(flip(hr * MIN_PER_HR + min))
    }

    pub fn add_minutes(self, min: i64) -> Clock {
        Clock(flip(self.0 as i64 + min))
    }
}

fn flip(min: i64) -> u16 {
    let x = (min % MIN_PER_DAY + MIN_PER_DAY) % MIN_PER_DAY;
    x as u16
}
