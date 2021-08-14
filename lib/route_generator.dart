import 'package:dialog_doc990_mobile/screens/channel_doctor/channel_doctor_screen.dart';
import 'package:dialog_doc990_mobile/screens/home/home_screen.dart';
import 'package:dialog_doc990_mobile/screens/login/login_screen.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_screen_1.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
        );
      case '/signup':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => SignUpScreen1(),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
        );
      case '/login':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => LoginScreen(),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
        );
      case '/channel-doctor':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => SearchDoctorScreen(),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[900],
          leading: IconButton(
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Icon(Icons.segment_rounded),
            ),
            onPressed: () {
              print('Error Route');
            },
          ),
        ),
        body: Center(
          child: Text(
            'Dear Customer, this is wrong route',
            style: TextStyle(
              fontFamily: 'Larsseit',
              fontSize: 25,
            ),
          ),
        ),
      );
    });
  }
}