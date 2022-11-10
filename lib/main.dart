import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/logIn.dart';
import '../router/routes.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
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
