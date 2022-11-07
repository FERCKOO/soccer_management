import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/logIn.dart';

class PorfilePage extends StatelessWidget {
  static String id = 'Porfile_Page';

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF4F4F4),
        appBar: AppBar(
          backgroundColor: Color(0xffF4F4F4),
          /*
         * Texto de inicio sesion
        */
          title: Text(
            'Perfil',
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
            SizedBox(
              height: sizeScreen.height*.1,
            ),

            /**
              * Zona de datos del usuario
            */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.person_rounded,
                  size: 50,
                ),
                Column(
                  children: [
                    Text(
                      'Nombre del usuario',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato'),
                    ),
                    Text(
                      'Correo electronico',
                      style: TextStyle(
                          color: Color(0xFFC8C8C8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato'),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: sizeScreen.height*.1),
            /**
               * Detector de gestos para click en el container
               * Container con "editar perfil"
               */
            GestureDetector(
              child: Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(start: 30, end: 50),
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC8C8C8),
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Editar perfil',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                ),
              ),
              onTap: () {
                print('editar');
              },
            ),
            SizedBox(height: 15),
            /**
               * Detector de gestos para click en el container
               * Container con "Notificaciones"
               */
            GestureDetector(
              child: Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(start: 30, end: 50),
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC8C8C8),
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Notificaciones',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                ),
              ),
              onTap: () {
                print('Notificaciones');
              },
            ),
            SizedBox(height: sizeScreen.height*.05),
            /**
               * Container para el dark mode
               */
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsetsDirectional.only(start: 30, end: 50),
              padding: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFC8C8C8),
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Modo obscuro',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                  ),
                  /**
                   * Switch para activar el dark mode
                  */
                  _switch()

                ],
              ),
            ),

            /**
                 * GestureDetector para detectar pulsacion
                 * en el texto de "Cerrar sesion"
                 */
            Container(
              margin: EdgeInsetsDirectional.only(
                top: sizeScreen.height*.1
              ),
              child: GestureDetector(
                // Detecta alguna accion en texto

                child: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context)
                  .pushNamedAndRemoveUntil('${LogInPage.id}', (Route<dynamic> route) => false);
                  print('Cerrar sesion');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class _switch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _switchState();
}

class _switchState extends State<_switch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        inactiveTrackColor: Color(0xFF3A4280),
        activeTrackColor: Color(0xFF00002B),
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
            print(value);
          });
        });
  }
}
