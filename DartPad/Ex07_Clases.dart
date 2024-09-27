void main() {
  // Repaso de clases 

  // Instanciamos la Clase Hero 
  print("Hero 1:--------------------------------------------------------------");
  final wolverine = Hero("Logan", "Regeneración");
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);

  final scarletWitch = Hero("Wanda", "Magia del Caos");
  print("Hero 2:--------------------------------------------------------------");
  print(scarletWitch);
  print(scarletWitch.name);
  print(scarletWitch.power);

  final xmen = Team(type: "Heroes", name: "X-Men");
  print(xmen);
  print(xmen.name);
  print(xmen.type);

  final justiceLeague = Team(name: "La liga de la justicia");
  print(justiceLeague);
  print(justiceLeague.name);
  print(justiceLeague.type);

  final brotherhood = Team(name: "The Brotherhood of Evil Mutants");
  print("----------------------------------");
  print(brotherhood.name);
  print(brotherhood.type);
  // Invocando al método reescrito con @override
  print(brotherhood.toString());

  // Intentamos inicializar la clase con solo el valor tipo que no lo permite porque la propiedad de nombre es requerida 
  // final hydra = Team(type: "Villanos");
}

// Valores Posicionales
class Hero {
  String name;
  String power;

  // Inicialización del constructor 
  Hero(String pName, String pPower)
      : name = pName,
        power = pPower;

  @override
  String toString() {
    return 'Hero: $name, Poder: $power';
  }
}

// Clase con propiedades no posicionales y nombradas
class Team {
  String name;
  String type;

  // El constructor de la clase siempre debe llevar el mismo nombre
  Team({required this.name, this.type = "No definido."});

  @override
  String toString() {
    return 'Grupo: $name, Tipo: $type';
  }
}
