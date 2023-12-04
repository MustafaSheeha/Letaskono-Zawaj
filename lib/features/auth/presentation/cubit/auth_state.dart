 class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {}

final class AuthFailureState extends AuthState {
  final String errorMessege;

  AuthFailureState({required this.errorMessege});
}