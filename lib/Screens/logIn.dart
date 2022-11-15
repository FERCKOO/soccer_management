// ignore_for_file: file_names, use_key_in_widget_constructors, slash_for_doc_comments, camel_case_types, unused_element, avoid_print
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/forgotpass.dart';
import 'package:soccer_management/Screens/logup.dart';
import '../bottom_drawer_layout.dart';
import '../models/method_user_model.dart';
import 'package:http/http.dart' as http;
import '../api/soccer_management_api.dart';

class LogInPage extends StatefulWidget {
  static String id = 'LogIn_page';
  

  void setState(Null Function() param0) {}
  
  @override
  State<StatefulWidget> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage>{

  final email = TextEditingController(); // Variable para el email
  final pass = TextEditingController(); // Variable para la contraseña

  String? emailAux;
  String? passAux;

  /* Se corre al inicio del programa
  @override
  void initState() {
    super.initState();
    getMethodUserName();
  }
  */

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        /*
         * Texto de inicio sesion
        */
        title: const Text(
          'Bienvenido',
          textAlign: TextAlign.center,
          // ignore: unnecessary_const
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: sizeScreen.height * .09,
            ),

            /*
             * Imagen del la app.
            */
            Image(
                alignment: Alignment.topCenter,
                image: const AssetImage(
                  'assets/images/LogoPNG.png',
                ),
                width: sizeScreen.width * .4),
            SizedBox(height: sizeScreen.height * .03),

            /**
             * Linea horizontal.
            */
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 80,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE51E3F),
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: sizeScreen.height * .015),
            /**
             * Texto de bienvenida
            */
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: sizeScreen.height * .03, bottom: sizeScreen.width * .03),
              child: const Text(
                'Inicia sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            /*
               * Seccion de formulario
              */

            SizedBox(height: sizeScreen.height * .01),
            _textFieldEmail(email),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldPassword(pass),
            SizedBox(height: sizeScreen.height * .05),
/*
            // Verificar si está extrayendo el dato del correo
            _FutureBuilderGeneral(
              future: getMethodUserEmail(),
              data: emailAux,
              ),
            // Verificar si está extrayendo el dato de la contraseña
            _FutureBuilderGeneral(
              future: getMethodUserPass(),
              data: passAux,
            ),
*/
   

            _buttonSingIn(context, email, pass, emailAux, passAux),
            SizedBox(height: sizeScreen.height * .11),
            /*
              * Seccion de actualizacion de contraseña
            */
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(fontSize: 14, color: Color(0xFF4890B8)),
                  ),
                  GestureDetector(
                    // Detecta alguna accion en texto
                    onTap: (() {
                      Navigator.pushNamed(context, ForgotPassPage.id);
                    }),
                    child: const Text(
                      ' Da click aqui',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4890B8),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeScreen.height * .01),
            /*
              * Seccion para registrarse
            */
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushNamed(context, LogUpPage.id);
                    }),
                    child: const Text(
                      'Registrate dando click aqui.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4890B8),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

}

class _FutureBuilderGeneral extends StatefulWidget {

  final Future<dynamic> future;
  late String? data;

  _FutureBuilderGeneral({
    required this.future,
    required this.data
  });
  
  @override
  State<_FutureBuilderGeneral> createState() => _FutureBuilderGeneralState();

  
}

class _FutureBuilderGeneralState extends State<_FutureBuilderGeneral> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
      if (snapshot.hasData) {

        widget.data = snapshot.data as String?;
        print('Esto hay en widget.data: ${widget.data}');

        return Text('Todo bien con la contraseña ${snapshot.data}');
      } else if (snapshot.hasError){ 
        print(snapshot.error);
        return Text('Error');
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    },
    );
  }
}

Widget _textFieldEmail(email) {
  return _textFieldGeneral(
    labelText: 'Correo',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    myControler: email,
    onChanged: () {},
  );
}

Widget _textFieldPassword(pass) {
  return _textFieldGeneral(
    labelText: 'Contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    obscureText: true,
    myControler: pass,
    onChanged: () {},
  );
}

Widget _buttonSingIn(BuildContext context, email, pass, emailAux, passAux) {
  String _emailVar = '';
  String _passVar = '';


  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF011C53),
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Iniciar sesion',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      _emailVar = email.text; // Se recupera el texto digitado
      _passVar = pass.text;  // Se recupera la contraseña registrada
      
      // Limpieza de los controladores
      @override
      void dispose(){
        email.dispose();
        pass.dispose();
      }

      //Si no estan vacios los TextField
      if (_emailVar != '' && _passVar != '') {
        /*(_emailVar == emailAux) ? print('Ta bien el correo') : print('Verifica el correo');

        (_passVar == passAux) ? print('Ta bien la contraseña') : print ('Verifica la contraseña');
        
        print(getMethodUserEmail());
        print(emailAux);
        print(passAux);

         showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: 
                Text('Su email es: $emailAux, y usted digitó: $_emailVar, su contraseña es: $passAux y usted digito: $_passVar'),
              );
            },
          );*/
        Navigator.of(context).pushNamedAndRemoveUntil(
        LayoutBottomNavigatorBar.id, (Route<dynamic> route) => false);
       } else { // Si estan vacias mostrar un dialogo para avisar
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Verifique que su usuario y contraseña esten correctos.'),
              );
            },
          );
       }
    },
  );
}



/**
 * Clase generica de text labels
 */
class _textFieldGeneral extends StatefulWidget {
  final String labelText; //Texto del label
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final IconData icon;
  final Function onChanged;
  final bool obscureText;
  final TextEditingController myControler;

  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
    required this.myControler
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: TextField(
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
