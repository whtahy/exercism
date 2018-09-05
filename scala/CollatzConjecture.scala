object CollatzConjecture {
  def steps(x: Int): Option[Int] =
    if (x <= 0) None
    else Some(step(x))

  def step(x: Int): Int =
    if (x == 1) 0
    else {
      if (x % 2 == 0) 1 + step(x/2)
      else 1 + step(3*x+1)
    }
}
