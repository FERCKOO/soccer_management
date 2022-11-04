import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class CalendarPage extends StatelessWidget {
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
           * Nombre de la liga
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
            // Caja para el filtro
            SizedBox(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          // Filtro
                          child: InkWell(
                            onTap: () {},
                            // Contenedor del filtro
                            child: Container(
                              height: 25,
                              color: Color(0xFF011C53),
                              margin: EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              // Contenedor del nombre
                              child: Row(children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: Text(
                                    'Liga',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // Contenedor de la flecha para abajo
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 5.0, top: 2.0),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 17,
                                      color: Colors.white,
                                    )),
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
                ],
              ),
            ),
            // Contenedor del mes
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              margin: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Row(children: [
                //Contenedor del mes
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Nombre mes',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'lato'),
                  ),
                ),
              ]),
            ),
            HorizontalCalendar(
              date: DateTime.now(),
              textColor: Colors.black45,
              backgroundColor: Colors.white,
              selectedColor: Colors.blue,
              onDateSelected: (date) => print(
                date.toString(),
              ),
            ),
            Text(
              'Upcoming',
              style: TextStyle(
                color: Color(0xFF011C53),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
            ),

            // Carta para los partidos
            Container(
              child: Card(
                elevation: 10,
                color: Colors.white,
                child: SizedBox(
                  width: 300,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GeeksforGeeks',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato'), //Textstyle
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text('Ubicacion del partido')
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.av_timer),
                              Text('Hora del partido')
                            ],
                          ),
                        ),
                        /**
                         * Linea horizontal.
                        */
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'k',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ), //Textstyle
                        ), //Text
                        const SizedBox(
                          height: 10,
                        ), //SizedBox//SizedBox
                      ],
                    ), //Column
                  ), //Padding
                ), //SizedBox
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
