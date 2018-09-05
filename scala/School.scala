import scala.collection.immutable.SortedMap

class School {
  type DB = Map[Int, Seq[String]]

  var db: DB = Map().withDefaultValue(Seq())

  def add(name: String, g: Int) = db += g -> (grade(g) :+ name)
  def grade(g: Int): Seq[String] = db(g)
  def sorted: DB = SortedMap[Int, Seq[String]]() ++ db.mapValues(_.sorted)
}
