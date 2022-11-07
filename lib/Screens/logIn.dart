import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/forgotpass.dart';
import 'package:soccer_management/Screens/logup.dart';
import 'package:soccer_management/bottom_drawer_layout.dart';
import 'package:soccer_management/router/routes.dart';

class LogInPage extends StatelessWidget {
  
  static String id = 'LogIn_page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F4F4),
        /*
         * Texto de inicio sesion
        */
        title: Text(
          'Iniciar sesión',
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
             * Imagen del la app.
            */
            Container(
              child: 
                  Icon(
                      Icons.image,
                      size: 100,
                    ),

                    /*Image(
                    image: AssetImage(
                      'Logo.png',
                    ),
                    width: 10,
                    height: 20,
                  )
                  */
              ),
            SizedBox(height: sizeScreen.height * .01),

            /**
             * Linea horizontal.
            */
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 80,
              ),
              decoration: BoxDecoration(
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
              child: Text(
                'BIENVENIDO',
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
            SizedBox(height: sizeScreen.height * .02),
            _buttonSingIn(context),
            SizedBox(height: sizeScreen.height * .11),

            /*
              * Seccion de actualizacion de contraseña
            */
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(fontSize: 14, color: Color(0xFF4890B8)),
                    ),
                    GestureDetector(
                      // Detecta alguna accion en texto
                      onTap: (() {
                        print('obj1');
                        Navigator.pushNamed(context, '${ForgotPassPage.id}');
                      }),
                      child: Text(
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
            ),
            SizedBox(height: sizeScreen.height * .01),
            /*
              * Seccion para registrarse
            */
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        print('object 2');
                        Navigator.pushNamed(context, '${LogUpPage.id}');
                      }),
                      child: Text(
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
      primary: Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: Text(
      'Iniciar sesion',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      Navigator.of(context)
                  .pushNamedAndRemoveUntil(LayoutBottomNavigatorBar.id,
                  (Route<dynamic> route) => false);
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
      margin: EdgeInsets.symmetric(
        horizontal: 50,
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
