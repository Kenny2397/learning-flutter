void main() {
  // final windPlant = EnergyPlant();
  // windPlant.turnOn();
  // windPlant.turnOff();
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
