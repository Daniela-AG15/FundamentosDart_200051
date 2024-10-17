void main() async {
  // Arrancamos el programa, esto solo imprime un mensaje inicial.
  print('Inicio del programa');

  // Aquí metemos el código que podría fallar en un try-catch.
  try {
    // Hacemos una llamada asíncrona a la función httpGet y esperamos el resultado.
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Si todo sale bien, imprimimos el resultado.
    print('éxito: $value');

  } on Exception catch (err) {
    // Si algo falla y es una Exception, mostramos este mensaje.
    print('Tenemos una Exception: $err');

  } catch (err) {
    // Si es otro tipo de error, mostramos este mensaje genérico.
    print('OOP!! algo terrible pasó: $err');

  } finally {
    // Este bloque se ejecuta sí o sí, aunque haya fallos o no.
    print('Fin del try y catch');
  }

  // Ya llegamos al final del programa y lo avisamos.
  print('Fin del programa');
}

// Esta función simula una llamada HTTP (como si pidiéramos datos de una página).
Future<String> httpGet(String url) async {
  // Esperamos un segundo para simular que la petición tarda en responder.
  await Future.delayed(const Duration(seconds: 1));

  // Aquí forzamos un error lanzando una Exception.
  throw Exception('No hay parámetros en el URL');

  // Opciones alternativas que están comentadas:
  // Si quisiéramos, podríamos lanzar un error simple como este:
  // throw 'Error en la petición';
  
  // O podríamos devolver un valor si la petición fuera exitosa:
  // return 'Tenemos un valor de la petición';
}
