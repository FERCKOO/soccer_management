import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/logIn.dart';
import '../router/routes.dart';

void main() => runApp(MyApp());

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
      initialRoute: LogInPage.id,
      routes: customRoutes,
    );
  }
}
