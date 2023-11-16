import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/router/router.dart';

class SnackBarService {
  void showErrorMessageSnackBar(String errorMessage) {
    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: UniVerseColours.kPurple,
        ),
      );
    }
  }
}

final snackBarProvider = Provider((ref) {
  return SnackBarService();
});
