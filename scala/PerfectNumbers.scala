object PerfectNumbers {
  def classify(x: Int): Either[String, NumberType.NumberType] = {
    if (x <= 0) Left("Classification is only possible for natural numbers.")
    else {
      val w = aliquotSum(x)
      if (w < x) Right(NumberType.Deficient)
      else if (x == w) Right(NumberType.Perfect)
      else Right(NumberType.Abundant)
    }
  }

  def aliquotSum(x: Int): Int =
    if (x == 1) 0
    else (1 to x/2).filter(x % _ == 0).sum
}

object NumberType extends Enumeration {
  type NumberType = Value
  val Deficient, Perfect, Abundant = Value
}
