import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/notifications.dart';
import 'joinTeam.dart';

class PrincipalPage extends StatelessWidget {
  static String id = "Principal_page";
  final int _cantTeams = 0;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 15),
            color: const Color(0xFF011C53),
            icon: const Icon(
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
        title: const Text(
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
      body: _body(context, _cantTeams),
      //bottomNavigationBar: _BottomBar(),
    ));
  }
}

Widget _body(context, int _cantTeams) {
  final size = MediaQuery.of(context).size; // Tamaño total de  la pantalla
  bool hTeam; // validacion con Query para saber si se tiene equipo
  (_cantTeams == 0) ? hTeam = false : hTeam = true;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      /*
              * Imagen del usuario.
            */
      Container(
        padding: const EdgeInsets.only(top: 34),
        alignment: Alignment.topCenter,
        child: const Icon(
          Icons.person_rounded,
          size: 70,
        ),
      ),
      /**
           * Nombre del jugador
           */
      Container(
        child: const Text(
          'Nombre de jugador',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 8),

      /**
             * Linea horizontal.
            */
      Container(
        decoration: const BoxDecoration(
          border: const Border(
            bottom: BorderSide(
              color: const Color(0xFFE51E3F),
              width: 2,
            ),
          ),
        ),
      ),
      const SizedBox(height: 2),

      /**
             * Contenedor de la etiqueta
             */
      _etiqueta((!hTeam) ? 'Sin equipos' : 'Selecciona un equipo'),
      Expanded(
        child: ListView.builder(
          itemCount: _cantTeams,
          itemBuilder: (context, int index) {
            return GestureDetectorTeams('Nombre liga', 'Nombre equipo');
           },

        ),
      ),
      //_button(context, size),
    ],
  );
}

// widget para los equipos
GestureDetector GestureDetectorTeams(String NameLeague, String NameTeam){
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: ListTile(
                leading: const CircleAvatar(),
                title: Text('$NameLeague'),
                subtitle: Text('$NameTeam'),
              ),
    ),
  );
}

Widget _button(context, Size size) {

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      alignment: Alignment(
        size.width / 2,
        size.height
        ),
      primary: const Color(0xFF011C53),
      padding: const EdgeInsets.symmetric(
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
      padding: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
        color: Color(0xFF011C53),
      ),
      height: 25,
      width: double.infinity,
      child: Text(
        '$name',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}