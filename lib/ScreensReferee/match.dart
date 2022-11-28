// ignore_for_file: use_key_in_widget_constructors, unused_local_variable
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../api/bd_users.dart';
import '../bottom_drawer_layout.dart';

class MatchPage extends StatefulWidget {
  static String id = 'Match_Page';

  @override
  State<StatefulWidget> createState() => MatchPageState();
}

class MatchPageState extends State<MatchPage> {
  //final code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        /*leading: IconButton(
          color: const Color(0xFF011C53),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),*/

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
                                        '#${players_firstTeam.keys.elementAt(index)} ${players_firstTeam.values.elementAt(index).split(' ').first}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  _goles(sizeScreen),
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
                                        '#${players_secondTeam.keys.elementAt(index)} ${(players_secondTeam.values.elementAt(index)).split(' ').first}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  _goles(sizeScreen),
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

Widget _goles(sizeScreen) {
  return _golesClase(
    sizeScreen: sizeScreen,
  );
}

class _golesClase extends StatefulWidget {
  final Size sizeScreen;

  _golesClase({
    required this.sizeScreen,
  });

  @override
  State<StatefulWidget> createState() => _golesClaseState();
}

class _golesClaseState extends State<_golesClase> {
  var goals = 0;

  void putGoal() async {
    setState(() {
      goals++;
    });
  }

  void removeGoal() async {
    setState(() {
      goals--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Text(
            '${goals}',
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
          ),
          onDoubleTap: putGoal,
          onLongPress: removeGoal,
        ),
        SizedBox(
          width: widget.sizeScreen.width * .015,
        )
      ],
    );
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
void endMatch(BuildContext context) {
  final sizeScreen = MediaQuery.of(context).size;
  String cadena = generateRandomString();
  final code = TextEditingController(); // Obtener el codigo digitado
  String c = '';

  int _selectedIndex = 0;

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
              // Codigo generado automaticamente
              cadena,
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          _textFieldCodeConfirmation(
            code,
            _selectedIndex,
          ), // Fiel donde se digitara el codigo

          SizedBox(height: sizeScreen.height * .01),
          _buttonVerifyCode(context, _selectedIndex, c, code, cadena),
          SizedBox(height: sizeScreen.height * .01),
        ],
      ),
    ),
  ).show();
}

// Funcion para generar un codigo especial para terminar el partido
String generateRandomString() {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  String randomString =
      List.generate(4, (index) => _chars[r.nextInt(_chars.length)]).join();
  return randomString;
}

Widget _textFieldCodeConfirmation(code, _selectedIndex) {
  return _textFieldGeneral(
    hintText: 'Código de confirmacion',
    myControler: code,
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

  const _textFieldGeneral({
    this.hintText,
    this.keyboardType,
    required this.onChanged,
    this.obscureText = false,
    required this.myControler,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .1,
      ),
      child: TextField(
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}

Widget _buttonVerifyCode(BuildContext context, selectItem, c, code, cadena) {
  final sizeScreen = MediaQuery.of(context).size;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .18,
        vertical: sizeScreen.height * .029,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Finalizar',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      c = code.text;

      // Limpieza de los controladores
      @override
      void dispose() {
        code.dispose();
      }

      // Verificar que sea el mismo codigo
      if (c != '') {
        // Si son iguales...
        (c == cadena)
            ? Navigator.of(context).pushNamedAndRemoveUntil(
                LayoutBottomNavigatorBarReferee.id,
                (Route<dynamic> route) => false)
            : null;
      } else {}
    },
  );
}
