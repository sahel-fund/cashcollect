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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:cashcollect/src/screens/auth/login.dart' as _i3;
import 'package:cashcollect/src/screens/auth/signup.dart' as _i4;
import 'package:cashcollect/src/screens/home.dart' as _i2;
import 'package:cashcollect/src/screens/settings.dart' as _i6;
import 'package:cashcollect/src/screens/survey/surveys.dart' as _i5;
import 'package:cashcollect/src/screens/welcome.dart' as _i1;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Welcome(),
      );
    },
    Home.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
      );
    },
    Login.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.Login(),
      );
    },
    Signup.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.Signup(),
      );
    },
    Surveys.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.Surveys(),
      );
    },
    Settings.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.Settings(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          Welcome.name,
          path: '/',
        ),
        _i7.RouteConfig(
          Home.name,
          path: '/home',
          children: [
            _i7.RouteConfig(
              Login.name,
              path: 'login',
              parent: Home.name,
            ),
            _i7.RouteConfig(
              Signup.name,
              path: 'signup',
              parent: Home.name,
            ),
            _i7.RouteConfig(
              Surveys.name,
              path: 'surveys',
              parent: Home.name,
            ),
            _i7.RouteConfig(
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
class Welcome extends _i7.PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [_i2.Home]
class Home extends _i7.PageRouteInfo<void> {
  const Home({List<_i7.PageRouteInfo>? children})
      : super(
          Home.name,
          path: '/home',
          initialChildren: children,
        );

  static const String name = 'Home';
}

/// generated route for
/// [_i3.Login]
class Login extends _i7.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: 'login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i4.Signup]
class Signup extends _i7.PageRouteInfo<void> {
  const Signup()
      : super(
          Signup.name,
          path: 'signup',
        );

  static const String name = 'Signup';
}

/// generated route for
/// [_i5.Surveys]
class Surveys extends _i7.PageRouteInfo<void> {
  const Surveys()
      : super(
          Surveys.name,
          path: 'surveys',
        );

  static const String name = 'Surveys';
}

/// generated route for
/// [_i6.Settings]
class Settings extends _i7.PageRouteInfo<void> {
  const Settings()
      : super(
          Settings.name,
          path: 'settings',
        );

  static const String name = 'Settings';
}
