void main() {
  // Se crea una planta de energía eólica con 100 unidades de energía iniciales
  final windPlant = WindPlant(initialEnergy: 100);
  // Se crea una planta de energía nuclear con 1000 unidades de energía disponibles
  final nuclearPlant = NuclearPlant(energyLeft: 1000);

  // Se imprime la energía restante después de cargar un teléfono con la planta eólica
  print('wind: ${chargePhone(windPlant)}');
  // Se imprime la energía restante después de cargar un teléfono con la planta nuclear
  print('nuclear: ${chargePhone(nuclearPlant)}');
}

// Función que simula la carga de un teléfono usando una planta de energía
double chargePhone(EnergyPlant plant) {
  // Verifica si hay suficiente energía; si no, lanza una excepción
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }
  // Consume 10 unidades de energía de la planta
  plant.consumeEnergy(10);
  // Retorna la energía restante en la planta
  return plant.energyLeft;
}

// Enumeración que define los tipos de plantas de energía
enum PlantType { nuclear, wind, water }

// Clase abstracta que representa una planta de energía
abstract class EnergyPlant {
  double energyLeft; // Energía restante en la planta
  final PlantType type; // Tipo de planta de energía

  // Constructor que inicializa la energía y el tipo de planta
  EnergyPlant({
    required this.energyLeft,
    required this.type,
  });

  // Método abstracto para consumir energía
  void consumeEnergy(double amount);
}

// Clase que representa una planta de energía eólica
class WindPlant extends EnergyPlant {
  // Constructor que inicializa la energía inicial
  WindPlant({required double initialEnergy})
      : super(energyLeft: initialEnergy, type: PlantType.wind);

  // Implementación del método para consumir energía
  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount; // Reduce la energía restante
  }
}

// Clase que representa una planta de energía nuclear
class NuclearPlant extends EnergyPlant {
  // Constructor que inicializa la energía restante
  NuclearPlant({required double energyLeft})
      : super(energyLeft: energyLeft, type: PlantType.nuclear);

  // Implementación del método para consumir energía, con un factor de eficiencia
  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5); // Consume la mitad de la cantidad
  }
}
