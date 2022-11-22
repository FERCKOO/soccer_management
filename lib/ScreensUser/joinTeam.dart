// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../api/bd_users.dart';
import '../bottom_drawer_layout.dart';

class JoinTeamPage extends StatefulWidget {
  static String id = 'JoinTeam_Page';

  @override
  State<StatefulWidget> createState() => JoinTeamPageState();
}

class JoinTeamPageState extends State<JoinTeamPage> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    //final nameOfTeam nameTeamSelected = ModalRoute.of(context)?.settings.arguments;

    List<String> _teams = ['Venom', 'Yoguiños', 'Salazar', 'Panditas', 'Farm',
                            'ambar'];

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
         * Texto de inicio sesion
        */
          title: const Text(
            'Liga',
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
              padding: EdgeInsets.only(top: sizeScreen.width * .1),
              alignment: Alignment.topCenter,
              child: const Icon(
                Icons.image,
                size: 70,
              ),
            ),
            /**
           * Nombre del jugador
           */
            Text(
              ligaa,
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
            SizedBox(height: sizeScreen.height * .002),

            /**
             * Contenedor de la etiqueta
             */
            _etiqueta('Selecciona un equipo', sizeScreen),

            //Zona de Ligas
            Expanded(
              child: ListView.builder(
                itemCount: _teams.length,
                itemBuilder: (context, int index) {
                  return GestureDetectorLeagues(
                      _teams, index, sizeScreen, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector GestureDetectorLeagues(
    List<String> teams, int index, Size sizeScreen, BuildContext context) {
  return GestureDetector(
    child: Card(
      elevation: 7,
      shadowColor: Color(0xFFE51E3F),
      child: ListTile(
        leading: CircleAvatar(),
        title: Text(teams.elementAt(index)),
        trailing: IconButton(
          icon: Icon(Icons.add),
          color: Color(0xFF011C53),
          onPressed: () {
            AwesomeDialog(
              context: context,
              // ignore: deprecated_member_use
              animType: AnimType.SCALE,
              title: 'Solicitud de ingreso',
              body: Center(
                child: Text(
                  'Has enviado invitacion al equipo ${teams.elementAt(index)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato'),
                ),
              ),
              btnOkColor: const Color(0xFF011C53),
              btnOkText: 'Continuar',
              btnOkOnPress: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LayoutBottomNavigatorBarUser.id, (Route<dynamic> route) => false);
              },
            ).show();
          },
        ),
      ),
    ),
  );
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
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
