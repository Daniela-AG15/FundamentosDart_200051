void main() {
  final double totalCarList;

  // 1. Llamado de una función sin parámetros 
  greetEveryone();
  
  // 2. Llamado de una función que retorna valores
  // a) Sin almacenar el valor de una variable
  print("Hoy es el día número: ${getDayNumber()} del mes");

  // b) Almacenando el valor de la función en una nueva variable
  final int diaMes = getDayNumber();
  print("En tres días será: ${diaMes + 3}");

  // 3. Llamado de una función con un solo parámetro obligatorio
  // a) Llamado correcto 
  print(greetSomeone("Daniela"));
  
  // b) En caso de que la función esté declarada como dynamic 
  print(greetSomeone("4")); // Cambiado a String
  print(greetSomeone("-315")); // Cambiado a String
  print(greetSomeone("3.1416")); // Cambiado a String
  print(greetSomeone("true")); // Cambiado a String

  print("---------------------------------------------------------------");

  // 3.1 C) Mismo experimento pero ahora con la función con parámetros tipados
  // Descomentar para probar
  /*
  print(greetSomeoneTyped(4)); // Esto generará un error
  print(greetSomeoneTyped(-315)); // Esto generará un error
  print(greetSomeoneTyped(3.1416)); // Esto generará un error
  print(greetSomeoneTyped(true)); // Esto generará un error
  */
  
  // 3.2 
  // print(greetSomeone()); // Esto no se puede ejecutar si no se definen los parámetros, por defecto están definidos como obligatorios

  // 4. Llamado de una función con parámetros opcionales
  // 4.1 Enviando ambos parámetros
  print(greetHourOfDay("Ana", 20));
  
  // 4.2 Solo enviando el obligatorio
  print(greetHourOfDay("Karen", null));
  
  // Solo pueden hacer una sola operacion
  // 5. Funciones Lambda
  var calculaCosto = (double productQuantity, double productPrice, double percentageDiscount) =>
      (productQuantity * productPrice) * (1- percentageDiscount / 100);
  
  double cantidadProducto = 5;
  double precioProducto = 125.50;
  double descuento = 2.5;
  
  print("""
  Costo del producto: ${precioProducto}
  Cantidad: ${cantidadProducto}
  Descuento: ${descuento}
  ------------------------------------------------------------------------------------
  Costo del carrito de compras: ${calculaCosto(cantidadProducto, precioProducto, descuento)}
  """);
}

// Funciones y Parámetros  

// 1. Función sin parámetros, sin retorno de valor
void greetEveryone() {
  print("Hola a Todas y Todos :D");
}

// 2. Función sin parámetros que retorna datos 
int getDayNumber() {
  DateTime now = DateTime.now();
  int day = now.day;
  return day;
}

// 3. Función que recibe un parámetro, en Dart si no se especifica como opcional siempre será obligatorio
String greetSomeone(String personName) {
  return "Hola, $personName";
}

// 3.1 Tipando el parámetro de entrada
String greetSomeoneTyped(String personName) {
  return "Hola $personName";
}

// 4. Función con parámetros opcionales
String greetHourOfDay(String personName, [int? hora]) {
  hora ??= DateTime.now().hour; // Si hora es null, toma la hora actual
  print("Hora: ${hora}");
  String saludo;

  if (hora >= 6 && hora < 12) {
    saludo = "Buenos días";
  } else if (hora >= 12 && hora < 18) {
    saludo = "Buenas tardes";
  } else {
    saludo = "Buenas noches";
  }
  
  return "$saludo, $personName!";
}
