// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  static String id = 'Notifications_page';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

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
            Navigator.of(context).pop();
          },
        ),
        /*
         * Texto de inicio sesion
        */
        title: const Text(
          'Notificaciones',
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
      body: ListView(
        padding: EdgeInsets.only(
          left: sizeScreen.width * .05,
        ),
        children: [
          Container(
            padding: EdgeInsets.only(top: sizeScreen.height * .02),
            child: const Text(
              'Al dia',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          //Notificacion
          Container(
            padding: EdgeInsets.only(
              right: sizeScreen.width * .08,
            ),
            child: ListTile(
              title: const Text('Tienes partido a las 8:00 P.M'),
              // ignore: prefer_const_constructors
              trailing: Text('2 hrs'),
              onTap: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: sizeScreen.height * .02),
            child: const Text(
              'Semana',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              right: sizeScreen.width * .08,
            ),
            child: ListTile(
              title: const Text('Te han aceptado en el equipo Venom'),
              trailing: Text('3 dias'),
              onTap: () {},
            ),
          ),
        ],
      ),
    ));
  }
}
