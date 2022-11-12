// ignore_for_file: use_key_in_widget_constructors, slash_for_doc_comments, camel_case_types, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

import '../bottom_drawer_layout.dart';

class LogUpPage extends StatelessWidget {
  static String id = "logUp_page";

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        leading: IconButton(
          color: const Color(0xFF011C53),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        /*
         * Teto de regristro 
        */
        title: const Text(
          'Registro',
          textAlign: TextAlign.center,
          style: TextStyle(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
               * Imagen del usuario.
              */
            const Icon(
              Icons.person_rounded,
              size: 70,
            ),
            SizedBox(height: sizeScreen.height * .03),

            /*
               * Seccion de formulario
              */
            _textFieldName(sizeScreen),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldLastName(sizeScreen),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldEmail(sizeScreen),
            SizedBox(height: sizeScreen.height * .01),
            _formFieldDate(),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldPassword(sizeScreen),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldConfirmPassword(sizeScreen),
            SizedBox(height: sizeScreen.height * .017),
            _buttonSingUp(context, sizeScreen),
          ],
        ),
      ),
    ));
  }
}

Widget _buttonSingUp(BuildContext context, Size size) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        vertical: size.width * .06,
        horizontal: size.width * .22,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onPressed: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          LayoutBottomNavigatorBar.id, (Route<dynamic> route) => false);
    },
    child: const Text(
      'Registrarse',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
  );
}

/*
 * Seccion de metodos y funciones
*/
Widget _textFieldName(Size size) {
  return _textFieldGeneral(
    labelText: 'Nombre',
    icon: Icons.person_outline,
    hintText: 'Nombre',
    sizeScreen: size,
    onChanged: () {},
  );
}

Widget _textFieldLastName(Size size) {
  return _textFieldGeneral(
    labelText: 'Apellido',
    icon: Icons.person_outline,
    hintText: 'Apellido',
    sizeScreen: size,
    onChanged: () {},
  );
}

Widget _textFieldEmail(Size size) {
  return _textFieldGeneral(
    labelText: 'Correo',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    sizeScreen: size,
    onChanged: () {},
  );
}

Widget _formFieldDate() {
  return _formDateGeneral();
}

Widget _textFieldPassword(Size size) {
  return _textFieldGeneral(
    labelText: 'Contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    obscureText: true,
    sizeScreen: size,
    onChanged: () {},
  );
}

Widget _textFieldConfirmPassword(Size size) {
  return _textFieldGeneral(
    labelText: 'Confirmar contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    sizeScreen: size,
    obscureText: true,
    onChanged: () {},
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
  final Size sizeScreen;

  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
    required this.sizeScreen,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.sizeScreen.width * .15,
      ),
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}

// clase fecha de nacimiento
class _formDateGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .15,
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Fecha de nacimiento',
              ),
              validator: (DateTime? e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
