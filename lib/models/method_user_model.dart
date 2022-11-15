// Clase para obtener el correo del usuario
class MethodUserEmail {
  String? email;

  MethodUserEmail.fromJson(Map<String, dynamic> json){
    email = (json['id']).toString(); // correo del usuario
  }
}
// Clase para obtener la contraseña del usuario
class MethodUserPass {
  late String password;

  MethodUserPass.fromJson(Map<String, dynamic> json){
    password = (json['name']).toString(); // contraseña del usuario
  }
}
// Clase para obtener el nombre y apellido del usuario
class MethodUserName {
  String? firstNameUser;
  String? lastNameUser;

  MethodUserName.fromJson(Map<String, dynamic> json){
    firstNameUser = (json['id']).toString(); // Nombre del usuario
    lastNameUser = (json['name']).toString(); // apellido del usuario
  }
}