object Etl {
  def transform(m: Map[Int, Seq[String]]): Map[String, Int] =
    m.keys.map(k => m(k).map(v => (v.toLowerCase, k))).flatten.toMap
}
