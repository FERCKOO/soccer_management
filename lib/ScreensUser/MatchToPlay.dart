// ignore_for_file: use_key_in_widget_constructors, unused_local_variable
import 'package:flutter/material.dart';

class MatchToPlay extends StatelessWidget {
  static String id = 'MatchToPlay_Page';

  List players_firstTeam = [9, 10, 3, 18, 18, 3, 7, 20];

  List players_secondTeam = [1, 8, 10, 7, 35, 2, 17, 14, 15];

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
          'Partido',
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
          Container(
            padding: EdgeInsets.only(top: sizeScreen.width * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /*
                 * Imagen del equipo 1.
                */
                Column(
                  children: [
                    CircleAvatar(
                      radius: sizeScreen.width * .1,
                    ),
                    SizedBox(
                      width: sizeScreen.width * .25,
                    ),
                    /**
                    * Nombre del Equipo 1
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
                    const Text(
                      'Goles',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '0',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(children: const [
                  Text(
                    'VS.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Hora partido',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
                Column(
                  children: [
                    CircleAvatar(
                      radius: sizeScreen.width * .1,
                    ),
                    SizedBox(
                      width: sizeScreen.width * .25,
                    ),
                    /**
                    * Nombre del equipo 2
                    */
                    const Text(
                      'Yoguiños',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Goles',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '0',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: sizeScreen.height * .015),

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
          _etiqueta('Jugadores', sizeScreen),
          SizedBox(height: sizeScreen.height * .01),
          (players_firstTeam.isEmpty)
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
                  child: Container(
                    child: Row(
                      children: [
                        /**
                         * Listview del primer equipo
                         */
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: players_firstTeam.length,
                            itemBuilder: (context, int index) {
                              return GestureDetector(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 4,
                                  shadowColor: Color(0xFFE51E3F),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.red,
                                    ),
                                    title: Text(
                                        (players_firstTeam.elementAt(index))
                                            .toString()),
                                  ),
                                ),
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                        /**
                         * Listview del segundo equipo
                         */
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: players_secondTeam.length,
                            itemBuilder: (context, int index) {
                              return GestureDetector(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 4,
                                  shadowColor: Color(0xFFE51E3F),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.red,
                                    ),
                                    title: Text(
                                        (players_secondTeam.elementAt(index))
                                            .toString()),
                                  ),
                                ),
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    ));
  }
}

Widget _etiqueta(String name, Size size) {
  return _etiquetaclase(
    name: name,
    sizeScreen: size,
  );
}

class _etiquetaclase extends StatelessWidget {
  final String name;
  final Size sizeScreen;

  const _etiquetaclase({
    required this.name,
    required this.sizeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: sizeScreen.height * .01),
      decoration: const BoxDecoration(
        color: Color(0xFF011C53),
      ),
      height: sizeScreen.height * .04,
      width: double.infinity,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
