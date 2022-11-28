// ignore_for_file: file_names, use_key_in_widget_constructors, slash_for_doc_comments, camel_case_types, unused_element, unnecessary_string_interpolations, avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:soccer_management/ScreensUser/changePass.dart';

import '../api/bd_users.dart';

class EditDataPage extends StatelessWidget {
  static String id = 'EditData_Page';

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController(); // Variable para el email

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
            'Editar perfil',
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
        body: Column(
          children: [
          SizedBox(height: sizeScreen.height*.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: sizeScreen.height * .07,
                  child: Icon(
                    Icons.person_rounded,
                    size: sizeScreen.height * .1,
                  ),
                ),
                SizedBox(width: sizeScreen.width * .013),
            Column(
              children: [
                _buttonChangePass(context, sizeScreen),
                SizedBox(height: sizeScreen.height * .013),
                _buttonUpdateData(
                    context, sizeScreen, firstName, lastName, email),
              ],
            ),
              ],
            ),
            SizedBox(height: sizeScreen.height * .03),
            _textFieldName(sizeScreen, firstName),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldLastName(sizeScreen, lastName),
            SizedBox(height: sizeScreen.height * .01),
            _textFieldEmail(sizeScreen, email),
            SizedBox(height: sizeScreen.height * .01),
            _formFieldDate(),
            
          ],
        ),
      ),
    );
  }
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

Widget _buttonChangePass(BuildContext context, Size sizeScreen) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xffF4F4F4),
      padding: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .011,
        vertical: sizeScreen.width * .045,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Cambiar contraseña',
      style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      Route route = MaterialPageRoute(builder: (bc) => ChangePassPage());
      Navigator.of(context).push(route);
    },
  );
}

Widget _buttonUpdateData(
    BuildContext context, Size sizeScreen, fName, lName, email) {
  String _fNameVar = '';
  String _lNameVar = '';
  String _emailVar = '';

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .06,
        vertical: sizeScreen.width * .045,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Actualizar datos',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      _fNameVar = fName.text;
      _lNameVar = lName.text;
      _emailVar = email.text; // Se recupera el texto digitado

      // Limpieza de los controladores
      @override
      void dispose() {
        fName.dispose();
        lName.dispose();
        email.dispose();
      }

      if (_emailVar != '' && _fNameVar != '' && _lNameVar != '') {
        if (_emailVar.contains('@hotmail.com') ||
            _emailVar.contains('@outlook.com') ||
            _emailVar.contains('@gmail.com')) {
          // Si el email digitado existe...
          if (users.containsKey(_emailVar) || referees.containsKey(_emailVar)) {
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
          } else
            {
            if (users.containsKey(_emailVar)){
              users.update(correoo, (key) => _emailVar);
              usersName.update(correoo, (key) => '$_fNameVar $_lNameVar');
            } else {
              referees.update(correoo, (key) => _emailVar);
              refereesName.update(correoo, (key) => '$_fNameVar $_lNameVar');
            }
            AwesomeDialog(
            dialogType: DialogType.noHeader,
            context: context,
            // ignore: deprecated_member_use
            animType: AnimType.SCALE,
            title: 'Datos actualizados',
            body: const Center(
              child: Text(
                'Sus datos se han actualizado correctamente.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            btnOkColor: const Color(0xFF011C53),
            btnOkText: 'Ok',
            btnOkOnPress: () {
              Navigator.pop(context);
            },
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
          title: 'Campos',
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
          labelText: '${widget.labelText}',
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
