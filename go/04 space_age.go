package space

type Planet = string

const secPerEarthyear = 31557600

// earth-year per planet-year
var periodMap = map[Planet]float64{
    "Earth":   1,
    "Jupiter": 11.8626215,
    "Mars":    1.8808158,
    "Mercury": 0.2408467,
    "Neptune": 164.79132,
    "Saturn":  29.447498,
    "Uranus":  84.016846,
    "Venus":   0.61519726,
}

func Age(sec float64, planet Planet) float64 {
    // sec * (earth-yr / sec) * (planet-yr / earth-yr) -> planet-yr
    return sec / secPerEarthyear / periodMap[planet]
}
