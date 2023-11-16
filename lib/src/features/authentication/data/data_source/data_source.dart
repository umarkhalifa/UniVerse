import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthenticationDataSource(this._firebaseAuth, this._firestore);

  // ! AUTH STATE
  Stream<User?> getUser() {
    return _firebaseAuth.authStateChanges();
  }

  // ! SIGN IN
  Future<bool> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(code: error.code)
          .appFirebaseAuthExceptionType()
          .toText();
    } catch (error) {
      throw FirebaseAuthException(code: 'none')
          .appFirebaseAuthExceptionType()
          .toText();
    }
  }

//  ! SIGN IN WITH GOOGLE

// ! SIGN UP
  Future<bool> registerWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user.user?.updateDisplayName(name);
      return true;
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(code: error.code)
          .appFirebaseAuthExceptionType()
          .toText();
    } catch (error) {
      throw FirebaseAuthException(code: 'none')
          .appFirebaseAuthExceptionType()
          .toText();
    }
  }

// ! FORGOT PASSWORD
  Future<bool> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(code: error.code)
          .appFirebaseAuthExceptionType();
    } catch (error) {
      throw FirebaseAuthException(code: 'none')
          .appFirebaseAuthExceptionType()
          .toText();
    }
  }

// ! SET BIO DATA INFORMATION
  Future<bool> setBioData(
      {required String userName,
      required String department,
      required String regNumber,
      required String level,
      required int color,
      required String gender,
      required String avatar}) async {
    try {
      await _firestore
          .collection("USERS")
          .doc(_firebaseAuth.currentUser?.uid)
          .set({
        'User Name': userName,
        'Department': department,
        'RegNumber': regNumber,
        'Level': level,
        'Color': color,
        'Gender': gender,
        'Avatar': avatar
      });
      return true;
    } catch (error) {
      throw Exception('Error setting bio data. Please try again');
    }
  }

//  ! FETCH MALE AVATARS
  Future<List<String>> fetchMaleAvatars({required String gender}) async {
    try {
      final List<String> avatars = [];
      final data = await _firestore
          .collection(gender.toUpperCase())
          .doc('AVATARS')
          .get();
      data.data()?.forEach((key, value) {
        avatars.add(value);
      });
      return avatars;
    } catch (e) {
      throw AppFirebaseAuthExceptionType.none.toText();
    }
  }


}

final authDataSourceProvider = Provider((ref) {
  return AuthenticationDataSource(
      FirebaseAuth.instance, FirebaseFirestore.instance);
});

enum AppFirebaseAuthExceptionType {
  invalidEmail,
  userDisabled,
  userNotFound,
  tooManyRequests,
  emailAlreadyInUse,
  weakPassword,
  wrongPassword,
  accountExists,
  invalidCredential,
  invalidVerification,
  userMismatch,
  networkUnavailable,
  expiredActivationCode,
  none
}

extension FirebaseErrorCode on FirebaseAuthException {
  AppFirebaseAuthExceptionType appFirebaseAuthExceptionType() {
    switch (code) {
      case 'invalid-email':
        return AppFirebaseAuthExceptionType.invalidEmail;
      case 'user-disabled':
        return AppFirebaseAuthExceptionType.userDisabled;
      case 'user-not-found':
        return AppFirebaseAuthExceptionType.userNotFound;
      case 'too-many-requests':
        return AppFirebaseAuthExceptionType.tooManyRequests;
      case 'email-already-in-use':
        return AppFirebaseAuthExceptionType.emailAlreadyInUse;
      case 'weak-password':
        return AppFirebaseAuthExceptionType.weakPassword;
      case 'wrong-password':
        return AppFirebaseAuthExceptionType.wrongPassword;
      case 'account-exists-with-different-credential':
        return AppFirebaseAuthExceptionType.accountExists;
      case 'invalid-credential':
        return AppFirebaseAuthExceptionType.invalidCredential;
      case 'invalid-verification-id':
        return AppFirebaseAuthExceptionType.invalidVerification;
      case 'user-mismatch':
        return AppFirebaseAuthExceptionType.userMismatch;
      case 'network-request-failed':
        return AppFirebaseAuthExceptionType.networkUnavailable;
      case 'expired-action-code':
        return AppFirebaseAuthExceptionType.expiredActivationCode;
      default:
        return AppFirebaseAuthExceptionType.none;
    }
  }
}

extension ToString on AppFirebaseAuthExceptionType {
  String toText() {
    switch (this) {
      case AppFirebaseAuthExceptionType.invalidEmail:
        return 'Invalid email address or password';
      case AppFirebaseAuthExceptionType.userDisabled:
        return 'This account has been disable.Please contact admin';
      case AppFirebaseAuthExceptionType.userNotFound:
        return 'User with this credentials not found';
      case AppFirebaseAuthExceptionType.tooManyRequests:
        return 'Too many attempts. Please try again';
      case AppFirebaseAuthExceptionType.emailAlreadyInUse:
        return 'User with this credentials already exists';
      case AppFirebaseAuthExceptionType.weakPassword:
        return 'Please trying using a stronger password';
      case AppFirebaseAuthExceptionType.wrongPassword:
        return 'Invalid email address or password';
      case AppFirebaseAuthExceptionType.accountExists:
        return 'User with this credentials already exists';
      case AppFirebaseAuthExceptionType.invalidCredential:
        return 'User with this credentials already exists';
      case AppFirebaseAuthExceptionType.invalidVerification:
        return 'Invalid verification code. Please try again';
      case AppFirebaseAuthExceptionType.userMismatch:
        return 'Invalid auth credentials. Please try again';
      case AppFirebaseAuthExceptionType.networkUnavailable:
        return 'Network unavailable. Please try again';
      case AppFirebaseAuthExceptionType.expiredActivationCode:
        return 'Invalid Verification code. Please try again';
      case AppFirebaseAuthExceptionType.none:
        return 'Something went wrong. Please try again';
      default:
        return 'Something went wrong. Please try again';
    }
  }
}
