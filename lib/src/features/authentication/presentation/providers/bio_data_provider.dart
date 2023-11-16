import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/core/router/router.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/authentication/data/data_source/auth_local_data_source.dart';
import 'package:uni_verse/src/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:uni_verse/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

import 'auth_providers.dart';

class BioDataNotifier extends StateNotifier<RegistrationState> {
  BioDataNotifier(this._authRepository, this._ref)
      : super(RegistrationState.initial());

  final AuthRepository _authRepository;
  final Ref _ref;

  Future<void> fetchAvatars() async {
    state = state.copyWith(isLoading: true);

    final value =
        await _authRepository.fetchAvatars(gender: state.gender!.name);

    state = value.fold((l) {
      return state.copyWith(
          isLoading: false,
          errorMessage: 'Something went wrong please try again');
    }, (r) {
      return state.copyWith(isLoading: false, avatars: r);
    });
  }

  Future<void> setBioData(
      {required String userName,
      required String regNumber,}) async {
    state = state.copyWith(isLoading: true);
    final data = await _authRepository.setBioData(
        userName: userName,
        department: 'Software Engineering',
        regNumber: regNumber,
        level: state.level!,
        color: state.theme!.value,
        gender: state.gender!.name,
        avatar: state.avatar!);
    state = data.fold(
      (l) {
        _ref
            .read(snackBarProvider)
            .showErrorMessageSnackBar('Something went wrong please try again');
        return state.copyWith(isLoading: false);
      },
      (r) {
        _ref.read(authLocalProvider).setTier(3);
        _ref
            .read(routerProvider)
            .pushReplacementNamed(RouterNames.navigation.name);
        return state.copyWith(isLoading: false);
      },
    );
  }

//  ! UPDATE GENDER
  void updateGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  //  ! UPDATE GENDER
  void updateAvatar(String avatar) {
    state = state.copyWith(avatar: avatar);
  }

//  ! UPDATE COLOR
  void updateColor(Color color) {
    state = state.copyWith(theme: color);
  }

//  ! UPDATE LEVEL
  void updateLevel(String level) {
    state = state.copyWith(level: level);
  }
}

final bioDataNotifier =
    StateNotifierProvider<BioDataNotifier, RegistrationState>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return BioDataNotifier(repo, ref);
});
