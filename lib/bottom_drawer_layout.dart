import 'package:flutter/material.dart';
import 'Screens/calendar.dart';
import 'Screens/profile.dart';
import 'Screens/principal.dart';
import 'Screens/joinTeam.dart';

class LayoutBottomNavigatorBar extends StatefulWidget {
  static String id = 'bottom_drawer_layout';

  const LayoutBottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LayoutBottomNavigatorBarState();
}

class _LayoutBottomNavigatorBarState extends State<LayoutBottomNavigatorBar> {
  
  static final List<Widget> _viewsOptions = <Widget>[
    PrincipalPage(),
    CalendarPage(),
    JoinTeamPage(),
    PorfilePage()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _viewsOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF3A4280),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Primer icono
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.sports_soccer,
                    color:
                        _selectedIndex != 0 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    focusColor:
                    Colors.black;
                    _onItemTapped(0);
                  },
                ),
                Text(
                  'Equipos',
                  style: TextStyle(
                    color:
                        _selectedIndex != 0 ? Colors.white : Color(0xFFE51E3F),
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
                    color:
                        _selectedIndex != 1 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
                Text(
                  'Calendario',
                  style: TextStyle(
                    color:
                        _selectedIndex != 1 ? Colors.white : Color(0xFFE51E3F),
                  ),
                ),
              ],
            ),

            // Tercer icono
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*
                const Image(
                    image: AssetImage(
                      'assets/images/Liga.png',
                    ),
                  ),
                  */
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color:
                        _selectedIndex != 2 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
                Text(
                  'Inscribirme',
                  style: TextStyle(
                    color:
                        _selectedIndex != 2 ? Colors.white : Color(0xFFE51E3F),
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
                    Icons.person_outline,
                    color:
                        _selectedIndex != 3 ? Colors.white : Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    _onItemTapped(3);
                  },
                ),
                Text(
                  'Perfil',
                  style: TextStyle(
                    color:
                        _selectedIndex != 3 ? Colors.white : Color(0xFFE51E3F),
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
