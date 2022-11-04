import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/principal.dart';

class JoinTeamPage extends StatelessWidget {
  static String id = 'JoinTeam_Page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF4F4F4),
        appBar: AppBar(
          backgroundColor: Color(0xffF4F4F4),
          /*
         * Texto de inicio sesion
        */
          title: Text(
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
              padding: EdgeInsets.only(top: 34),
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.person_rounded,
                size: 70,
              ),
            ),
            /**
           * Nombre del jugador
           */
            Container(
              child: Text(
                'Nombre de jugador',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),

            /**
             * Linea horizontal.
            */
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE51E3F),
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),

            /**
             * Contenedor de la etiqueta
             */
            _etiqueta('Selecciona una liga'),

            //Zona de Ligas/Equipos
            SizedBox(
              height: 340,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/react.png")),
                      title: Text('Nombre liga'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _BottomBar(),
      ),
    );
  }
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
      padding: EdgeInsets.only(top:5),
      decoration: BoxDecoration(
        color: Color(0xFF011C53),
      ),
      height: 25,
      width: double.infinity,
      child: Text(
        '$name',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

// Barra inferior
class _BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<_BottomBar> {
  // Indice de la barra.
  int currentIndex = 2;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF3A4280),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Primer icono
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: currentIndex != 0 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    focusColor:
                    Colors.black;
                    setBottomBarIndex(0);
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: currentIndex != 0 ? Colors.white : Color(0xFFE51E3F),
                  ),
                ),
              ],
            ),

            // Segundo icono
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.calendar_month,
                    color: currentIndex != 1 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    setBottomBarIndex(1);
                  },
                ),
                Text(
                  'Calendario',
                  style: TextStyle(
                    color: currentIndex != 1 ? Colors.white : Color(0xFFE51E3F),
                  ),
                ),
              ],
            ),

            // Tercer icono
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: currentIndex != 2 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    setBottomBarIndex(2);
                  },
                ),
                Text(
                  'Inscribirme',
                  style: TextStyle(
                    color: currentIndex != 2 ? Colors.white : Color(0xFFE51E3F),
                  ),
                ),
              ],
            ),

            // Cuarto icono
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.sports_soccer,
                    color: currentIndex != 3 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    setBottomBarIndex(3);
                  },
                ),
                Text(
                  'Mis ligas',
                  style: TextStyle(
                    color: currentIndex != 3 ? Colors.white : Color(0xFFE51E3F),
                  ),
                ),
              ],
            ),

            // Quinto icono
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(  
                  icon: Icon(
                    Icons.person_outline,
                    color: currentIndex != 4 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    setBottomBarIndex(4);
                  },
                ),
                Text(
                  'Perfil',
                  style: TextStyle(
                    color: currentIndex != 4 ? Colors.white : Color(0xFFE51E3F),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}