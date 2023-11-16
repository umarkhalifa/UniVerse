import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/core/constants/colors.dart';

final themeProvider = Provider(
  (ref) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: UniVerseColours.kPurple,
        onPrimary: UniVerseColours.kWhite,
        secondary: UniVerseColours.kGray,
        onSecondary: UniVerseColours.kWhite,
        error: Colors.red,
        onError: UniVerseColours.kWhite,
        background: UniVerseColours.kBackground,
        onBackground: UniVerseColours.kDark,
        surface: UniVerseColours.kWhite,
        onSurface: UniVerseColours.kDark,
      ),
      scaffoldBackgroundColor: UniVerseColours.kBackground,
      fontFamily: "Faktum",

    );
  },
);
