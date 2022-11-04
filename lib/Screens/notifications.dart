import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  static String id = 'Notifications_page';

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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        /*
         * Texto de inicio sesion
        */
        title: Text(
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
          left: 15,
        ),
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Dia, semana, mes',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          //Notificacion
          Container(
            padding: EdgeInsets.only(
              right: 80,
            ),
            child:
                ListTile(
                  title: Text('Tipo de notificacion'),
                  shape: Border(right: BorderSide(color: Colors.black)),
                  onTap: () {},
                ),
          ),
          /**
           * Tiempo de la notificacion
           * Falta acomodar esto enseguida de la notificacion
           */
          Container(
            child: Text('Horas'),
          )
        ],
      ),
    )
    );
  }
}
