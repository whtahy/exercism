object ArmstrongNumbers {
  def isArmstrongNumber(x: Int): Boolean = {
    val d = x.toString.map(_.asDigit)
    x == d.map(Math.pow(_, d.length)).sum
  }
}
