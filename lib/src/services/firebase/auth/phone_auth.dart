import 'package:cashcollect/src/riverpods/auth_riverpods.dart';
import 'package:cashcollect/src/screens/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Authentication {
  final Reader _read;
  Authentication(this._read);
  final _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    //required String pin,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential creds) {
        debugPrint('Verification completed: $creds');
      },
      timeout: const Duration(seconds: 60),
      verificationFailed: (exception) {
        debugPrint('Verification failed: $exception');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _read(verificationID.state).state = verificationId;
      },
      codeSent: (String verificationId, forceResendingToken) async {
        _read(verificationID.state).state = verificationId;
      },
    );
  }

  signInWithPhoneNumber({required String smsCode}) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _read(verificationID.state).state,
      smsCode: smsCode,
    );

    await _read(AuthRiverpods.firebaseAuthProvider)
        .signInWithCredential(credential);
  }
}
