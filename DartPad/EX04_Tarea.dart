

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
