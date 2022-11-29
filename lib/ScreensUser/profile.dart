// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:soccer_management/ScreensUser/editNotifications.dart';
import 'package:soccer_management/ScreensUser/notificationsAndDarkMode.dart';
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
          actions: [
            IconButton(
              color: const Color(0xFF011C53),
              icon: const Icon(Icons.build_sharp),
              onPressed: () {
                Navigator.pushNamed(context, NotificationsAndDarkMode.id);
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: sizeScreen.height * .1),

              /**
                * Zona de datos del usuario
              */
              Icon(
                Icons.person_rounded,
                size: sizeScreen.width * .11,
              ),
              SizedBox(height: sizeScreen.height * .02),
              Text(
                (usersName.containsKey(correoo))
                    ? '${usersName[correoo]}'
                    : (refereesName.containsKey(correoo))
                        ? '${refereesName[correoo]}'
                        : 'Error al obtener el nombre',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
              SizedBox(height: sizeScreen.height * .01),
              Text(
                (usersName.containsKey(correoo))
                    ? correoo
                    : (refereesName.containsKey(correoo))
                        ? correoo
                        : 'Error al obtener el correo',
                style: TextStyle(
                    color: Color(0xFFC8C8C8),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
              SizedBox(height: sizeScreen.height * .1),
              /**
                 * Detector de gestos para click en el container
                 * Container con "editar perfil"
                 */
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffF4F4F4),
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeScreen.width * .3,
                    vertical: sizeScreen.height * .029,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Editar perfil',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: 'Lato'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, EditDataPage.id);
                },
              ),
              SizedBox(height: sizeScreen.height * .2),
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
