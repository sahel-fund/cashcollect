import 'package:cashcollect/src/screens/auth/login.dart';
import 'package:cashcollect/src/screens/auth/signup.dart';
import 'package:cashcollect/src/screens/welcome.dart';
import 'package:cashcollect/src/widgets/errors/navigation_error.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  restorationScopeId: 'cash_collect_router',
  initialLocation: '/',
  errorBuilder: (context, state) => NavigationError(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Welcome();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) {
        return const Signup();
      },
    ),
  ],
);
