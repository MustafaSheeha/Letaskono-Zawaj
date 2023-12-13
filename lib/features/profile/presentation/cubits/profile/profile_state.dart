abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class EditMyUsersLoadingInitial extends ProfileState {}

final class EditMyUsersSuccessInitial extends ProfileState {}

final class EditMyUsersFailureInitial extends ProfileState {
  final String errorMessege;

  EditMyUsersFailureInitial({required this.errorMessege});
}

final class GetMyUsersLoadingInitial extends ProfileState {}

final class GetMyUsersSuccessInitial extends ProfileState {}

final class GetMyUsersFailureInitial extends ProfileState {
  final String errorMessege;

  GetMyUsersFailureInitial({required this.errorMessege});
}


