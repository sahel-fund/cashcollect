import 'package:cashcollect/src/models/user_model.dart';
import 'package:cashcollect/src/riverpods/auth_riverpods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserServices {
  final Reader _read;
  UserServices(this._read);
  final _firestore = FirebaseFirestore.instance;

  Future<bool> createUser(UserModel data) async {
    final uid = _read(AuthRiverpods.firebaseAuthProvider).currentUser!.uid;
    try {
      await _firestore.collection('users').doc(uid).set(
            data
                .copyWith(uid: _read(AuthRiverpods.currentUserRiverpod)?.uid)
                .toMap(),
          );
      return true;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
