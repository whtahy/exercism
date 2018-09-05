object SpaceAge {
  val mercury =   0.2408467
  val venus   =   0.61519726
  val earth   =   1
  val mars    =   1.8808158
  val jupiter =  11.862615
  val saturn  =  29.447498
  val uranus  =  84.016846
  val neptune = 164.79132

  val m: Double = 31557600 // sec / earth-year

  def foo(t: Double, p: Double) = (t * (1/m) * (1/p) * 100).round / 100.0

  def onEarth(t: Double)    = foo(t, earth)
  def onMercury(t: Double)  = foo(t, mercury)
  def onVenus(t: Double)    = foo(t, venus)
  def onMars(t: Double)     = foo(t, mars)
  def onJupiter(t: Double)  = foo(t, jupiter)
  def onSaturn(t: Double)   = foo(t, saturn)
  def onUranus(t: Double)   = foo(t, uranus)
  def onNeptune(t: Double)  = foo(t, neptune)
}