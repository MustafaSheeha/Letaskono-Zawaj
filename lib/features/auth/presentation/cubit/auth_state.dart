class AuthState {}

final class AuthInitialState extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final String errorMessege;

  RegisterFailureState({required this.errorMessege});
}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailureState extends AuthState {
  final String errorMessege;

  LoginFailureState({required this.errorMessege});
}

final class TermsAndConditionState extends AuthState {}
