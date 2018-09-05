object FlattenArray {
  def flatten(ls: List[_]): List[_] =
    ls match {
      case Nil                  => Nil
      case null +: xs           => flatten(xs)
      case (x: List[_]) +: xs   => flatten(x) ++ flatten(xs)
      case _                    => ls.head +: flatten(ls.tail)
    }
}
