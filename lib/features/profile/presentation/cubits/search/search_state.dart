class SearchState {}

final class SearchInitial extends SearchState {}

final class GetAllUsersLoadingState extends SearchState {}

final class GetAllUsersSuccessState extends SearchState {}

final class GetAllUsersFailureState extends SearchState {
  final String errorMessege;

  GetAllUsersFailureState({required this.errorMessege});
}
