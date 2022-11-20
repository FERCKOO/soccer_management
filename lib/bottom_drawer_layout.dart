import 'package:flutter/material.dart';
import 'ScreensUser/calendar.dart' as user;
import 'ScreensUser/profile.dart' as user;
import 'ScreensUser/principal.dart' as user;
import 'ScreensReferee/principal.dart' as referee;

class LayoutBottomNavigatorBarUser extends StatefulWidget {
  static String id = 'bottom_drawer_layout_user';

  const LayoutBottomNavigatorBarUser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LayoutBottomNavigatorBarUserState();
}

class _LayoutBottomNavigatorBarUserState
    extends State<LayoutBottomNavigatorBarUser> {
  static final List<Widget> _viewsOptions = <Widget>[
    user.PrincipalPage(),
    user.CalendarPage(),
    user.PorfilePage(),
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
        color: const Color(0xFF3A4280),
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
                    color: _selectedIndex != 0
                        ? Colors.white
                        : const Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    Colors.black;
                    _onItemTapped(0);
                  },
                ),
                Text(
                  'Equipos',
                  style: TextStyle(
                    color: _selectedIndex != 0
                        ? Colors.white
                        : const Color(0xFFE51E3F),
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
                    color: _selectedIndex != 1
                        ? Colors.white
                        : const Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
                Text(
                  'Calendario',
                  style: TextStyle(
                    color: _selectedIndex != 1
                        ? Colors.white
                        : const Color(0xFFE51E3F),
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
                    Icons.person_outline,
                    color: _selectedIndex != 2
                        ? Colors.white
                        : const Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
                Text(
                  'Perfil',
                  style: TextStyle(
                    color: _selectedIndex != 2
                        ? Colors.white
                        : const Color(0xFFE51E3F),
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

class LayoutBottomNavigatorBarReferee extends StatefulWidget {
  static String id = 'bottom_drawer_layout_referee';

  const LayoutBottomNavigatorBarReferee({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _LayoutBottomNavigatorBarRefereeState();
}

class _LayoutBottomNavigatorBarRefereeState
    extends State<LayoutBottomNavigatorBarReferee> {
  static final List<Widget> _viewsOptions = <Widget>[
    referee.Principal(),
    user.PorfilePage()
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
        color: const Color(0xFF3A4280),
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
                    color: _selectedIndex != 0
                        ? Colors.white
                        : const Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    Colors.black;
                    _onItemTapped(0);
                  },
                ),
                Text(
                  'Equipos',
                  style: TextStyle(
                    color: _selectedIndex != 0
                        ? Colors.white
                        : const Color(0xFFE51E3F),
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
                    Icons.person_outline,
                    color: _selectedIndex != 1
                        ? Colors.white
                        : const Color(0xFFE51E3F),
                  ),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
                Text(
                  'Perfil',
                  style: TextStyle(
                    color: _selectedIndex != 1
                        ? Colors.white
                        : const Color(0xFFE51E3F),
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
