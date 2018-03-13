// Credit to: https://github.com/canmom
// Adapted from: http://exercism.io/submissions/82a6e42ee2804784a721a15fe8aa2e76

extern crate unicode_segmentation;

use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    input.graphemes(true).rev().collect()
}
