void main() {
  final windPlant = windEnergyPlant(energyLeft: 100);
  windPlant.turnOn();
  windPlant.consumeEnergy(20);
  chargePhone(windPlant);
  windPlant.turnOff();
}

double chargePhone(EnergyPlant plant) {
  plant.turnOn();
  plant.consumeEnergy(10);
  plant.turnOff();
  return 10;
}

enum PlantType { wind, solar, hydro }

abstract class EnergyPlant {
  double energyLeft;
  PlantType type;

  EnergyPlant({required this.energyLeft, required this.type});

  void consumeEnergy(double amount);
  void turnOn();
  void turnOff();
}

class windEnergyPlant extends EnergyPlant {
  windEnergyPlant({required double energyLeft})
      : super(energyLeft: energyLeft, type: PlantType.wind) {
    print('Wind plant created with $energyLeft energy left');
  }

  @override
  void consumeEnergy(double amount) {
    if (amount > energyLeft) {
      print('Not enough energy left');
      return;
    }
    energyLeft -= amount;
    print('Energy left: $energyLeft');
  }

  @override
  void turnOn() {
    print('Wind plant is on');
  }

  @override
  void turnOff() {
    print('Wind plant is off');
  }
}
