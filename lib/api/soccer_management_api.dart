import 'dart:convert';
import 'dart:io';
import 'package:soccer_management/models/method_user_model.dart';
import 'package:dio/dio.dart';
import '../models/method_teams_user_model.dart';
import 'package:http/http.dart' as http;
/**
 * Archivo para todas las consultas
 * hacia la API
 */

// Funcion para obtener el correo
Future<dynamic> getMethodUserEmail() async {
  var email = '';
  try {
    final url = 'https://api.thecatapi.com/v1/categories'; // URL de la api del correo
    final response = await http.get(Uri.parse(url));
      //Verifica si se tiene una respuesta exitosa del API

      if (response.statusCode == 200)
        { 
          String body = utf8.decode(response.bodyBytes);
          final jsonData = jsonDecode(body);

          //print(MethodUserEmail.fromJson(jsonData[1]).email);
          
          return MethodUserEmail.fromJson(jsonData[1]).email; // Retorno del correo
        }
        else
          print('null');
      
  } on DioError catch (e){
    return '';
  }
  return '';
}

// Funcion para obtener la contraseña
Future<dynamic> getMethodUserPass() async {
  String _password = '';
  try {
    final url = 'https://api.thecatapi.com/v1/categories'; // URL de la api de la contraseña
    final response = await http.get(Uri.parse(url));
      //Verifica si se tiene una respuesta exitosa del API

      if (response.statusCode == 200)
        { 
          String body = utf8.decode(response.bodyBytes);
          final jsonData = jsonDecode(body);

          //print(MethodUserPass.fromJson(jsonData[1]).password);

          _password = MethodUserPass.fromJson(jsonData[1]).password;
          return _password; // Retorno de la contraseña
        }
        else
          print('null');
      
  } on DioError catch (e){
    return '';
  }
  return _password;
}

// Funcion para obtener el nombre del usuario
Future<dynamic> getMethodUserName() async {
  try {
    final url = 'https://api.thecatapi.com/v1/categories'; // URL de la api
    final response = await http.get(Uri.parse(url));
      //Verifica si se tiene una respuesta exitosa del API

      if (response.statusCode == 200)
        { 
          String body = utf8.decode(response.bodyBytes);
          final jsonData = jsonDecode(body);
          
          /*
          print('${MethodUserName.fromJson(jsonData[1]).firstNameUser}');
          print('${MethodUserName.fromJson(jsonData[1]).lastNameUser}');
          */
          
          // Nombre completo
          final name = 
          '${MethodUserName.fromJson(jsonData[1]).firstNameUser} ${MethodUserName.fromJson(jsonData[1]).lastNameUser}';

          return name;
        }
        else
          print('null');
      
  } on DioError catch (e){
    return '';
  }
  return '';
}

// Funcion para obtener el los equipos

/*
 Funcion pendiente con el video
https://www.youtube.com/watch?v=2jAb1MRPbVc

Future<List> getMethodTeamsUser() async {
  
    Future<List<MethodTeamsUser>> teams;
    
    final url = 'https://api.thecatapi.com/v1/categories'; // URL de la api
    final response = await http.get(Uri.parse(url));


      //Verifica si se tiene una respuesta exitosa del API
      if (response.statusCode == 200)
        { 
          String body = utf8.decode(response.bodyBytes);
          final jsonData = jsonDecode(body);
          
          /*
          print('${MethodTeamUser.fromJson(jsonData[1]).team}');
          */

          return MethodTeamsUser.fromJson(jsonData[0]).teams;
        }
        else
          throw Exception('Falló la conexion');
      
}
*/