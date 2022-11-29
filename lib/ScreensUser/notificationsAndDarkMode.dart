// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:soccer_management/ScreensUser/editNotifications.dart';
import '../logIn.dart';

class NotificationsAndDarkMode extends StatelessWidget {
  static String id = 'notificationsAndDarkMode_Page';

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
            'Configuración',
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
            SizedBox(height: sizeScreen.height * .2),
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
                'Notificaciones',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontFamily: 'Lato'),
              ),
              onPressed: () {
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
