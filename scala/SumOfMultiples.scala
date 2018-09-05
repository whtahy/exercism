object SumOfMultiples {
  def sum(factors: Set[Int], limit: Int): Int =
    (1 until limit).map(f(_, factors)).sum

  def f(x: Int, factors: Set[Int]): Int =
    if (factors.exists(x % _ == 0)) x
    else 0
}
