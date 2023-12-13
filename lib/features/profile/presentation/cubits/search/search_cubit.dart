import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  UserModel userModel = UserModel();
  List<UserModel> userModelList = [];
  var db = FirebaseFirestore.instance;
  Future<void> getAllUsers() async {
    try {
      emit(GetAllUsersLoadingState());
      await db.collection("users").get().then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            userModelList
                .add(UserModel.fromFirestore(docSnapshot, SnapshotOptions()));
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      emit(GetAllUsersSuccessState());
    } on Exception catch (e) {
      emit(GetAllUsersFailureState(errorMessege: e.toString()));
    }
  }


}
