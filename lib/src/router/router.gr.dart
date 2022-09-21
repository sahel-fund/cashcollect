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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:cashcollect/src/screens/auth/login.dart' as _i3;
import 'package:cashcollect/src/screens/auth/signup.dart' as _i4;
import 'package:cashcollect/src/screens/home.dart' as _i2;
import 'package:cashcollect/src/screens/welcome.dart' as _i1;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Welcome(),
      );
    },
    Home.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
      );
    },
    Login.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.Login(),
      );
    },
    Signup.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.Signup(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          Welcome.name,
          path: '/',
        ),
        _i5.RouteConfig(
          Home.name,
          path: '/home',
        ),
        _i5.RouteConfig(
          Login.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          Signup.name,
          path: '/signup',
        ),
      ];
}

/// generated route for
/// [_i1.Welcome]
class Welcome extends _i5.PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [_i2.Home]
class Home extends _i5.PageRouteInfo<void> {
  const Home()
      : super(
          Home.name,
          path: '/home',
        );

  static const String name = 'Home';
}

/// generated route for
/// [_i3.Login]
class Login extends _i5.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i4.Signup]
class Signup extends _i5.PageRouteInfo<void> {
  const Signup()
      : super(
          Signup.name,
          path: '/signup',
        );

  static const String name = 'Signup';
}
