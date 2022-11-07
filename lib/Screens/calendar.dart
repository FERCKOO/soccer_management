import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class CalendarPage extends StatelessWidget {
  static String id = 'Calendar_Page';

  final int _cantTeams = 2;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size; // Tamaño de la pantalla
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        appBar: AppBar(
          backgroundColor: const Color(0xffF4F4F4),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Calendario',
            textAlign: TextAlign.center,
            style: const TextStyle(
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
            padding: const EdgeInsets.only(top: 34),
            alignment: Alignment.topCenter,
            child: const Icon(
              Icons.image,
              size: 70,
            ),
          ),
          /**
           * Nombre de la liga
           */
          Container(
            child: const Text(
              'Nombre de liga',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),

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
          // Caja para el filtro
          _DropDown(),

          /*

          */
          // Contenedor del mes
          /*
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

          /**
           * Calendario horizontal
           */

          HorizontalCalendar(
            date: DateTime.now(),
            textColor: Colors.black45,
            backgroundColor: Colors.white,
            selectedColor: Colors.blue,
            onDateSelected: (date) => print(
              date.toString(),
            ),
          ),
        */
          const SizedBox(
            height: 8,
          ),

          const Text(
            'Upcoming',
            style: const TextStyle(
              color: Color(0xFF011C53),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          // Carta para los partidos
          Expanded(
              child: ListView.builder(
                  itemCount: _cantTeams, // Cantidad de cartas a mostrar
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, int index) {
                    // For para imprimir los partidos

                    return Row(
                      children: [
                        const Text(
                          'Fecha del \npartido',
                          style: const TextStyle(
                            fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'
                          ),
                        ),
                        Card(
                          elevation: 10,
                          color: Colors.white,
                          child: SizedBox(
                            width: sizeScreen.width*.90,
                            height: (sizeScreen.height*.4) / _cantTeams,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Equipo 1 vs Equipo 2',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'
                                        ), //Textstyle
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Icon(Icons.location_on_outlined),
                                        const Text('Ubicacion del partido')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Icon(Icons.av_timer),
                                        const Text('Hora del partido')
                                      ],
                                    ),
                                  ),
                                  /**
                             * Linea horizontal.
                            */
                                  Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Estatus del partido',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }))
        ])),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class _DropDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DropDownState();

}

class _DropDownState extends State<_DropDown>{
    int? _value = 1;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        start: 35
      ),
              alignment: AlignmentDirectional.topStart,
      child: DropdownButton(
              value: _value,
              style: const TextStyle(
                color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                  ),
              items: [
                const DropdownMenuItem(
                  child: const Text('Liga'),
                  value: 1,
                ),
                const DropdownMenuItem(
                  child: const Text('Equipo'),
                  value: 2,
                )
              ],
              onChanged: (value) {
                setState(() {
                  _value = value as int?;
                });
              },
            ),
    );
  }
}