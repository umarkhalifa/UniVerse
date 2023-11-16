import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/authentication/domain/usecases/usecases.dart';
import 'package:uni_verse/src/features/authentication/presentation/providers/sign_in_state.dart';
import 'package:uni_verse/src/utils/snackbar.dart';


class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier(this._useCase, this._ref) : super(SignInState.initial());

  final SignInUseCase _useCase;
  final Ref _ref;

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    state = state.copyWith(loading: true);
    final value = await _useCase.call(SignInParams(email, password));
    state = value.fold(
      (l) {
        _ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
        return state = state.copyWith(
            loading: false, hasError: true, errorMessage: l.message);
      },
      (r) {
        return state =
            state.copyWith(loading: false, hasError: false, errorMessage: '');
      },
    );
  }
}

final signInNotifier = StateNotifierProvider<SignInNotifier,SignInState>((ref) {
  final useCase = ref.read(signInCaseProvider);
  return SignInNotifier(useCase,ref);
});