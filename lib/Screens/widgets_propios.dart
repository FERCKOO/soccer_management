// clase widget para labels
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import 'joinTeam.dart';


/**
 * Clase generica de text labels
 */
class _textFieldGeneral extends StatefulWidget {

  final String labelText; //Texto del label
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final IconData icon;
  final Function onChanged;
  final bool obscureText;

  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 70,
      ),
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            labelText: '${widget.labelText}',
            hintText: widget.hintText,
          ),
        onChanged: (value) {},
      ),
    );
  }
}

// clase fecha de nacimiento
class _formDateGeneral extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 70,
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Fecha de nacimiento',
              ),
              validator: (DateTime? e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
          ],
        ),
    ),
    );
  }
}

// Etiqueta de pantallas
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
                    Route route = MaterialPageRoute(builder: (bc) => JoinTeamPage());
                    Navigator.of(context).push(route);
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