// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class editNotificationsPage extends StatelessWidget {
  static String id = 'EditNotifications_Page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

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
            'Editar notificaciones',
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /**
               * Container de notifiaciones de celular
               */
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(
                    top: sizeScreen.height * .2,
                    bottom: sizeScreen.height * .15,
                    start: sizeScreen.width * .05,
                    end: sizeScreen.width * .09),
                padding:
                    EdgeInsets.symmetric(vertical: sizeScreen.height * .02),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC8C8C8),
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Notificaciones de celular',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                    ),
                    /**
                   * Switch
                  */
                    _switchNotifyPhone(),
                  ],
                ),
              ),
              /**
             * Contenedor de notificaciones de correo
             */
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(
                    start: sizeScreen.width * .05, end: sizeScreen.width * .09),
                padding:
                    EdgeInsets.symmetric(vertical: sizeScreen.height * .02),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC8C8C8),
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Notificaciones de correo',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                    ),
                    /**
                   * Switch
                  */
                    _switchNotifyEmail(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _switchNotifyEmail() {
  return _switch(
    text: '''Indique con cuantas horas de antelacion quiere que le lleguen notificaciones a su correo.
                          ''',
    items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
  );
}

Widget _switchNotifyPhone() {
  return _switch(
    text: '''Indique con cuantas horas de antelacion quiere que le lleguen notificaciones a su telefono.
                          ''',
    items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
  );
}

class _switch extends StatefulWidget {
  final String text;
  final items;

  _switch({
    required this.text,
    required this.items
    
  });

  @override
  State<StatefulWidget> createState() => _switchState();
}

class _switchState extends State<_switch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        inactiveTrackColor: const Color(0xFF3A4280),
        activeTrackColor: const Color(0xFF00002B),
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });

          (_value)
              ? AwesomeDialog(
                  dialogType: DialogType.noHeader,
                  context: context,
                  // ignore: deprecated_member_use
                  animType: AnimType.SCALE,
                  title: 'Notificacion',
                  body: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'),
                        ),
                        _DropDown(
                          text: '   Hora',
                          items: widget.items,
                        ),
                      ],
                    ),
                  ),
                  btnOkColor: const Color(0xFF011C53),
                  btnOkText: 'Ok',
                  btnOkOnPress: () {},
                ).show()
              : null;
        });
  }
}

class _DropDown extends StatefulWidget {
  String text;
  var items = [''];

  _DropDown({
    required this.text,
    required this.items
  });

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