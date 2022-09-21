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
import 'package:cashcollect/src/screens/history.dart' as _i5;
import 'package:cashcollect/src/screens/home.dart' as _i2;
import 'package:cashcollect/src/screens/intro.dart' as _i3;
import 'package:cashcollect/src/screens/settings.dart' as _i6;
import 'package:cashcollect/src/screens/survey/surveys.dart' as _i4;
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
    Intro.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.Intro(),
      );
    },
    Surveys.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.Surveys(),
      );
    },
    History.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.History(),
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
              Intro.name,
              path: 'intro',
              parent: Home.name,
            ),
            _i7.RouteConfig(
              Surveys.name,
              path: 'surveys',
              parent: Home.name,
            ),
            _i7.RouteConfig(
              History.name,
              path: 'history',
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
/// [_i3.Intro]
class Intro extends _i7.PageRouteInfo<void> {
  const Intro()
      : super(
          Intro.name,
          path: 'intro',
        );

  static const String name = 'Intro';
}

/// generated route for
/// [_i4.Surveys]
class Surveys extends _i7.PageRouteInfo<void> {
  const Surveys()
      : super(
          Surveys.name,
          path: 'surveys',
        );

  static const String name = 'Surveys';
}

/// generated route for
/// [_i5.History]
class History extends _i7.PageRouteInfo<void> {
  const History()
      : super(
          History.name,
          path: 'history',
        );

  static const String name = 'History';
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
