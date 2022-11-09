import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  static String id = 'JoinTeam_Page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        /*
         * Texto de inicio sesion
        */
        title: const Text(
          'Estadisticas',
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
          Container(
            child: ListView(
              prototypeItem: ListTile(
                        leading: CircleAvatar(
                            ),
                        title: Text(
                          'a',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'
                          ),
                          ),
                      ),
            )
          )
        ],
      ),
    ));
  }
}
