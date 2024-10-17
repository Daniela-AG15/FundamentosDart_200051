void main() {
  // Llamamos a la función emitNumber() que nos regresa un Stream.
  // Usamos listen() para "escuchar" los valores emitidos uno por uno.
  emitNumber().listen((int value) {
    // Cada vez que el Stream emita un valor, lo imprimimos.
    print('Stream value: $value');
  });
}

Stream<int> emitNumber() async* {
  // Definimos una lista de valores que queremos emitir.
  final valuesToEmit = [1, 2, 3, 4, 5];

  // Recorremos la lista con un ciclo for-in.
  for (int i in valuesToEmit) {
    // Esperamos un segundo antes de emitir cada valor.
    await Future.delayed(const Duration(seconds: 1));
    // Emitimos el valor actual usando 'yield'.
    yield i;
  }
}
