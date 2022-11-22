// ignore_for_file: use_key_in_widget_constructors, slash_for_doc_comments, camel_case_types, unused_element, avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import '../bottom_drawer_layout.dart';
import '../api/bd_users.dart';

class LogUpPage extends StatelessWidget {
  static String id = "logUp_page";

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final firstName = TextEditingController();
    final lastName = TextEditingController();
    final email = TextEditingController(); // Variable para el email
    final pass = TextEditingController(); // Variable para la contraseña
    final confPass = TextEditingController();

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
            _textFieldName(sizeScreen, firstName),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldLastName(sizeScreen, lastName),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldEmail(sizeScreen, email),
            SizedBox(height: sizeScreen.height * .01),
            _formFieldDate(),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldPassword(sizeScreen, pass),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldConfirmPassword(sizeScreen, confPass),
            SizedBox(height: sizeScreen.height * .017),
            _buttonSingUp(context, sizeScreen, firstName, lastName, email, pass,
                confPass),
          ],
        ),
      ),
    ));
  }
}

Widget _buttonSingUp(
    BuildContext context, Size size, fName, lName, email, pass, confPass) {
  String _fNameVar = '';
  String _lNameVar = '';
  String _emailVar = '';
  String _passVar = '';
  String _confPassVar = '';

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .18,
        vertical: size.height * .029,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onPressed: () {
      _fNameVar = fName.text;
      _lNameVar = lName.text;
      _emailVar = email.text; // Se recupera el texto digitado
      _passVar = pass.text; // Se recupera la contraseña registrada
      _confPassVar = confPass.text;

      // Limpieza de los controladores
      @override
      void dispose() {
        fName.dispose();
        lName.dispose();
        email.dispose();
        pass.dispose();
        confPass.dispose();
      }

      if (_emailVar != '' &&
          _passVar != '' &&
          _fNameVar != '' &&
          _lNameVar != '' &&
          _confPassVar != '') {
        if (_emailVar.contains('@hotmail.com') ||
            _emailVar.contains('@outlook.com') ||
            _emailVar.contains('@gmail.com')) {
          // Si el email digitado existe...
          if (users.containsKey(_emailVar)) {
            AwesomeDialog(
              dialogType: DialogType.warning,
              context: context,
              // ignore: deprecated_member_use
              animType: AnimType.SCALE,
              title: 'Correo electronico',
              body: const Center(
                child: Text(
                  'El correo digitado ya esta registrado.',
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
          }
          //Si las contraseñas no son iguales...

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
            // Si todo esta bien Ingresa como usuario comun
            users.addAll({_emailVar: _passVar});
            userName.addAll({_emailVar: '$_fNameVar $_lNameVar'});

            print(users);
            print(userName);

            correoo = _emailVar; // Se guarda el correo digitado

            Navigator.of(context).pushNamedAndRemoveUntil(
                LayoutBottomNavigatorBarUser.id,
                (Route<dynamic> route) => false);
          }
        } else {
          AwesomeDialog(
            dialogType: DialogType.noHeader,
            context: context,
            // ignore: deprecated_member_use
            animType: AnimType.SCALE,
            title: 'Correo electronico',
            body: const Center(
              child: Text(
                'Verifique que su correo contenga alguna de las siguientes extenciones.\n@hotmail.com, @gmail.com ó @outlook.com',
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
        }
      } else {
        AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'Correo electronico',
          body: const Center(
            child: Text(
              'Llene todos los campos.',
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
      }
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
Widget _textFieldName(Size size, fName) {
  return _textFieldGeneral(
    labelText: 'Nombre',
    icon: Icons.person_outline,
    hintText: 'Nombre',
    sizeScreen: size,
    myControler: fName,
    onChanged: () {},
  );
}

Widget _textFieldLastName(Size size, lName) {
  return _textFieldGeneral(
    labelText: 'Apellido',
    icon: Icons.person_outline,
    hintText: 'Apellido',
    sizeScreen: size,
    myControler: lName,
    onChanged: () {},
  );
}

Widget _textFieldEmail(Size size, email) {
  return _textFieldGeneral(
    labelText: 'Correo',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    sizeScreen: size,
    myControler: email,
    onChanged: () {},
  );
}

Widget _formFieldDate() {
  return _formDateGeneral();
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
                  (e?.day ?? 0) == 1 ? 'No seleccione el primer dia' : null,
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
