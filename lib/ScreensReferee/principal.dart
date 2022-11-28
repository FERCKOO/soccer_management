import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../api/bd_users.dart';
import 'notifications.dart';
import 'match.dart';

// ignore: use_key_in_widget_constructors
class Principal extends StatelessWidget {
  static String id = 'Principal_Page';

  final int _cantTeams = 1;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size; // Tamaño de la pantalla

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        appBar: AppBar(
          backgroundColor: const Color(0xffF4F4F4),
          centerTitle: true,
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Calendario',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: sizeScreen.width * .02),
              color: const Color(0xFF011C53),
              icon: const Icon(
                Icons.notifications_none,
              ),
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (bc) => NotificationsPageReferee());
                Navigator.of(context).push(route);
              }, // Accion de la notificacion
            ),
          ],
        ),
        body: SizedBox.expand(
            child: Column(children: [
          /*
              * Imagen del usuario.
            */
          Container(
            padding: EdgeInsets.only(top: sizeScreen.width * .1),
            alignment: Alignment.topCenter,
            child: const Icon(
              Icons.person_rounded,
              size: 70,
            ),
          ),
          /**
           * Nombre del jugador
           */
          Text(
            (usersName.containsKey(correoo))
                ? '${usersName[correoo]}'
                : (refereesName.containsKey(correoo))
                    ? '${refereesName[correoo]}'
                    : 'Error al obtener el nombre',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: sizeScreen.height * .01),

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
          SizedBox(
            height: sizeScreen.height * .02,
          ),

          const Text(
            'Proximos partidos',
            style: TextStyle(
              color: Color(0xFF011C53),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),

          SizedBox(
            height: sizeScreen.height * .01,
          ),

          // Carta para los partidos
          Expanded(
              child: ListView.builder(
                  itemCount: _cantTeams, // Cantidad de cartas a mostrar
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, int index) {
                    // For para imprimir los partidos

                    return Row(
                      children: [
                        const Text(
                          '8 Nov',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                        GestureDetector(
                          child: Card(
                            elevation: 10,
                            color: Colors.white,
                            child: SizedBox(
                              width: sizeScreen.width * .70,
                              height: sizeScreen.height * .2,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Venom vs Yoguiños',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato'), //Textstyle
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.location_on_outlined),
                                        Text('Indoor CUU')
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.av_timer),
                                        Text('8:00 P.M')
                                      ],
                                    ),
                                    /**
                               * Linea horizontal.
                              */
                                    Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Por empezar',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            AwesomeDialog(
                              dialogType: DialogType.warning,
                              context: context,
                              // ignore: deprecated_member_use
                              animType: AnimType.SCALE,
                              title: 'Inicio partido',
                              body: const Center(
                                child: Text(
                                  'Usted está a punto de comenzar el partido.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato'),
                                ),
                              ),
                              btnOkColor: const Color(0xFF011C53),
                              btnOkText: 'Ir al partido',
                              btnOkOnPress: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    MatchPage.id,
                                    (Route<dynamic> route) => false);
                              },
                            ).show();
                          },
                        ),
                      ],
                    );
                  }))
        ])),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
