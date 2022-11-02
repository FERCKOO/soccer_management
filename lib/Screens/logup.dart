import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class LogUpPage extends StatelessWidget {
  static String id = "logUp_page";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F4F4),
        leading: IconButton(
          color: Color(0xFF011C53),
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {},
        ),
        /*
         * Teto de regristro 
        */
        title: Text(
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
            Container(
              child: Icon(
                Icons.person_rounded,
                size: 70,
              ),
            ),

            /*
               * Seccion de formulario
              */
            _textFieldName(),
            SizedBox(height: 15),
            _textFieldLastName(),
            SizedBox(height: 15),
            _textFieldEmail(),
            SizedBox(height: 15),
            _formFieldDate(),
            SizedBox(height: 15),
            _textFieldPassword(),
            SizedBox(height: 15),
            _textFieldConfirmPassword(),
            SizedBox(
              height: 20,
            ),
            _buttonSingUp(),
          ],
        ),
      ),
    ));
  }
}

Widget _buttonSingUp() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onPressed: () {},
    child: Text(
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
Widget _textFieldName() {
  return _textFieldGeneral(
    labelText: 'Nombre',
    icon: Icons.person_outline,
    hintText: 'Nombre',
    onChanged: () {},
  );
}

Widget _textFieldLastName() {
  return _textFieldGeneral(
    labelText: 'Apellido',
    icon: Icons.person_outline,
    hintText: 'Apellido',
    onChanged: () {},
  );
}

Widget _textFieldEmail() {
  return _textFieldGeneral(
    labelText: 'Correo',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    onChanged: () {},
  );
}

Widget _formFieldDate() {
  return _formDateGeneral();
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

Widget _textFieldConfirmPassword() {
  return _textFieldGeneral(
    labelText: 'Confirmar contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    onChanged: () {},
    obscureText: true,
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
      margin: EdgeInsets.symmetric(
        horizontal: 70,
      ),
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
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
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 70,
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
