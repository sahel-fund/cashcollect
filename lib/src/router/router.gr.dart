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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:cashcollect/src/screens/auth/login.dart' as _i2;
import 'package:cashcollect/src/screens/auth/signup.dart' as _i3;
import 'package:cashcollect/src/screens/history.dart' as _i7;
import 'package:cashcollect/src/screens/home.dart' as _i4;
import 'package:cashcollect/src/screens/intro.dart' as _i5;
import 'package:cashcollect/src/screens/settings.dart' as _i8;
import 'package:cashcollect/src/screens/survey/surveys.dart' as _i6;
import 'package:cashcollect/src/screens/welcome.dart' as _i1;
import 'package:flutter/material.dart' as _i10;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Welcome(),
      );
    },
    Login.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Login(),
      );
    },
    Signup.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.Signup(),
      );
    },
    Home.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.Home(),
      );
    },
    Intro.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.Intro(),
      );
    },
    Surveys.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.Surveys(),
      );
    },
    History.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.History(),
      );
    },
    Settings.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.Settings(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          Welcome.name,
          path: '/',
        ),
        _i9.RouteConfig(
          Login.name,
          path: '/login',
        ),
        _i9.RouteConfig(
          Signup.name,
          path: '/signup',
        ),
        _i9.RouteConfig(
          Home.name,
          path: '/home',
          children: [
            _i9.RouteConfig(
              Intro.name,
              path: 'intro',
              parent: Home.name,
            ),
            _i9.RouteConfig(
              Surveys.name,
              path: 'surveys',
              parent: Home.name,
            ),
            _i9.RouteConfig(
              History.name,
              path: 'history',
              parent: Home.name,
            ),
            _i9.RouteConfig(
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
class Welcome extends _i9.PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [_i2.Login]
class Login extends _i9.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i3.Signup]
class Signup extends _i9.PageRouteInfo<void> {
  const Signup()
      : super(
          Signup.name,
          path: '/signup',
        );

  static const String name = 'Signup';
}

/// generated route for
/// [_i4.Home]
class Home extends _i9.PageRouteInfo<void> {
  const Home({List<_i9.PageRouteInfo>? children})
      : super(
          Home.name,
          path: '/home',
          initialChildren: children,
        );

  static const String name = 'Home';
}

/// generated route for
/// [_i5.Intro]
class Intro extends _i9.PageRouteInfo<void> {
  const Intro()
      : super(
          Intro.name,
          path: 'intro',
        );

  static const String name = 'Intro';
}

/// generated route for
/// [_i6.Surveys]
class Surveys extends _i9.PageRouteInfo<void> {
  const Surveys()
      : super(
          Surveys.name,
          path: 'surveys',
        );

  static const String name = 'Surveys';
}

/// generated route for
/// [_i7.History]
class History extends _i9.PageRouteInfo<void> {
  const History()
      : super(
          History.name,
          path: 'history',
        );

  static const String name = 'History';
}

/// generated route for
/// [_i8.Settings]
class Settings extends _i9.PageRouteInfo<void> {
  const Settings()
      : super(
          Settings.name,
          path: 'settings',
        );

  static const String name = 'Settings';
}
