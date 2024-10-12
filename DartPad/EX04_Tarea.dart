enum Gender {
  Masculino,
  Femenino,
  Otro
}

enum BloodGroup {
  A_p, // A positivo
  A_n, // A negativo
  B_p, // B positivo
  B_n, // B negativo
  AB_p, // AB positivo
  AB_n, // AB negativo
  O_p, // O positivo
  O_n  // O negativo
}

// Definición de la Clase Abstracta Persona
// Aqui se definen las características
//Una clase abstracta no puede ser instanciada directamente solo puede heredar
abstract class Persona {
  int id;
  // (?) indica que este campo es opcional y puede ser nulo
  String? cortesyTitle; // (Dr., Sr., Sra.)
  String name;
  String firstLastname;
  String? secondLastname;
  String? curp;
  String gender; // Género ('M', 'F', 'N/B')
  String bloodGroup; // Grupo sanguíneo ('A+','A-','B+','B-','AB+','AB-','O+','O-')
  DateTime birthdate;
  bool isActive; // 
  //Es la fecha en la que se registró a una persona en el sistema
  DateTime createdAt; // Fecha de registro
  DateTime? updatedAt; // Fecha de última actualización

  // Definición de la Función de la Clase: El constructor se inicializa es decir
  //permite inicializar los valores de las propiedades(id,titulo decortesia etc...)
  Persona({
    required this.id,
    this.cortesyTitle,
    required this.name,
    required this.firstLastname,
    this.secondLastname,
    this.curp,
    required this.gender,
    required this.bloodGroup,
    required this.birthdate,
    this.isActive = true,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  //Es un método abstracto
  //Se utilizará para imprimir los detalles de la persona
  void printDetails(String caseTitle);

  // Es método que permite registrar la defunción
  void registraDefuncion() {
    isActive = false;
    updatedAt = DateTime.now(); // Actualización de la fecha de defunción
  }
}

// Declaración de las Propiedades de la  SubClase Paciente
//Esta hereda las propiedades y métodos
class Paciente extends Persona {
  String nss; 
  String statusVida; 
  String estatusMedico; 
  DateTime fechaUltimaCita; // Guarda la Fecha de la última cita médica

  // El Constructor Paciente que inicializa las propiedades heredadas de Persona y las de el
  Paciente({
    required int id,
    String? cortesyTitle,
    required String name,
    required String firstLastname,
    String? secondLastname,
    String? curp,
    required String gender,
    required String bloodGroup,
    required DateTime birthdate,
    bool isActive = true,
    DateTime? createdAt,
    DateTime? updatedAt,
    required this.nss,
    this.statusVida = "Vivo",
    this.estatusMedico = "Estable",
    required DateTime fechaRegistro, // Se omite en el constructor de Paciente ya que     se maneja en Persona
    // Se llama al constructor de la clase Persona(padre)
    required this.fechaUltimaCita,
  }) : super(
            id: id,
            cortesyTitle: cortesyTitle,
            name: name,
            firstLastname: firstLastname,
            secondLastname: secondLastname,
            curp: curp,
            gender: gender,
            bloodGroup: bloodGroup,
            birthdate: birthdate,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt);

  // Métodos CRUD de la Clase:
  
  // Este método permite actualizar el estado de salud del paciente y lo guarda en        estatusMedico
  void actualizarDatos(String nuevoEstadoMedico) {
    estatusMedico = nuevoEstadoMedico;
    updatedAt = DateTime.now(); // Actualización del estado médico
  }
  //este método marca al paciente como inactivo
  void eliminarPaciente() {
    isActive = false;
    statusVida = "Inactivo";
  }

  //
  //Este método sobrescribe el método abstracto printDetails de la clase Persona
  @override
  void printDetails(String caseTitle) {
    final String formatedBirthDate =
        "${birthdate.day.toString().padLeft(2, '0')}/" +
        "${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";

    final String formatedCreatedDate =
        "${createdAt.day.toString().padLeft(2, '0')}/" +
        "${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} ${createdAt.hour.toString().padLeft(2, '0')}:" +
        "${createdAt.minute.toString().padLeft(2, '0')}:" +
        "${createdAt.second.toString().padLeft(2, '0')}";

    print("----------------------------------------------------------");
    print(caseTitle); // Se imprime el título del caso (CASO 1, 2 o 3)
    print("----------------------------------------------------------");
    print("DATOS DEL PACIENTE");
    print("----------------------------------------------------------");
    print("id: $id");
    print("Titulo de Cortesia: $cortesyTitle");
    print("Nombre: $name $firstLastname $secondLastname");
    print("CURP: $curp");
    print("Género: ${gender.toString().split('.').last}");
    print("Grupo Sanguíneo: $bloodGroup");
    print("Fecha de Nacimiento: $formatedBirthDate");
    print("nss: $nss");
    print("Estatus Médico: $estatusMedico");
    print("Status de Vida: $statusVida");
    print("Fecha de Registro: $formatedCreatedDate");
    print("----------------------------------------------------------");
  }
}

// Caso de Prueba 1: Paciente nuevo
void casoPrueba1() {
  final caso1 = Paciente(
    id: 1,
    cortesyTitle: "Sra.",
    name: "Daniela",
    firstLastname: "Aguilar",
    secondLastname: "Torres",
    curp: "RAOL980215MDFLPR05",
    gender: "F", // Cambié a "F" para que coincida con el género femenino
    bloodGroup: "A+",
    birthdate: DateTime(2001, 12, 15),
    nss: "123456789",
    fechaRegistro: DateTime.now(),
    fechaUltimaCita: DateTime.now(),
  );
  caso1.printDetails("CASO 1: Nuevo paciente registrado hoy");
}

// Caso de Prueba 2: Paciente trabajador
void casoPrueba2() {
  final caso2 = Paciente(
    id: 2,
    cortesyTitle: "Dr.",
    name: "Omar",
    firstLastname: "Aguilar",
    secondLastname: "Torres",
    gender: "M",
    bloodGroup: "B+",
    birthdate: DateTime(1985, 07, 25),
    curp: "SACB850725HDFLLR02",
    nss: "987654321",
    fechaRegistro: DateTime.now(),
    fechaUltimaCita: DateTime.now(),
  );
  caso2.printDetails("CASO 2: Paciente que fue trabajador del hospital");
}

// Caso de Prueba 3: Paciente fallecido
void casoPrueba3() {
  final caso3 = Paciente(
    id: 3,
    cortesyTitle: "",
    name: "Manuel",
    firstLastname: "Aguilar",
    secondLastname: "Torres",
    curp: "AATM870410HDFLPN06",
    gender: "M",
    bloodGroup: "O+",
    birthdate: DateTime(1987, 04, 10),
    nss: "456123789",
    fechaRegistro: DateTime(2010, 01, 15),
    fechaUltimaCita: DateTime(2010, 09, 10),
  );
  caso3.registraDefuncion(); // Se registra defunción del paciente
  caso3.printDetails("CASO 3: Paciente fallecido");
}

void main() {
  // Ejecutar casos de prueba
  casoPrueba1();
  casoPrueba2();
  casoPrueba3();
}
