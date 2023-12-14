import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  UserModel userModel = UserModel();
  int femaleIndex=0;
  int maleIndex=0;
  List<UserModel> femaleUserModelList = [];
  List<UserModel> maleUserModelList = [];
  var db = FirebaseFirestore.instance;
  Future<void> getAllFemaleUsers() async {
    try {
      emit(GetAllFemaleUsersLoadingState());
      await db.collection("users").where("gender",isEqualTo: "Female") .get().then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            femaleUserModelList
                .add(UserModel.fromFirestore(docSnapshot, SnapshotOptions()));
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      emit(GetAllFemaleUsersSuccessState());
    } on Exception catch (e) {
      emit(GetAllFemaleUsersFailureState(errorMessege: e.toString()));
    }
  }
  Future<void> getAllMaleUsers() async {
    try {
      emit(GetAllMaleUsersLoadingState());
      await db.collection("users").where("gender",isEqualTo: "Male") .get().then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            maleUserModelList
                .add(UserModel.fromFirestore(docSnapshot, SnapshotOptions()));
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      emit(GetAllMaleUsersSuccessState());
    } on Exception catch (e) {
      emit(GetAllMaleUsersFailureState(errorMessege: e.toString()));
    }
  }


}
