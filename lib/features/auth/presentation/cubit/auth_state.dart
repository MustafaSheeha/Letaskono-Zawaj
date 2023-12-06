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

final class PasswordResetLoadingState extends AuthState {}

final class PasswordResetSuccessState extends AuthState {}

final class PasswordResetFailureState extends AuthState {
  final String errorMessege;

  PasswordResetFailureState({required this.errorMessege});
}

final class TermsAndConditionState extends AuthState {}

final class SetGenderState extends AuthState {}

final class ConnectionLoadingState extends AuthState {}

final class ConnectionSuccessState extends AuthState {}

final class ConnectionFailureState extends AuthState {
  final String errorMessege;

  ConnectionFailureState({required this.errorMessege});
}

final class CreateProfileLoadingState extends AuthState {}

final class CreateProfileSuccessState extends AuthState {}

final class CreateProfileFailureState extends AuthState {
  final String errorMessege;

  CreateProfileFailureState({required this.errorMessege});
}
