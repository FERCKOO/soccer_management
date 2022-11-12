// ignore_for_file: file_names, use_key_in_widget_constructors, slash_for_doc_comments, camel_case_types, unused_element

import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/forgotpass.dart';
import 'package:soccer_management/Screens/logup.dart';
import 'package:soccer_management/bottom_drawer_layout.dart';

class LogInPage extends StatelessWidget {
  static String id = 'LogIn_page';

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
            _textFieldEmail(),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldPassword(),
            SizedBox(height: sizeScreen.height * .05),
            _buttonSingIn(context),
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

  void setState(Null Function() param0) {}
}

Widget _textFieldEmail() {
  return _textFieldGeneral(
    labelText: 'Correo',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    onChanged: () {},
  );
}

Widget _textFieldPassword() {
  return _textFieldGeneral(
    labelText: 'Contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    onChanged: () {},
    obscureText: true,
  );
}

Widget _buttonSingIn(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF011C53),
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
      Navigator.of(context).pushNamedAndRemoveUntil(
          LayoutBottomNavigatorBar.id, (Route<dynamic> route) => false);
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

  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
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
