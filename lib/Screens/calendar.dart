import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';

class CalendarPage extends StatelessWidget{
  static String id = 'Calendar_Page';
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
          'Calendario',
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
      body: SizedBox.expand(
        child: Column(
          children: [
            /*
              * Imagen de la liga.
            */
          Container(
            padding: EdgeInsets.only(top: 34),
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.image,
              size: 70,
            ),
          ),
          /**
           * Nombre del jugador
           */
          Container(
            child: Text(
              'Nombre de liga',
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
            Text('data')
          ],
        ),
      ),
    )
    );
  }

}