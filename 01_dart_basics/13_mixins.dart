abstract class Animal {
  void eat() {
    print('Animal is eating');
  }
}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

mixin class Volador {
  void volar() {
    print('Estoy volando');
  }
}

mixin class Caminante {
  void caminar() {
    print('Estoy caminando');
  }
}

mixin class Nadador {
  void nadar() {
    print('Estoy nadando');
  }
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Caminante, Volador {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Volador {}

class Pato extends Ave with Volador, Nadador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Nadador, Volador {}

void main() {
  final delfin = Delfin();
  delfin.nadar();

  final murcielago = Murcielago();
  murcielago.caminar();
  murcielago.volar();

  final gato = Gato();
  gato.caminar();

  final paloma = Paloma();
  paloma.volar();

  final pato = Pato();
  pato.volar();
  pato.nadar();

  final tiburon = Tiburon();
  tiburon.nadar();

  final pezVolador = PezVolador();
  pezVolador.nadar();
  pezVolador.volar();
}
