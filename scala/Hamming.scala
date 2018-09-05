object Hamming {
  def distance(a: String, b: String): Option[Int] =
    if (a.length != b.length) None
    else Some(ham(a, b))

  def ham(a: String, b: String): Int =
    if (a.isEmpty) 0
    else if (a.head == b.head) ham(a.tail, b.tail)
    else 1 + ham(a.tail, b.tail)
}
