import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  UserModel userModel = UserModel();
  int femaleIndex = 0;
  int maleIndex = 0;
  int favoriteIndex = 0;
  List<UserModel> femaleUserModelList = [];
  List<UserModel> maleUserModelList = [];
  List<UserModel> myFavoriteUserModelList = [];
  Map<String, dynamic> myfavoriteMap = {};
  var db = FirebaseFirestore.instance;
  Future<void> getAllFemaleUsers() async {
    try {
      emit(GetAllFemaleUsersLoadingState());
      await db
          .collection("users")
          .where("gender", isEqualTo: "Female")
          .get()
          .then(
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
      await db
          .collection("users")
          .where("gender", isEqualTo: "Male")
          .get()
          .then(
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

// ////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> saveFemaleProfileToFavorite(
      {required String partnerEmail}) async {
    await getMyFavoriteList();
    myfavoriteMap["$favoriteIndex"] = partnerEmail;
    var favoriteCollectionRef = db.collection("favorite");
    await favoriteCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set(myfavoriteMap, SetOptions(merge: true));
  }

  Future<void> deleteFemaleProfileToFavorite(int index) async {
    var favoriteCollectionRef = db.collection("favorite");
    final updates = <String, dynamic>{
      "$index": FieldValue.delete(),
    };
    await favoriteCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update(updates);
  }

  Future<void> saveMaleProfileToFavorite({required String partnerEmail}) async {
    await getMyFavoriteList();
    myfavoriteMap["$favoriteIndex"] = partnerEmail;
    var favoriteCollectionRef = db.collection("favorite");
    await favoriteCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set(myfavoriteMap, SetOptions(merge: true));
  }

// ////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> getMyFavoriteList() async {
    var favoriteCollectionRef = db.collection("favorite");
    var myfavoriteDocList =
        favoriteCollectionRef.doc(FirebaseAuth.instance.currentUser!.email);
    await myfavoriteDocList.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        myfavoriteMap = data;
        if (myfavoriteMap.isEmpty) {
        } else {
          favoriteIndex = int.parse(myfavoriteMap.keys.last);
          favoriteIndex++;
        }
        print('favoriteIndex ::::::::::::::::::: $favoriteIndex');
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  Future<void> getAllFavoriteUsers() async {
    await getMyFavoriteList();
    // favoriteIndex = int.parse(myfavoriteMap.keys.last);
    // print('favoriteIndex ::::::::::::::::::: $favoriteIndex');
    try {
      emit(GetMyFavoriteUsersLoadingState());
      var usersRef = db.collection("users");

      for (var v = 0; v <= myfavoriteMap.length; v++) {
        print(
            '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> myfavoriteMap[v] ${myfavoriteMap['$v']}');
        final myFavoriteUserRef = usersRef
            .doc(myfavoriteMap["$v"])
            .withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
            );
        final docSnap = await myFavoriteUserRef.get();
        print('docSnapdocSnapdocSnapdocSnapdocSnapdocSnapdocSnap');
        print(docSnap);
        final userModel = docSnap.data();
        if (userModel != null) {
          myFavoriteUserModelList.add(userModel);
          print(
              'favorite userfavorite userfavorite userfavorite userfavorite userfavorite userfavorite user');
          print(userModel);
        } else {
          print('no favorite user returned');
        }
      }
      emit(GetMyFavoriteUsersSuccessState());
    } on Exception catch (e) {
      emit(GetMyFavoriteUsersFailureState(errorMessege: e.toString()));
      print(
          'GetMyFavoriteUsersFailureState GetMyFavoriteUsersFailureState GetMyFavoriteUsersFailureState GetMyFavoriteUsersFailureState ');
      print(e.toString());
    }
  }
}
