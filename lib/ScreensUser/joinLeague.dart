// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:soccer_management/api/bd_users.dart';
import 'joinTeam.dart';
import '../api/bd_users.dart';

class nameOfTeam {
  final String? nameTeam;

  nameOfTeam(
    this.nameTeam,
  );
}

class JoinLeaguePage extends StatelessWidget {
  static String id = 'JoinLeague_Page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    List<String> _teams = ['Colibri', 'Karike', 'Indoor'];

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
            'Inscribirme',
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
            SizedBox(height: sizeScreen.height * .002),

            /**
             * Contenedor de la etiqueta
             */
            _etiqueta('Selecciona una liga', sizeScreen),

            //Zona de Ligas
            Expanded(
              child: ListView.builder(
                itemCount: _teams.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 7,
                      shadowColor: Color(0xFFE51E3F),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              'images/leagues/${_teams.elementAt(index)}.png'),
                        ),
                        title: Text(_teams.elementAt(index)),
                      ),
                    ),
                    onTap: () {
                      ligaa = _teams.elementAt(index);

                      print(ligaa);

                      Navigator.pushNamed(context, JoinTeamPage.id,
                          arguments: nameOfTeam(
                            _teams.elementAt(index),
                          ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
