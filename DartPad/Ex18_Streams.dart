void main() {
  // Llamamos a la función emitNumbers() que nos devuelve un Stream.
  // Usamos listen() para "escuchar" los valores emitidos por el Stream.
  emitNumbers().listen((value) {
    // Cada vez que el Stream emita un valor, se imprimirá aquí.
    print('Stream value: $value');
  });
}

Stream<int> emitNumbers() {
  // Creamos un Stream que emite un valor cada segundo usando Stream.periodic.
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // En cada emisión, se retorna el valor actual (0, 1, 2...).
    return value;
  }).take(5);  // Con .take(5) limitamos el Stream a 5 emisiones y luego se cierra.
}
