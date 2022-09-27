// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AuthGuard({
    required this.ref,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    FirebaseAuth.instance.authStateChanges().listen(
      (state) {
        if (state != null) {
          resolver.next();
        } else {
          router.replaceNamed('/signup');
        }
      },
      onError: (err) {},
      onDone: () {},
    );
  }
}
