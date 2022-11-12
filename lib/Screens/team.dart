// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  static String id = 'Team_Page';

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
         * Texto del top
        */
        title: const Text(
          'Estadisticas',
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
        mainAxisSize: MainAxisSize.min,
        children: [
          /*
              * Imagen del usuario.
            */
          Container(
            padding: EdgeInsets.only(top: sizeScreen.width * .03),
            child: Row(
              children: [
                SizedBox(width: sizeScreen.width * .03),
                const CircleAvatar(),
                SizedBox(
                  width: sizeScreen.width * .35,
                ),
                /**
                 * Nombre del jugador
                 */
                const Text(
                  'Venom',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: sizeScreen.height * .015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Puntos: ',
                    style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
                  ),
                  Text(
                    'Goles a favor: ',
                    style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diferencia de goles: ',
                    style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
                  ),
                  Text(
                    'Goles a favor: ',
                    style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
                  )
                ],
              )
            ],
          ),

          /**
             * Linea horizontal.
            */
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE51E3F),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: sizeScreen.height * .01),
          Text(
            'Jugadores',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: sizeScreen.width * .01,
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(),
                          title: Text('NameLeague'),
                          subtitle: Text('NameTeam'),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, TeamPage.id);
                      },
                    );
                  })),
        ],
      ),
    ));
  }
}
