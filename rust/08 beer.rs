// Credit to: https://github.com/k-hamada
// Adapted from: http://exercism.io/submissions/421bee32ae4a4d25b4f209c2b5b7c25f

pub fn sing(start: u32, end: u32) -> String {
    (end..start + 1)
        .rev()
        .map(verse)
        .collect::<Vec<String>>()
        .join("\n")
}

pub fn verse(i: u32) -> String {
    match i {
        3...99 => format!(
            "{0} bottles of beer on the wall, \
             {0} bottles of beer.\n\
             Take one down and pass it around, \
             {1} bottles of beer on the wall.\n",
            i,
            i - 1
        ),
        2 => format!(
            "{0} bottles of beer on the wall, \
             {0} bottles of beer.\n\
             Take one down and pass it around, \
             {1} bottle of beer on the wall.\n",
            i,
            i - 1
        ),
        1 => "1 bottle of beer on the wall, \
              1 bottle of beer.\n\
              Take it down and pass it around, \
              no more bottles of beer on the wall.\n"
            .to_string(),
        0 => "No more bottles of beer on the wall, \
              no more bottles of beer.\n\
              Go to the store and buy some more, \
              99 bottles of beer on the wall.\n"
            .to_string(),
        _ => panic!("At the disco!"),
    }
}
