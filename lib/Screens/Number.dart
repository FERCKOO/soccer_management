import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/principal.dart';
import 'package:soccer_management/bottom_drawer_layout.dart';

class NumberPage extends StatelessWidget {
  static String id = 'Number_page';

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    final number = TextEditingController();

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
          'Datos de jugador',
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
          const Text(
            'Mario Ledezma',
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
          SizedBox(height: sizeScreen.height * .2),
          // Dropdown de las posiciones
          _DropDown(
            text: '   Posición',
            items: ['Delantero', 'Medio', 'Defensa', 'Portero'],
          ),
          SizedBox(
            height: sizeScreen.height * .05,
          ),
          // Dropdown de los numeros
          _textFieldNummber(number),
          SizedBox(
            height: sizeScreen.height * .22,
          ),
          _button(context, sizeScreen),
        ],
      ),
    ));
  }
}

Widget _textFieldNummber(number) {
  return _textFieldGeneral(
    labelText: '# playera',
    hintText: '# playera',
    myControler: number,
    onChanged: () {},
  );
}

class _DropDown extends StatefulWidget {
  String text;
  var items = [''];

  _DropDown({required this.text, required this.items});

  @override
  State<StatefulWidget> createState() => _DropDownState();
}

class _DropDownState extends State<_DropDown> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade500),
      ),
      child: SizedBox(
        width: sizeScreen.width * .85,
        height: sizeScreen.height * .058,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              isExpanded: true,
              hint: Text(widget.text),
              value: _value,
              style: const TextStyle(color: Colors.black, fontSize: 14),
              items: widget.items.map((String posiciones) {
                return DropdownMenuItem(
                  value: posiciones,
                  child: Text(posiciones),
                );
              }).toList(),
              onChanged: (String? newValue) => setState(() {
                    _value = newValue!;
                  })),
        ),
      ),
    );
  }
}

Widget _button(context, Size size) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      alignment: Alignment(size.width / 2, size.height),
      backgroundColor: const Color(0xFF011C53),
      padding: EdgeInsets.symmetric(
        vertical: size.width * .035,
        horizontal: size.width * .09,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Ingresar al equipo',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          LayoutBottomNavigatorBar.id, (Route<dynamic> route) => false);
    },
  );
}

/**
 * Clase generica de text labels
 */
class _textFieldGeneral extends StatefulWidget {
  final String labelText; //Texto del label
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final Function onChanged;
  final bool obscureText;
  final TextEditingController myControler;

  const _textFieldGeneral(
      {required this.labelText,
      this.hintText,
      this.keyboardType,
      required this.onChanged,
      this.obscureText = false,
      required this.myControler});

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return Container(
      width: sizeScreen.width * .85,
      child: TextField(
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
