extern crate chrono;

use chrono::{DateTime, Duration, Utc};

pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    start + Duration::seconds(10_i64.pow(9))
}
