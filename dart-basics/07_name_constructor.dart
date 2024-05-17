void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'Spiderman',
    'power': 'trepar paredes',
    'isAlive': true
  };

  // final ironman =
  //     Hero(name: 'Tony Stark', power: 'Inteligencia', isAlive: false);
  final ironman = Hero.fromJson(rawJson);

  print(ironman);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({required this.name, this.power = 'Sin poder', this.isAlive = true});

  Hero.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'Sin nombre',
        power = json['power'] ?? 'Sin poder',
        isAlive = json['isAlive'] ?? false;

  @override
  String toString() {
    return '$name - $power - vivo: ${isAlive ? 'Sí' : 'Nope'}';
  }
}
