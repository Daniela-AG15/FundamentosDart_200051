void main() {
  print('Inicio del programa');//Impresion del inicio del mensaje

  httpGet('https://fernando-herrera.com/cursos')//Es una Funcion Asincrona httpGet() es la simulacion de una peticion HTTP
    .then((value) {//.then() es un callback que se ejecuta cuando el codigo se resuelve exitosamente.
      // En este bloque se ejecuta solos si la petición es exitosa.

      print(value);// Se imprime el valor de la respuesta obtenida.
    })
    .catchError((err) {//Nos sirve para capturar errores con .catchError()
      // Este bloque se ejecuta si hubo un error en la petición.

      print('Error: $err');// Se imprime el error recibido.
    });


  // Este mensaje aparecerá antes de que se resuelva el Codigo,
  // demostrando que la operación es asíncrona.
  print('Fin del programa');   // Se Imprime el mensaje de fin del programa.
}


// Retorna un Future que se completará después de un retraso de 1 segundo.
Future<String> httpGet(String url) { // Esta función simula una petición HTTP.

  // Se utiliza el Future.delayed() para introducir un retraso artificial de 1 segundo.
  return Future.delayed(const Duration(seconds: 1), () {
  //Comentar para respuesta positiva
    throw 'Error en la petición http';    // Se crea una similacion de error lanzando una excepción con throw.
    // Como lanzamos un error, nunca se devolverá una respuesta exitosa.

    // return 'Respuesta de la petición http';
  });
}

