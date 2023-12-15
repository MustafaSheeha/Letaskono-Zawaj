class SearchState {}

final class SearchInitial extends SearchState {}

final class GetAllFemaleUsersLoadingState extends SearchState {}

final class GetAllFemaleUsersSuccessState extends SearchState {}

final class GetAllFemaleUsersFailureState extends SearchState {
  final String errorMessege;

  GetAllFemaleUsersFailureState({required this.errorMessege});
}

final class GetAllMaleUsersLoadingState extends SearchState {}

final class GetAllMaleUsersSuccessState extends SearchState {}

final class GetAllMaleUsersFailureState extends SearchState {
  final String errorMessege;

  GetAllMaleUsersFailureState({required this.errorMessege});
}

final class GetMyFavoriteUsersLoadingState extends SearchState {}

final class GetMyFavoriteUsersSuccessState extends SearchState {}

final class GetMyFavoriteUsersFailureState extends SearchState {
  final String errorMessege;

  GetMyFavoriteUsersFailureState({required this.errorMessege});
}
