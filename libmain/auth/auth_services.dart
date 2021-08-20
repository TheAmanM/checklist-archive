import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

verifyPhone(phoneNumber) async {
  PhoneVerificationFailed verificationFailed = (AuthException authException) {
    // showSnackbar('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
  };

  PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {
    // showSnackbar('Please check your phone for the verification code.');
    // _verificationId = verificationId;
  };

  PhoneVerificationCompleted verificationCompleted = (AuthCredential phoneAuthCredential) async {
    await auth.signInWithCredential(phoneAuthCredential);
    // showSnackbar("Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
  };

  PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
    // showSnackbar("verification code: " + verificationId);
    // _verificationId = verificationId;
  };

  try {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  } catch (e) {
    print('failed: $e');
    // showSnackbar("Failed to Verify Phone Number: ${e}");
  }
}
