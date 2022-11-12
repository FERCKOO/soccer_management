import 'package:flutter/widgets.dart';
import 'package:soccer_management/Screens/changePass.dart';
import 'package:soccer_management/Screens/editNotifications.dart';
import 'package:soccer_management/Screens/team.dart';
import '../Screens/editData.dart';
import '../Screens/forgotpass.dart';
import '../Screens/joinTeam.dart';
import '../Screens/logIn.dart';
import '../Screens/profile.dart';
import '../bottom_drawer_layout.dart';
import '../Screens/logup.dart';
import '../Screens/calendar.dart';
import '../Screens/principal.dart';

var customRoutes = <String, WidgetBuilder>{
  LayoutBottomNavigatorBar.id: (_) => const LayoutBottomNavigatorBar(),
  LogUpPage.id: (_) => LogUpPage(),
  LogInPage.id: (_) => LogInPage(),
  ForgotPassPage.id: (_) => ForgotPassPage(),
  PrincipalPage.id: (_) => PrincipalPage(),
  CalendarPage.id: (_) => CalendarPage(),
  JoinTeamPage.id: (_) => JoinTeamPage(),
  PorfilePage.id: (_) => PorfilePage(),
  EditDataPage.id: (_) => EditDataPage(),
  ChangePassPage.id: (_) => ChangePassPage(),
  editNotificationsPage.id: (_) => editNotificationsPage(),
  TeamPage.id: (_) => TeamPage(),
};
