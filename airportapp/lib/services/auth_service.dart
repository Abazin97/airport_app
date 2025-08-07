import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential?> signIn({
    required String login,
    String? password,
    String? smsCode,
    String? verificationId,
  }) async {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (emailRegex.hasMatch(login)) {
      // Вход по email + пароль
      if (password == null || password.isEmpty) {
        throw FirebaseAuthException(
          code: "missing-password",
          message: "Введите пароль для входа по email",
        );
      }
      return await firebaseAuth.signInWithEmailAndPassword(
        email: login,
        password: password,
      );
    } else {
      // Вход по телефону (через verificationId + smsCode)
      if (verificationId == null || smsCode == null) {
        throw FirebaseAuthException(
          code: "missing-sms-code",
          message: "Не хватает verificationId или smsCode для входа по телефону",
        );
      }

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      return await firebaseAuth.signInWithCredential(credential);
    }
  }


  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(FirebaseAuthException error) onError,
    required Function(String verificationId) onTimeout,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (_){},
      verificationFailed: (e) {
        onError(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        onTimeout(verificationId);
      },
    );
  }
  

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  })async {
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);  
  }


  Future<void> signOut()async {
    await firebaseAuth.signOut();
  }


  Future<void> resetPassword({
    required String email,
  }) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }


  Future<void> updateUsername({
    required String username,
  })async{
    await currentUser!.updateDisplayName(username);
  }


  Future<void> deleteAccount({
    required String email,
    required String password,
  })async{
    AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }


  Future<void> resetPasswordFromCurrent({
    required String currentPassword,
    required String newPassword,
    required String email,
  })async{
    AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassword);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}
