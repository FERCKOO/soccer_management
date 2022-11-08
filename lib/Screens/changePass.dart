import 'package:flutter/material.dart';

class ChangePassPage extends StatelessWidget {
  static String id = 'ChangePassword_page';

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
            SizedBox(height: sizeScreen.height*.01),
            /*
               * Seccion de formulario
              */
            _textFieldPassword(sizeScreen),
            SizedBox(height: sizeScreen.height*.03),
            _textFieldConfirmPassword(sizeScreen),
            SizedBox(height: sizeScreen.height*.1),
            _buttonSingIn(context, sizeScreen)
          ],
        ),
      ),
    ));
  }

  void setState(Null Function() param0) {}
}

Widget _textFieldPassword(Size size) {
  return _textFieldGeneral(
    labelText: 'Nueva Contraseña',
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
    obscureText: true,
    sizeScreen: size,
    onChanged: () {},
  );
}

Widget _buttonSingIn(BuildContext context, Size size) {
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
    onPressed: () {},
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
    required this.sizeScreen
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.sizeScreen.width*.15,
      ),
      child: TextField(
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
