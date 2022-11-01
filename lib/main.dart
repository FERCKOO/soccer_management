import 'package:flutter/material.dart';
import 'Screens/notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Pantalla de inicio
      initialRoute: NotificationsPage.id,
      routes: {
        NotificationsPage.id:(context) => NotificationsPage(),
      },
    );
  }
}
