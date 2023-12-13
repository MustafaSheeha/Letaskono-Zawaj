abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class EditMyUsersLoadingState extends ProfileState {}

final class EditMyUsersSuccessState extends ProfileState {}

final class EditMyUsersFailureState extends ProfileState {
  final String errorMessege;

  EditMyUsersFailureState({required this.errorMessege});
}

final class GetMyUsersLoadingState extends ProfileState {}

final class GetMyUsersSuccessState extends ProfileState {}

final class GetMyUsersFailureState extends ProfileState {
  final String errorMessege;

  GetMyUsersFailureState({required this.errorMessege});
}


