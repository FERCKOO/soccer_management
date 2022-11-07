import 'package:flutter/material.dart';
import '../widgets/widgets_propios.dart';
import '../Screens/principal.dart';

class JoinTeamPage extends StatelessWidget {
  static String id = 'JoinTeam_Page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    List<String> _teams = [
      'Colibri',
      'Karike',
      'Indoor'
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        appBar: AppBar(
          backgroundColor: const Color(0xffF4F4F4),
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
                'Mario Ledezma',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: sizeScreen.height*.01),

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
            SizedBox(height: sizeScreen.height*.002),

            /**
             * Contenedor de la etiqueta
             */
            _etiqueta('Selecciona una liga'),

            //Zona de Ligas
            Expanded(
              child: ListView.builder(
                itemCount: _teams.length,
                itemBuilder: (context, int index) {
                  return GestureDetectorLeagues(_teams, index);
                 },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector GestureDetectorLeagues(List<String> teams, int index){
  return GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                            ),
                        title: Text('${teams.elementAt(index)}'),
                      ),
                    ),
                  );
}

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
      padding: const EdgeInsets.only(top:5),
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