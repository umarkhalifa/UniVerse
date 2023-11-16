class SignInState {
  final bool? loading;
  final bool? hasError;
  final String? errorMessage;

  SignInState({this.loading, this.hasError, this.errorMessage});

  SignInState.initial(
      {this.loading = false, this.hasError = false, this.errorMessage = ''});

  SignInState copyWith({
    bool? loading,
    bool? hasError,
    String? errorMessage,
  }) {
    return SignInState(
      loading: loading ?? this.loading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
