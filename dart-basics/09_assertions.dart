void main() {
  final square = Square(side: -12);
  print(square.area);
}

class Square {
  double _side;

  Square({required double side})
      : assert(side >= 0, 'El lado no puede ser menor o igual a 0'),
        _side = side;

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
