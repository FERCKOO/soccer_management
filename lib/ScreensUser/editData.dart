// ignore_for_file: file_names, use_key_in_widget_constructors, slash_for_doc_comments, camel_case_types, unused_element, unnecessary_string_interpolations, avoid_print

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:soccer_management/ScreensUser/changePass.dart';

class EditDataPage extends StatelessWidget {
  static String id = 'EditData_Page';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: sizeScreen.height * .05,
                      bottom: sizeScreen.height * .06),
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: sizeScreen.height * .07,
                    child: Icon(
                      Icons.person_rounded,
                      size: sizeScreen.height * .1,
                    ),
                  )),
              _textFieldName(sizeScreen),
              SizedBox(height: sizeScreen.height * .01),
              _textFieldLastName(sizeScreen),
              SizedBox(height: sizeScreen.height * .01),
              _textFieldEmail(sizeScreen),
              SizedBox(height: sizeScreen.height * .01),
              _formFieldDate(),
              SizedBox(height: sizeScreen.height * .1),
              _buttonChangePass(context, sizeScreen),
              SizedBox(height: sizeScreen.height * .015),
              _buttonUpdateData(context, sizeScreen),
            ],
          ),
        ),
      ),
    );
  }
}

/*
 * Seccion de metodos y funciones
*/
Widget _buttonChangePass(BuildContext context, Size sizeScreen) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xffF4F4F4),
      padding: EdgeInsets.symmetric(
        vertical: sizeScreen.width * .045,
        horizontal: sizeScreen.width * .02,
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

Widget _buttonUpdateData(BuildContext context, Size sizeScreen) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .11,
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
      Navigator.pop(context);
    },
  );
}

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
