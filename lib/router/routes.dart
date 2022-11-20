import 'package:flutter/widgets.dart';
import '../ScreensUser/Number.dart';
import '../ScreensUser/editNotifications.dart';
import '../ScreensUser/team.dart';
import '../ScreensUser/MatchToPlay.dart';
import '../ScreensUser/changePass.dart';
import '../ScreensUser/editData.dart';
import '../ScreensUser/forgotpass.dart';
import '../ScreensUser/joinLeague.dart';
import '../ScreensUser/joinTeam.dart';
import '../ScreensUser/profile.dart';
import '../bottom_drawer_layout.dart';
import '../ScreensUser/calendar.dart';
import '../ScreensUser/principal.dart';
import '../ScreensReferee/match.dart';
import '../logup.dart';
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
  MatchToPlay.id: (_) => MatchToPlay(),
  JoinLeaguePage.id: (_) => JoinLeaguePage(),
  JoinTeamPage.id: (_) => JoinTeamPage(),
  PorfilePage.id: (_) => PorfilePage(),
  EditDataPage.id: (_) => EditDataPage(),
  ChangePassPage.id: (_) => ChangePassPage(),
  editNotificationsPage.id: (_) => editNotificationsPage(),
  TeamPage.id: (_) => TeamPage(),
  NumberPage.id: (_) => NumberPage(),
  MatchPage.id: (_) => MatchPage(),
};
