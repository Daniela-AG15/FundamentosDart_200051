void main()
{
  // Repaso de clases 

  //Instanciamos la Clase Hero 
  print("Hero 1:--------------------------------------------------------------");
  final wolverine=Hero("Logan","Regeneracion");
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);

  final scarletWitch=Hero("Magia del Caos","Wanda");
  print("Hero 2:--------------------------------------------------------------");
  print(scarletWitch);
  print(scarletWitch.name);
  print(scarletWitch.power);

  final xmen=Team(type:"Heroes",name:"X-Men");
  print(xmen);
  print(xmen.name);
  print(xmen.type);

  final justiceLeague=Team(name:"La liga de la justicia");
  print(justiceLeague);
  print(justiceLeague.name);
  print(justiceLeague.type);

  //Intetamos Inicializar la clase con solo el valor tipo que no lo permite por que la propiedad de nombre es requerida 
  //final hydra=Team(type: "Villanos");
  
}
//Valores Posicionales


class Hero
{
  String name;
  String power;
// inicializacion del constructor 
  Hero(String pName, String pPower):
    name=pName,
    power=pPower;
}

// Clase con propiedades no posicionales y nombradas
class Team
{
  String name;
  String type;

  //El constructor de la clase siempre debe llevar el mismo nombre
  Team({required this.name, this.type="No definido."});
}