import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/core/router/router.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/authentication/data/data_source/auth_local_data_source.dart';
import 'package:uni_verse/src/features/authentication/domain/usecases/register_use_case.dart';
import 'package:uni_verse/src/features/authentication/presentation/providers/sign_in_state.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

class RegisterNotifier extends StateNotifier<SignInState> {
  RegisterNotifier(this._useCase, this.ref) : super(SignInState.initial());

  final RegisterUseCase _useCase;
  final Ref ref;

  Future<void> registerWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    state = state.copyWith(loading: true);
    final data = await _useCase.call(
      RegisterParams(
        email.trim(),
        password.trim(),
        name.trim(),
      ),
    );
    state = data.fold(
      (l) {
        ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
        return state.copyWith(
            loading: false, hasError: true, errorMessage: l.message);
      },
      (r) {
        ref.read(routerProvider).pushReplacementNamed(RouterNames.selectGender.name);
        ref.read(authLocalProvider).setTier(2);
        return state.copyWith(
            loading: false, hasError: false, errorMessage: '');

      },
    );
  }
}

final registerNotifier =
    StateNotifierProvider<RegisterNotifier, SignInState>((ref) {
  final useCase = ref.read(registerCaseProvider);
  return RegisterNotifier(useCase,ref);
});
