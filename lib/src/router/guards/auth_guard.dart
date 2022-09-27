// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/models/user_model.dart';
import 'package:cashcollect/src/riverpods/firestore_riverpods.dart';
import 'package:cashcollect/src/services/hive/userbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AuthGuard({
    required this.ref,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    FirebaseAuth.instance.authStateChanges().listen(
      (state) async {
        if (state != null) {
          UserModel user = await ref
              .read(FirestoreRiverpods.userServicesRiverpods)
              .getUser();
          UserBox.add(user);
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
