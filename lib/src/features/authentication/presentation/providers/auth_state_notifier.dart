import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:uni_verse/src/features/authentication/domain/repository/auth_repository.dart';

class AuthStateNotifier extends StateNotifier<bool> {
  AuthStateNotifier(this._authRepository) : super(false){
    getUser();
  }

  final AuthRepository _authRepository;

  void getUser() {
    _authRepository.getUser().listen((event) {
        if (event == null) {
          state = false;
        } else {
          state = true;
        }
      },
    );
  }
}

final authStateNotifier = StateNotifierProvider<AuthStateNotifier, bool>(
  (ref) {
    final repo = ref.read(authRepositoryProvider);
    return AuthStateNotifier(repo);
  },
);
