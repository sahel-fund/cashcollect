import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/screens/home.dart';
import 'package:cashcollect/src/screens/welcome.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Welcome, path: '/', initial: true),
    AutoRoute(page: Home, path: '/home'),
  ],
)
class $AppRouter {}
