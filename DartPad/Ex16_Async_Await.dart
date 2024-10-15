
/* async permite usar await dentro de esta función para pausar 
la ejecución hasta que se resuelvan operaciones asíncronas.*/
void main() async {// función main()
  
 
  print('Inicio del programa'); // Impresion del mensaje de inicio para identificar que el programa ha iniciado.
  
  // try-catch se utiliza para manejar posibles errores.
  try {

    // Llamamos a la función httpGet(), que es asíncrona.
    // await espera que la función termine y devuelve el resultado o lanza un error.
    final value = await httpGet('https://fernando-herrera.com/cursos');
    
    // Si la llamada fue exitosa, se imprime el valor recibido.
    print(value);
    
  } catch (err) {
    // Si se lanza un error, se captura aquí y se imprime el mensaje de error.
    print('Tenemos un error: $err');
  }
  
  // Se Imprime el mensaje indicando el fin del programa.
  // Esto se ejecuta después de que el bloque try-catch haya terminado.
  print('Fin del programa');
}

// La Función asíncrona crea una simulacion de una petición HTTP.
// Retorna un Future<String> y usa async para trabajar con await internamente.
Future<String> httpGet(String url) async {
  
  //await se utiliza para pausar la ejecución de una función asíncrona  
  //.delayed= Sirve para simular un retraso o pausa en el programa, permitiendo que otras tareas se ejecuten mientras tanto.
  await Future.delayed(const Duration(seconds: 1)); // Crea una simulacion de retraso de 1 segundo para imitar una petición HTTP.
  
  // Se imprime el error  para ver cómo se maneja en el bloque try-catch.
  throw 'Error en la petición';
  
  // Si eliminamos el throw anterior, podríamos devolver un valor exitoso:
  // return 'Tenemos un valor de la petición';
}

