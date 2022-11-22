// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:soccer_management/ScreensUser/editNotifications.dart';
import '../api/bd_users.dart';
import '../logIn.dart';
import 'editData.dart';

class PorfilePage extends StatelessWidget {
  static String id = 'Porfile_Page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        appBar: AppBar(
          backgroundColor: const Color(0xffF4F4F4),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
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
              height: sizeScreen.height * .1,
            ),

            /**
              * Zona de datos del usuario
            */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.person_rounded,
                  size: sizeScreen.width * .11,
                ),
                Column(
                  children: [
                    Text(
                      (userName.containsKey(correoo)) ? '${userName[correoo]}' : 'Error al obtener el nombre',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato'),
                    ),
                    Text(
                      (userName.containsKey(correoo)) ? correoo : 'Error al obtener el correo',
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
            SizedBox(height: sizeScreen.height * .1),
            /**
               * Detector de gestos para click en el container
               * Container con "editar perfil"
               */
            GestureDetector(
              child: Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(
                    start: sizeScreen.width * .05, end: sizeScreen.width * .09),
                padding: EdgeInsets.symmetric(
                  vertical: sizeScreen.height * .025,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC8C8C8),
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Editar perfil',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, EditDataPage.id);
              },
            ),
            SizedBox(height: sizeScreen.height * .05),
            /**
               * Detector de gestos para click en el container
               * Container con "Notificaciones"
               */
            GestureDetector(
              child: Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(
                    start: sizeScreen.width * .05, end: sizeScreen.width * .09),
                padding:
                    EdgeInsets.symmetric(vertical: sizeScreen.height * .025),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC8C8C8),
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Notificaciones',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, editNotificationsPage.id);
              },
            ),
            SizedBox(height: sizeScreen.height * .06),
            /**
               * Container para el dark mode
               */
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsetsDirectional.only(
                  start: sizeScreen.width * .05, end: sizeScreen.width * .09),
              padding: EdgeInsets.symmetric(vertical: sizeScreen.height * .025),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFC8C8C8),
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Text(
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
              margin: EdgeInsetsDirectional.only(top: sizeScreen.height * .1),
              child: GestureDetector(
                // Detecta alguna accion en texto

                onTap: (() {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LogInPage.id, (Route<dynamic> route) => false);
                }),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
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
        inactiveTrackColor: const Color(0xFF3A4280),
        activeTrackColor: const Color(0xFF00002B),
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        });
  }
}
