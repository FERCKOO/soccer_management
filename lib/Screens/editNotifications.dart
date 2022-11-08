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
                padding: const EdgeInsets.symmetric(vertical: 18),
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
                   * Switch para activar el dark mode
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
                padding: const EdgeInsets.symmetric(vertical: 18),
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
                   * Switch para activar el dark mode
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
  return _switch();
}

Widget _switchNotifyPhone() {
  return _switch();
}

class _switch extends StatefulWidget {
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
        });
  }
}
