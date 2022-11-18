// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/Number.dart';
import 'package:soccer_management/models/method_teams_user_model.dart';
import '../api/soccer_management_api.dart';
import 'package:http/http.dart' as http;

class TeamPage extends StatelessWidget {
  static String id = 'Team_Page';

  List players = [
    'Lucas perez',
    'Angel Diaz',
    'Luis Dominguez',
    'Bryton Ramirez',
    'Luis Saenz',
    'Alan Lopez'
  ];
  List<int> playersGoals = [1, 0, 3, 8, 3, 8];

  int _totalGoals = 0;

  int sumGoals(_totalGoals) {
    for (var element in playersGoals) {
      _totalGoals += playersGoals[element];
    }

    return _totalGoals;
  }

/*
  Funcionamiento pendiente con el archivo 
  soccer_management_api

  @override
  void initState(){
    getMethodTeamsUser();
  }
*/
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
                children: const [
                  Text(
                    'Puntos: 9',
                    style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
                  ),
                  Text(
                    'Goles en contra: 10',
                    style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diferencia de goles: 12',
                    style: TextStyle(fontSize: 16, fontFamily: 'Lato'),
                  ),
                  Text(
                    'Goles a favor: 22',
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
          const Text(
            'Jugadores',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Goles',
                style: TextStyle(),
              ),
              SizedBox(
                width: sizeScreen.width * .014,
              )
            ],
          ),
          (players.isEmpty)
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Sin jugadores',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: players.length,
                      itemBuilder: (context, int index) {
                        _totalGoals += playersGoals.elementAt(index);
                        return GestureDetector(
                          child: Card(
                            elevation: 7,
                            shadowColor: Color(0xFFE51E3F),
                            child: ListTile(
                              leading: CircleAvatar(),
                              title: Text(players.elementAt(index)),
                              trailing:
                                  Text('${playersGoals.elementAt(index)}'),
                            ),
                          ),
                          onTap: () {
                            //Prueba de la pagina para seleccionar numero y posicion
                            Navigator.pushNamed(context, NumberPage.id);
                          },
                        );
                      }),
                ),
        ],
      ),
    ));
  }
}
