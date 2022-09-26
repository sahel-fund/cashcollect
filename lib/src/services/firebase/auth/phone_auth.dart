import 'package:cashcollect/src/riverpods/auth_riverpods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Authentication {
  final Reader _read;
  Authentication(this._read);
  final _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required String pin,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential creds) {},
      timeout: const Duration(seconds: 60),
      verificationFailed: (exception) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        signInWithPhoneNumber(
          verificationId: verificationId,
          smsCode: pin,
        );
      },
    );
  }

  Future<void> signInWithPhoneNumber(
      {required String verificationId, required String smsCode}) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await _read(AuthRiverpods.firebaseAuthProvider)
        .signInWithCredential(credential);
  }
}
