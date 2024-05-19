void main() {
  final square = Square(side: 10);
  print(square.calculateArea());
  square._side = 20;
  print(square.area);
  square.side = 15;
  print(square.area);
}

class Square {
  double _side;

  Square({required double side}) : _side = side;

  double get area => _side * _side;

  void set side(double value) {
    if (value <= 0) {
      throw ('El lado no puede ser menor o igual a 0');
    }
    _side = value;
  }

  double calculateArea() {
    return _side * _side;
  }
}
