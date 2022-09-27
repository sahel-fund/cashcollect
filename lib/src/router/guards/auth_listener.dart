import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthListener extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    FirebaseAuth.instance.authStateChanges().listen(
      (state) {
        if (state != null) {
          router.replaceNamed('/home');
        } else {
          resolver.next(true);
        }
      },
      onError: (err) {},
      onDone: () {},
    );
  }
}
