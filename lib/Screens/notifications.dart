import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  static String id = 'Notifications_page';

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(
          left: 15,
        ),
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              'Dia, semana, mes',
              style: const TextStyle(
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          //Notificacion
          Container(
            padding: const EdgeInsets.only(
              right: 80,
            ),
            child:
                ListTile(
                  title: const Text('Tipo de notificacion'),
                  shape: const Border(right: BorderSide(color: Colors.black)),
                  onTap: () {},
                ),
          ),
          /**
           * Tiempo de la notificacion
           * Falta acomodar esto enseguida de la notificacion
           */
          Container(
            child: const Text('Horas'),
          )
        ],
      ),
    )
    );
  }
}
