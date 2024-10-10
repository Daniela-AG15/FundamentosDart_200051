// Definición de la Clase Abstracta <Persona>
abstract class Persona {
  int ID;
  String? cortesyTitle;
  String name;
  String firstLastname;
  String? secondLastname;
  String? curp;
  String gender;
  String bloodGroup;
  DateTime birthdate;
  bool isActive;
  DateTime createdAt;
  DateTime? updatedAt;

  Persona({
    required this.ID,
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

  void printDetails(String caseTitle);
}

// Declaración de la Clase <Paciente>
class Paciente extends Persona {
  DateTime Fecha_Ultima_Cita;

  Paciente({
    required int ID,
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
    required DateTime Fecha_registro,
    required this.Fecha_Ultima_Cita,
  }) : super(
          ID: ID,
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
          updatedAt: updatedAt,
        );

  void actualizarDatos() {
    updatedAt = DateTime.now();
  }

  void eliminarPaciente() {
    isActive = false;
  }

  @override
  void registraDefuncion() {
    isActive = false;
    updatedAt = DateTime.now();
  }

  @override
  void printDetails(String caseTitle) {
    final formattedBirthDate = "${birthdate.day.toString().padLeft(2, '0')}/${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";
    final formattedCreatedDate = "${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} ${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}:${createdAt.second.toString().padLeft(2, '0')}";

    print("----------------------------------------------------------");
    print(caseTitle);
    print("----------------------------------------------------------");
    print("DATOS DEL PACIENTE\nID: $ID\nNombre: $name $firstLastname ${secondLastname ?? ''}\nCURP: $curp\nGénero: $gender\nGrupo Sanguíneo: $bloodGroup\nFecha de Nacimiento: $formattedBirthDate\nFecha de Registro: $formattedCreatedDate");
    print("----------------------------------------------------------");
  }
}

// Casos de prueba
void casoPrueba1() {
  final caso1 = Paciente(
    ID: 1,
    name: "Daniela",
    firstLastname: "Aguilar",
    secondLastname: "Torres",
    curp: "AUTD011215MPLGRNA1", // CURP actualizado según la nueva fecha de nacimiento
    gender: "F",
    bloodGroup: "A+",
    birthdate: DateTime(2001, 12, 15), // Fecha de nacimiento actualizada
    Fecha_registro: DateTime.now(),
    Fecha_Ultima_Cita: DateTime.now(),
  );
  caso1.printDetails("CASO 1: Nuevo paciente registrado hoy");
}

void casoPrueba2() {
  final caso2 = Paciente(
    ID: 2,
    name: "Vanessa",
    firstLastname: "Aguilar",
    secondLastname: "García",
    gender: "F",
    bloodGroup: "B+",
    birthdate: DateTime(1990, 06, 25),
    curp: "AGGV900625HDFLLR02",
    Fecha_registro: DateTime.now(),
    Fecha_Ultima_Cita: DateTime.now(),
  );
  caso2.cortesyTitle = "Dra.";
  caso2.printDetails("CASO 2: Paciente que fue trabajadora del hospital");
}

void casoPrueba3() {
  final caso3 = Paciente(
    ID: 3,
    name: "Manuel",
    firstLastname: "Aguilar",
    secondLastname: "Torres",
    curp: "AATM870410HDFLPN06",
    gender: "M",
    bloodGroup: "O+",
    birthdate: DateTime(1987, 04, 10),
    Fecha_registro: DateTime(2010, 01, 15),
    Fecha_Ultima_Cita: DateTime(2010, 09, 10),
  );
  caso3.registraDefuncion();
  caso3.printDetails("CASO 3: Paciente fallecido");
}

void main() {
  casoPrueba1();
  casoPrueba2();
  casoPrueba3();
}
