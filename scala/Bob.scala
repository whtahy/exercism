object Bob {
  def response(s: String): String = {
    val x = s.filter(!_.isWhitespace)

    if (x.isEmpty) "Fine. Be that way!"
    else if (question(x) & shout(x)) "Calm down, I know what I'm doing!"
    else if (question(x)) "Sure."
    else if (shout(x)) "Whoa, chill out!"
    else "Whatever."
  }

  def question (s: String): Boolean = s.endsWith("?")
  def shout (s: String): Boolean = {
    val x = s.filter(_.isLetter)
    !x.isEmpty & x.forall(_.isUpper)
  }
}
