import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/screens/auth/login.dart';
import 'package:cashcollect/src/screens/auth/signup.dart';
import 'package:cashcollect/src/screens/home.dart';
import 'package:cashcollect/src/screens/settings.dart';
import 'package:cashcollect/src/screens/survey/surveys.dart';
import 'package:cashcollect/src/screens/welcome.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Welcome, path: '/', initial: true),
    AutoRoute(page: Home, path: '/home', children: [
      AutoRoute(page: Login, path: 'login'),
      AutoRoute(page: Signup, path: 'signup'),
      AutoRoute(page: Surveys, path: 'surveys'),
      AutoRoute(page: Settings, path: 'settings'),
    ]),
  ],
)
class $AppRouter {}
