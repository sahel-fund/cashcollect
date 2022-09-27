import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/router/guards/auth_guard.dart';
import 'package:cashcollect/src/screens/auth/login.dart';
import 'package:cashcollect/src/screens/auth/signup.dart';
import 'package:cashcollect/src/screens/history.dart';
import 'package:cashcollect/src/screens/home.dart';
import 'package:cashcollect/src/screens/intro.dart';
import 'package:cashcollect/src/screens/settings.dart';
import 'package:cashcollect/src/screens/survey/surveys.dart';
import 'package:cashcollect/src/screens/welcome.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Welcome, path: '/', initial: true),
    AutoRoute(page: Login, path: '/login', initial: false),
    AutoRoute(page: Signup, path: '/signup', initial: false),
    AutoRoute(
      page: Home,
      path: '/home',
      guards: [AuthGuard],
      children: [
        AutoRoute(page: Intro, path: 'intro'),
        AutoRoute(page: Surveys, path: 'surveys'),
        AutoRoute(page: History, path: 'history'),
        AutoRoute(page: Settings, path: 'settings'),
      ],
    ),
  ],
)
class $AppRouter {}
