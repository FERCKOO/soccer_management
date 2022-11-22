// ignore_for_file: file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../api/bd_users.dart';

// ignore: use_key_in_widget_constructors
class ChangePassPage extends StatelessWidget {
  static String id = 'ChangePassword_page';
  final pass = TextEditingController(); // Variable para la contraseña
  final confPass = TextEditingController();

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
            Navigator.pop(context);
          },
        ),
        /*
         * Texto de inicio sesion
        */
        title: const Text(
          'Cambiar contraseña',
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
            SizedBox(height: sizeScreen.height * .01),
            /*
               * Seccion de formulario
              */
            _textFieldPassword(sizeScreen, pass),
            SizedBox(height: sizeScreen.height * .03),
            _textFieldConfirmPassword(sizeScreen, confPass),
            SizedBox(height: sizeScreen.height * .1),
            _buttonSingIn(context, sizeScreen, pass, confPass),
          ],
        ),
      ),
    ));
  }

  void setState(Null Function() param0) {}
}

Widget _textFieldPassword(Size size, pass) {
  return _textFieldGeneral(
    labelText: 'Contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    obscureText: true,
    sizeScreen: size,
    myControler: pass,
    onChanged: () {},
  );
}

Widget _textFieldConfirmPassword(Size size, confPass) {
  return _textFieldGeneral(
    labelText: 'Confirmar contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    sizeScreen: size,
    obscureText: true,
    myControler: confPass,
    onChanged: () {},
  );
}

Widget _buttonSingIn(BuildContext context, Size size, pass, confPass) {
  String _passVar = '';
  String _confPassVar = '';

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        vertical: size.width * .047,
        horizontal: size.width * .05,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Actualizar contraseña',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      _passVar = pass.text; // Se recupera la contraseña registrada
      _confPassVar = confPass.text;

      // Limpieza de los controladores
      @override
      void dispose() {
        pass.dispose();
        confPass.dispose();
      }

      if (_passVar != '' && _confPassVar != '') {
        if (_passVar != _confPassVar) {
          AwesomeDialog(
            dialogType: DialogType.noHeader,
            context: context,
            // ignore: deprecated_member_use
            animType: AnimType.SCALE,
            title: 'Correo electronico',
            body: const Center(
              child: Text(
                'La contraseñas digitadas son diferentes.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            btnOkColor: const Color(0xFF011C53),
            btnOkText: 'Ok',
            btnOkOnPress: () {},
          ).show();
        } else {
          users.update(correoo, (value) => _passVar);
          AwesomeDialog(
            context: context,
            // ignore: deprecated_member_use
            animType: AnimType.SCALE,
            title: 'Cambiar contraseña',
            body: const Center(
              child: Text(
                'Se ha actualizado tu contraseña.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            btnOkColor: const Color(0xFF011C53),
            btnOkText: 'Continuar',
            btnOkOnPress: () {
              Navigator.pop(context);
            },
          ).show();
        }
      }
    },
  );
}

/// Clase generica de text labels
// ignore: camel_case_types
class _textFieldGeneral extends StatefulWidget {
  final String labelText; //Texto del label
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final IconData icon;
  final Function onChanged;
  final bool obscureText;
  final TextEditingController myControler;
  final Size sizeScreen;

  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
    required this.sizeScreen,
    required this.myControler,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

// ignore: camel_case_types
class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.sizeScreen.width * .15,
      ),
      child: TextField(
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
