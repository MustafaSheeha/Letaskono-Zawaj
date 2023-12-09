abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class GetAllUsersLoadingInitial extends ProfileState {}
final class GetAllUsersSuccessInitial extends ProfileState {}
final class GetAllUsersFailureInitial extends ProfileState {
  final String errorMessege;

  GetAllUsersFailureInitial({required this.errorMessege});
}
final class GetMyUsersLoadingInitial extends ProfileState {}
final class GetMyUsersSuccessInitial extends ProfileState {}
final class GetMyUsersFailureInitial extends ProfileState {
  final String errorMessege;

  GetMyUsersFailureInitial({required this.errorMessege});
}
