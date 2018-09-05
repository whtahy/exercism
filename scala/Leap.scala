object Leap {
  def leapYear(x: Int): Boolean =
    multipleOf(x, 400) | multipleOf(x, 4) & !multipleOf(x, 100)

  def multipleOf(x: Int, y: Int): Boolean =
    x % y == 0
}
