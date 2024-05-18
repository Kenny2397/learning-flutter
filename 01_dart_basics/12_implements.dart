void main() {
  final windPlant = windEnergyPlant(energyLeft: 100);
  windPlant.turnOn();
  windPlant.consumeEnergy(20);
  chargePhone(plant: windPlant, time: 10);
  windPlant.turnOff();

  final nuclearPlant = nuclearEnergyPlant(energyLeft: 200);
  nuclearPlant.turnOn();
  chargePhone(plant: nuclearPlant, time: 10);
}

double chargePhone({required EnergyPlant plant, required double time}) {
  print('charging phone with $time hours of energy from ${plant.type} plant');
  plant.turnOn();
  plant.consumeEnergy(time);
  plant.turnOff();
  return 10;
}

Map<String, double> energyEfficiency = {
  'wind': 0.8,
  'solar': 0.6,
  'hydro': 0.7,
  'nuclear': 0.5
};

enum PlantType { wind, solar, hydro, nuclear }

abstract class EnergyPlant {
  double energyLeft;
  final PlantType type;

  EnergyPlant({required this.energyLeft, required this.type});

  double calculateEnergyWithTime(double time);
  void consumeEnergy(double time);
  void turnOn();
  void turnOff();
}

class windEnergyPlant extends EnergyPlant {
  windEnergyPlant({required double energyLeft})
      : super(energyLeft: energyLeft, type: PlantType.wind) {
    print('Wind plant created with $energyLeft energy left');
  }

  @override
  void consumeEnergy(double time) {
    final amount = calculateEnergyWithTime(time);
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

  @override
  double calculateEnergyWithTime(double time) {
    return time * energyEfficiency['wind']!;
  }
}

class nuclearEnergyPlant implements EnergyPlant {
  @override
  double energyLeft;

  @override
  final PlantType type = PlantType.nuclear;

  nuclearEnergyPlant({required this.energyLeft}) {
    print('Nuclear plant created with $energyLeft energy left');
  }

  @override
  void consumeEnergy(double time) {
    final amount = calculateEnergyWithTime(time);
    if (amount > energyLeft) {
      print('Not enough energy left');
      return;
    }
    energyLeft -= (amount);
    print('Energy left: $energyLeft');
  }

  @override
  void turnOn() {
    print('Nuclear plant is on');
  }

  @override
  void turnOff() {
    print('Nuclear plant is off');
  }

  @override
  double calculateEnergyWithTime(double time) {
    return time * energyEfficiency['nuclear']!;
  }
}
