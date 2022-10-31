// clase widget para labels
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';


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
