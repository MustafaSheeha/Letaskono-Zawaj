class AuthState {}

final class AuthInitialState extends AuthState {}

// //////////////////////////////////////////////////////////////////////////////////////
final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final String errorMessege;

  RegisterFailureState({required this.errorMessege});
}
// //////////////////////////////////////////////////////////////////////////////////////

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailureState extends AuthState {
  final String errorMessege;

  LoginFailureState({required this.errorMessege});
}
// //////////////////////////////////////////////////////////////////////////////////////

final class PasswordResetLoadingState extends AuthState {}

final class PasswordResetSuccessState extends AuthState {}

final class PasswordResetFailureState extends AuthState {
  final String errorMessege;

  PasswordResetFailureState({required this.errorMessege});
}

// //////////////////////////////////////////////////////////////////////////////////////
final class TermsAndConditionState extends AuthState {}

// //////////////////////////////////////////////////////////////////////////////////////
final class SetGenderState extends AuthState {}

// //////////////////////////////////////////////////////////////////////////////////////
final class GetGenderLoadingState extends AuthState {}

final class GetGenderSuccessState extends AuthState {}

final class GetGenderFailureState extends AuthState {
  final String errorMessege;

  GetGenderFailureState({required this.errorMessege});
}

// //////////////////////////////////////////////////////////////////////////////////////
final class ConnectionLoadingState extends AuthState {}

final class ConnectionSuccessState extends AuthState {}

final class ConnectionFailureState extends AuthState {
  final String errorMessege;

  ConnectionFailureState({required this.errorMessege});
}

// //////////////////////////////////////////////////////////////////////////////////////
final class CreateProfileLoadingState extends AuthState {}

final class CreateProfileSuccessState extends AuthState {}

final class CreateProfileFailureState extends AuthState {
  final String errorMessege;

  CreateProfileFailureState({required this.errorMessege});
}

// //////////////////////////////////////////////////////////////////////////////////////
final class FrontSideImagePickerLoadingState extends AuthState {}

final class FrontSideImagePickerSuccessState extends AuthState {}

final class FrontSideImagePickerFailureState extends AuthState {
  final String errorMessege;

  FrontSideImagePickerFailureState({required this.errorMessege});
}
// //////////////////////////////////////////////////////////////////////////////////////
final class BackSideImagePickerLoadingState extends AuthState {}

final class BackSideImagePickerSuccessState extends AuthState {}

final class BackSideImagePickerFailureState extends AuthState {
  final String errorMessege;

  BackSideImagePickerFailureState({required this.errorMessege});
}
// //////////////////////////////////////////////////////////////////////////////////////
final class SignOutLoadingState extends AuthState {}

final class SignOutSuccessState extends AuthState {}

final class SignOutFailureState extends AuthState {
  final String errorMessege;

  SignOutFailureState({required this.errorMessege});
}
// //////////////////////////////////////////////////////////////////////////////////////
