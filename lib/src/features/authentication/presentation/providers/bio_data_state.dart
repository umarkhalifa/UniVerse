import 'dart:ui';

import 'package:uni_verse/src/core/constants/assets.dart';

enum Gender {male,female}
extension ToGender on Gender{
  String toGender(){
    switch(this){
      case Gender.male:
        return UniVerseAssets.male4;
      case Gender.female:
        return UniVerseAssets.female4;
    }
  }
}
class RegistrationState {
  final bool? isLoading;
  final String? errorMessage;
  final Gender? gender;
  final String? avatar;
  final Color? theme;
  final String? level;
  final List<String>? avatars;

  RegistrationState(
      this.isLoading, this.errorMessage, this.gender, this.avatar, this.theme, this.level, this.avatars);

  RegistrationState.initial( {
    this.isLoading = false,
    this.errorMessage = '',
    this.gender = Gender.male,
    this.avatar = '',
    this.theme = const Color(0XFFf5cbbf),
    this.level = '100 Level',
    this.avatars = const [],
  });

  RegistrationState copyWith(
      {bool? isLoading, String? errorMessage, Gender? gender, String? avatar, Color? theme, String? level, List<String>? avatars}) {
    return RegistrationState(
        isLoading ?? this.isLoading,
        errorMessage ?? this.errorMessage,
        gender ?? this.gender,
        avatar ?? this.avatar,
      theme ?? this.theme,
      level ?? this.level,
      avatars ?? this.avatars
    );
  }
}
