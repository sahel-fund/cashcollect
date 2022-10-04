// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:cashcollect/src/router/guards/auth_guard.dart' as _i13;
import 'package:cashcollect/src/router/guards/auth_listener.dart' as _i12;
import 'package:cashcollect/src/screens/auth/login.dart' as _i2;
import 'package:cashcollect/src/screens/auth/signup.dart' as _i3;
import 'package:cashcollect/src/screens/history.dart' as _i8;
import 'package:cashcollect/src/screens/home.dart' as _i5;
import 'package:cashcollect/src/screens/intro.dart' as _i6;
import 'package:cashcollect/src/screens/settings.dart' as _i9;
import 'package:cashcollect/src/screens/survey/survey_intro.dart' as _i4;
import 'package:cashcollect/src/screens/survey/surveys.dart' as _i7;
import 'package:cashcollect/src/screens/welcome.dart' as _i1;
import 'package:flutter/material.dart' as _i11;

class AppRouter extends _i10.RootStackRouter {
  AppRouter({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.authListener,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i12.AuthListener authListener;

  final _i13.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Welcome(),
      );
    },
    Login.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Login(),
      );
    },
    Signup.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.Signup(),
      );
    },
    SurveyIntro.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SurveyIntro(),
      );
    },
    Home.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.Home(),
      );
    },
    Intro.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.Intro(),
      );
    },
    Surveys.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.Surveys(),
      );
    },
    History.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.History(),
      );
    },
    Settings.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.Settings(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          Welcome.name,
          path: '/',
          guards: [authListener],
        ),
        _i10.RouteConfig(
          Login.name,
          path: '/login',
        ),
        _i10.RouteConfig(
          Signup.name,
          path: '/signup',
        ),
        _i10.RouteConfig(
          SurveyIntro.name,
          path: '/survey-intro',
        ),
        _i10.RouteConfig(
          Home.name,
          path: '/home',
          guards: [authGuard],
          children: [
            _i10.RouteConfig(
              Intro.name,
              path: 'intro',
              parent: Home.name,
            ),
            _i10.RouteConfig(
              Surveys.name,
              path: 'surveys',
              parent: Home.name,
            ),
            _i10.RouteConfig(
              History.name,
              path: 'history',
              parent: Home.name,
            ),
            _i10.RouteConfig(
              Settings.name,
              path: 'settings',
              parent: Home.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.Welcome]
class Welcome extends _i10.PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [_i2.Login]
class Login extends _i10.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i3.Signup]
class Signup extends _i10.PageRouteInfo<void> {
  const Signup()
      : super(
          Signup.name,
          path: '/signup',
        );

  static const String name = 'Signup';
}

/// generated route for
/// [_i4.SurveyIntro]
class SurveyIntro extends _i10.PageRouteInfo<void> {
  const SurveyIntro()
      : super(
          SurveyIntro.name,
          path: '/survey-intro',
        );

  static const String name = 'SurveyIntro';
}

/// generated route for
/// [_i5.Home]
class Home extends _i10.PageRouteInfo<void> {
  const Home({List<_i10.PageRouteInfo>? children})
      : super(
          Home.name,
          path: '/home',
          initialChildren: children,
        );

  static const String name = 'Home';
}

/// generated route for
/// [_i6.Intro]
class Intro extends _i10.PageRouteInfo<void> {
  const Intro()
      : super(
          Intro.name,
          path: 'intro',
        );

  static const String name = 'Intro';
}

/// generated route for
/// [_i7.Surveys]
class Surveys extends _i10.PageRouteInfo<void> {
  const Surveys()
      : super(
          Surveys.name,
          path: 'surveys',
        );

  static const String name = 'Surveys';
}

/// generated route for
/// [_i8.History]
class History extends _i10.PageRouteInfo<void> {
  const History()
      : super(
          History.name,
          path: 'history',
        );

  static const String name = 'History';
}

/// generated route for
/// [_i9.Settings]
class Settings extends _i10.PageRouteInfo<void> {
  const Settings()
      : super(
          Settings.name,
          path: 'settings',
        );

  static const String name = 'Settings';
}
