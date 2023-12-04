 class AuthState {}

final class AuthInitialState extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final String errorMessege;

  RegisterFailureState({required this.errorMessege});
}
final class TermsAndConditionState extends AuthState {}
