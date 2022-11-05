import 'package:flutter/widgets.dart';
import 'package:soccer_management/Screens/joinTeam.dart';
import 'package:soccer_management/Screens/logIn.dart';
import '../bottom_drawer_layout.dart';
import '../Screens/logup.dart';
import '../Screens/notifications.dart';
import '../Screens/calendar.dart';
import '../Screens/principal.dart';

var customRoutes = <String, WidgetBuilder>{
  LayoutBottomNavigatorBar.id:(_) => LayoutBottomNavigatorBar(),
  LogUpPage.id:(_)=> LogUpPage(),
  LogInPage.id:(_)=> LogInPage(),
  PrincipalPage.id:(_) => PrincipalPage(),
  CalendarPage.id:(_) => CalendarPage(),
  JoinTeamPage.id:(_) => JoinTeamPage(),
};