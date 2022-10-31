import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soccer_management/widgets/widgets_propios.dart';

class LogInPage extends StatelessWidget {
  static String id = 'LogIn_page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F4F4),
        /*
         * Texto de inicio sesion
        */
        title:
        Text(
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
              // TODO de la imagen
            ),
            SizedBox(height: 20),
            
            

            /*
               * Seccion de formulario
              */

            SizedBox(height: 15),
            _textFieldEmail(),
            SizedBox(height: 15),
            _textFieldPassword(),
            SizedBox(height: 20,),
            _buttonSingIn(),

            /*
               * Seccion de actualizacion de contraseña y registrarse
              */
            Center(
                child: Container(
              child: Row(
                children: [
                  Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4890B8)
                    ),
                  ),
                  GestureDetector(
                    onTap: ((){
                      print('object');
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
            )),
          ],
        ),
      ),
    )
    );
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

Widget _buttonSingIn() {
  return  RaisedButton(
    color: Color(0xFF011C53),
    padding: EdgeInsets.symmetric(
      horizontal: 100,
      vertical: 20,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    onPressed: () {},
    child: Text(
           'Registrarse',
           style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato'
           ),
          ),
  );
}