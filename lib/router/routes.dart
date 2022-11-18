import 'package:flutter/widgets.dart';
import 'package:soccer_management/ScreensUser/Number.dart';
import 'package:soccer_management/ScreensUser/changePass.dart';
import 'package:soccer_management/ScreensUser/editNotifications.dart';
import 'package:soccer_management/ScreensUser/team.dart';
import '../ScreensUser/editData.dart';
import '../ScreensUser/forgotpass.dart';
import '../ScreensUser/joinTeam.dart';
import '../ScreensUser/profile.dart';
import '../bottom_drawer_layout.dart';
import '../logup.dart';
import '../ScreensUser/calendar.dart';
import '../ScreensUser/principal.dart';
import '../logIn.dart';

var customRoutes = <String, WidgetBuilder>{
  LayoutBottomNavigatorBarUser.id: (_) => const LayoutBottomNavigatorBarUser(),
  LayoutBottomNavigatorBarReferee.id: (_) =>
      const LayoutBottomNavigatorBarReferee(),
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
  NumberPage.id: (_) => NumberPage(),
};
