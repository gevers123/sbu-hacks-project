class Asteroid {
  final String name;

  Asteroid({
    required this.name,
  });

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    var asteroidList = json['near_earth_objects'] as List;
    return Asteroid(name: asteroidList[0]['name']);
  }
}
