import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/notifications.dart';
import 'joinTeam.dart';

class PrincipalPage extends StatelessWidget {
  static String id = "Principal_page";

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F4F4),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 15),
            color: Color(0xFF011C53),
            icon: Icon(
              Icons.notifications_none,
            ),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (bc) => NotificationsPage());
              Navigator.of(context).push(route);
            }, // Accion de la notificacion
          ),
        ],
        /*
         * Teto de pantalla 
        */
        title: Text(
          'Equipos',
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
      body: _body(context),
      //bottomNavigationBar: _BottomBar(),
    ));
  }
}

Widget _body(context) {
  final size = MediaQuery.of(context).size; // Tamaño total de  la pantalla
  bool hTeam = true; // validacion con Query para saber si se tiene equipo

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      /*
              * Imagen del usuario.
            */
      Container(
        padding: EdgeInsets.only(top: 34),
        alignment: Alignment.topCenter,
        child: Icon(
          Icons.person_rounded,
          size: 70,
        ),
      ),
      /**
           * Nombre del jugador
           */
      Container(
        child: Text(
          'Nombre de jugador',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 8),

      /**
             * Linea horizontal.
            */
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE51E3F),
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(height: 2),

      /**
             * Contenedor de la etiqueta
             */
      _etiqueta((!hTeam) ? 'Sin equipos' : 'Selecciona un equipo'),
      SizedBox(
        height: 340,
        child: ListView(
          children: [
            GestureDetectorTeams('Nombre liga', 'Nombre equipo'),
          ],
        ),
      ),
      _button(context, size),
    ],
  );
}

// widget para los equipos
GestureDetector GestureDetectorTeams(String NameLeague, String NameTeam){
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/react.png")),
                title: Text('$NameLeague'),
                subtitle: Text('$NameTeam'),
              ),
    ),
  );
}

Widget _button(context, Size size) {

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      alignment: Alignment(size.height-50, 50),
      primary: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Inscribirte a un equipo',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      Route route = MaterialPageRoute(builder: (bc) => JoinTeamPage());
      Navigator.of(context).push(route);
    },
  );
}

/*
 * Seccion de metodos y funciones
*/

Widget _etiqueta(String name) {
  return _etiquetaclase(
    name: name,
  );
}

class _etiquetaclase extends StatelessWidget {
  final String name;

  const _etiquetaclase({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Color(0xFF011C53),
      ),
      height: 25,
      width: double.infinity,
      child: Text(
        '$name',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}