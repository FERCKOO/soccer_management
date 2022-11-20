// ignore_for_file: use_key_in_widget_constructors, unused_local_variable
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../bottom_drawer_layout.dart';

class MatchPage extends StatefulWidget {
  static String id = 'Match_Page';

  @override
  State<StatefulWidget> createState() => MatchPageState();
}

class MatchPageState extends State<MatchPage> {
  final players_firstTeam = <int>[9, 10, 3, 18, 18, 3, 7, 20];

  final players_secondTeam = <int>[5, 2, 8, 3, 15, 18, 29];

  int goals = 0;

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
                Column(children: [
                  Text(
                    'VS.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sizeScreen.height * .03,
                  ),
                  OutlinedButton(
                    child: Text(
                      'Fin partido',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0xFFE51E3F))),
                    onPressed: () {
                      endMatch(context);
                    },
                  )
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
          _etiqueta('Goles por jugador', sizeScreen),
          SizedBox(height: sizeScreen.height * .01),

          /**
           * Zona de los equipos
           */
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Verifica si el primer equipo está vacio
                (players_firstTeam.isEmpty)
                    ? Container(
                        alignment: Alignment.center,
                        width: sizeScreen.width / 2,
                        child: const Text(
                          'Sin jugadores',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                      )
                    :
                    /**
                         * Listview del primer equipo
                         */
                    Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: players_firstTeam.length,
                          itemBuilder: (context, int index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 4,
                              shadowColor: const Color(0xFFE51E3F),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.red,
                                      ),
                                      title: Text(
                                        (players_firstTeam.elementAt(index))
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '$goals',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato'),
                                      ),
                                      SizedBox(
                                        height: sizeScreen.height * .005,
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                padding: EdgeInsets.all(0.0),
                                                minimumSize: sizeScreen * .01),
                                            child: Icon(Icons.remove_circle),
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: sizeScreen.width * .02,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                minimumSize: sizeScreen * .01),
                                            child: Icon(Icons.add_circle),
                                            onPressed: () {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizeScreen.height * .09,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                // Verifica si el segundo equipo esta vacio
                (players_secondTeam.isEmpty)
                    ? Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 1.5,
                            ),
                          ),
                        ),
                        width: sizeScreen.width / 2,
                        alignment: Alignment.center,
                        child: const Text(
                          'Sin jugadores',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                      )
                    :
                    /**
                         * Listview del segundo equipo
                         */
                    Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: players_secondTeam.length,
                          itemBuilder: (context, int index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 4,
                              shadowColor: Color(0xFFE51E3F),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.red,
                                      ),
                                      title: Text(
                                          (players_secondTeam.elementAt(index))
                                              .toString()),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '$goals',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato'),
                                      ),
                                      SizedBox(
                                        height: sizeScreen.height * .005,
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                padding: EdgeInsets.all(0.0),
                                                minimumSize: sizeScreen * .01),
                                            child: Icon(Icons.remove_circle),
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: sizeScreen.width * .02,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                minimumSize: sizeScreen * .01),
                                            child: Icon(Icons.add_circle),
                                            onPressed: () {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizeScreen.height * .09,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ],
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

// Funcion para terminar el partido
void endMatch(BuildContext context){
  String cadena = generateRandomString(4);
  final code = TextEditingController();

  AwesomeDialog(
        context: context,
        // ignore: deprecated_member_use
        animType: AnimType.SCALE,
        title: 'Finalizar partido',
        body: Center(
          child: Column(
            children: [
              Text(
                'Para finalizar el encuentro digite el siguiente codigo:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
              ),
              Container(
                child: Text(
                  cadena,
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  ),
              ),
            _textFieldCodeConfirmation(code, chainn: cadena),
            ],
          ),
        ),
        btnOkColor: const Color(0xFF011C53),
        btnOkText: 'Finalizar',
        btnOkOnPress: () {
          
          //Prints para checar que trae el textlabel y la cadena

          /*
          Navigator.of(context).pushNamedAndRemoveUntil(
              LayoutBottomNavigatorBarReferee.id, (Route<dynamic> route) => false);
          */
        },
      ).show();
}

// Funcion para generar un codigo especial para terminar el partido
String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  String randomString =
      List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return randomString;
}

Widget _textFieldCodeConfirmation(code, {required String chainn}) {
  return _textFieldGeneral(
    hintText: 'Código de confirmacion',
    myControler: code,
    chain: chainn,
    onChanged: () {},
  );
}

/**
 * Clase generica de text labels
 */
class _textFieldGeneral extends StatefulWidget {
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final Function onChanged;
  final bool obscureText;
  final TextEditingController myControler;
  final chain;

  const _textFieldGeneral(
      {
      this.hintText,
      this.keyboardType,
      required this.onChanged,
      this.obscureText = false,
      required this.myControler,
      required this.chain,
      });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {

  // Aqui se validará el icono

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: sizeScreen.width*.1,
      ),
      child: TextField(
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          // prefixIcon: , validar icono
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
