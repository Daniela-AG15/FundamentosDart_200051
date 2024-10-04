void main() {
  final mySquare = Square(side: 18); // Constructor corregido
  
  // Asignando valor negativo (será validado en el setter)
  try {
    mySquare.side = -32; // Se usa el setter para la validación
  } catch (e) {
    print(e); // Manejo de la excepción para valor incorrecto
  }

  print("""
  Lado del Cuadrado: ${mySquare.side}
  Área que ocupa: ${mySquare.calculateArea()}
  """);
}

class Square {
  double _side; // Variable privada para el lado del cuadrado

  // Constructor
  Square({required double side})
      : _side = side;

  // Getter para obtener el área
  double get area {
    return _side * _side;
  }

  // Setter para validar y asignar un nuevo valor al lado
  set side(double value) {
    print("Asignando un nuevo valor al lado: $value");
    if (value <= 0) throw 'El valor del lado debe ser mayor a 0.';
    _side = value;
  }

  // Getter para el lado
  double get side {
    return _side;
  }

  // Método para calcular el área
  double calculateArea() {
    return _side * _side;
  }
}
