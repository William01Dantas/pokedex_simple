class Pokemon {
  final int id;
  final String name;
  final String sprite;
  final List<dynamic> stats;
  final List types;
  final String color;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
    required this.stats,
    required this.types,
    required this.color,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      sprite: json['sprites']['other']['dream_world']['front_default'],
      stats: json['stats'],
      types: json['types'],
      color: json['color']['name'],
    );
  }
}
