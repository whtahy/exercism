class Accumulate {
  def accumulate[A, B](f: (A) => B, list : List[A]): List[B] =
    if (list.isEmpty) List()
    else f(list.head) +: accumulate(f, list.tail)
}
