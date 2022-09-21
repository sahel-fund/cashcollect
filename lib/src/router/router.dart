import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/screens/auth/login.dart';
import 'package:cashcollect/src/screens/auth/signup.dart';
import 'package:cashcollect/src/screens/home.dart';
import 'package:cashcollect/src/screens/welcome.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Welcome, path: '/', initial: true),
    AutoRoute(page: Home, path: '/home'),
    AutoRoute(page: Login, path: '/login'),
    AutoRoute(page: Signup, path: '/signup'),
  ],
)
class $AppRouter {}
