import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  static String id = "Principal_page";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F4F4),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 15),
            color: Color(0xFF011C53),
            icon: Icon(
              Icons.notifications_none,
            ),
            onPressed: () {},
          ),
        ],
        /*
         * Teto de pantalla 
        */
        title: Text(
          'Equipos',
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
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF011C53),
            ),
            height: 25,
            width: double.infinity,
            child: Text(
              'Sin equipos',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(
            height: 340,
            child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: 
                ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage("assets/react.png")),
                  title: Text('Nombre liga'),
                  subtitle: Text('Nombre equipo'),
                ),
              )
            ],
          ),
            ),
          _button(),
        ],
      ),
      bottomNavigationBar: _BottomBar(),
    ));
  }
}

Widget _button() {
  return RaisedButton(
    color: Color(0xFF011C53),
    padding: EdgeInsets.symmetric(
      horizontal: 80,
      vertical: 20,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      'Inscribirte a un equipo',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {},
  );
}
/*
 * Seccion de metodos y funciones
*/

class _BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<_BottomBar> {
  // Indice de la barra.
  int currentIndex = 0;
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
