import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  late SharedPreferences preferences;

  Future<void> initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

//  OPENED ON BOARDING = 1
//  REGISTERED TIER = 2
// SET BIO DATA PROFILE = 3;

  int? getTier() {
    return preferences.getInt('tier') ?? 0;
  }

  void reset() {
    preferences.setInt('tier', 1);
  }

  void setTier(int tier) {
    preferences.setInt("tier", tier);
  }
}


final authLocalProvider = Provider((ref) => AuthLocalDataSource());