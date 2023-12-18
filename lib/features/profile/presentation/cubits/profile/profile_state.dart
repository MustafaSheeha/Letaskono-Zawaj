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


final class SearchInitial extends ProfileState {}

final class GetAllFemaleUsersLoadingState extends ProfileState {}

final class GetAllFemaleUsersSuccessState extends ProfileState {}

final class GetAllFemaleUsersFailureState extends ProfileState {
  final String errorMessege;

  GetAllFemaleUsersFailureState({required this.errorMessege});
}

final class GetAllMaleUsersLoadingState extends ProfileState {}

final class GetAllMaleUsersSuccessState extends ProfileState {}

final class GetAllMaleUsersFailureState extends ProfileState {
  final String errorMessege;

  GetAllMaleUsersFailureState({required this.errorMessege});
}

final class GetMyFavoriteUsersLoadingState extends ProfileState {}

final class GetMyFavoriteUsersSuccessState extends ProfileState {}

final class GetMyFavoriteUsersFailureState extends ProfileState {
  final String errorMessege;

  GetMyFavoriteUsersFailureState({required this.errorMessege});
}

final class SaveProfileToFavoriteListLoadingState extends ProfileState {}

final class SaveProfileToFavoriteListSuccessState extends ProfileState {}

final class SaveProfileToFavoriteListFailureState extends ProfileState {
  final String errorMessege;

  SaveProfileToFavoriteListFailureState({required this.errorMessege});
}


