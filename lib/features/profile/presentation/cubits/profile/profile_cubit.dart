import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  GlobalKey<FormState> editProfileFormKey = GlobalKey();
  UserModel userModel = UserModel();
  List<UserModel> femaleUserModelList = [];
  List<UserModel> maleUserModelList = [];
  List<UserModel> myFavoriteUserModelList = [];
  int femaleIndex = 0;
  int maleIndex = 0;
  int favoriteIndex = 0;
  var db = FirebaseFirestore.instance;

  Future<void> getMyUser() async {
    var usersCollectionRef = db.collection("users");

    final myUserRef = usersCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
        );
    try {
      emit(GetMyUsersLoadingState());
      final docSnap = await myUserRef.get();

      final user = docSnap.data();
      emit(GetMyUsersSuccessState());
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>ProfileCubit getMyUser'); // Convert to City object
      if (user != null) {
        userModel = user;
        print(userModel.favoriteList);
        userModel.favoriteList = user.favoriteList ?? [];
      } else {
        print("No such document.");
        emit(GetMyUsersFailureState(errorMessege: "No such document."));
      }
    } on Exception catch (e) {
      emit(GetMyUsersFailureState(errorMessege: e.toString()));
    }
  }

  Future<void> editMyUser() async {
    var usersRef = db.collection("users");

    final myUserRef =
        usersRef.doc(FirebaseAuth.instance.currentUser!.email).withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
            );
    print('EEEEEEEEEEEEEEEEEEEEEEEE start edit');
    try {
      emit(EditMyUsersLoadingState());
      await myUserRef.set(userModel, SetOptions(merge: true));
      print('EEEEEEEEEEEEEEEEEEEEEEEE do edit');

      emit(EditMyUsersSuccessState());
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>> edit data successfully'); // Convert to City object
    } on Exception catch (e) {
      emit(GetMyUsersFailureState(errorMessege: e.toString()));
    }
  }

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

  Future<void> saveProfileToFavoriteList({required String partnerEmail}) async {
    // userModel.favoriteList = [];
    final usersCollectionRef = db.collection("users");
    final userDocRef =
        usersCollectionRef.doc(FirebaseAuth.instance.currentUser!.email);
    final userConverterRef = userDocRef.withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
    );
    userModel.favoriteList?.add(partnerEmail);
    print(userModel.favoriteList);
    try {
      emit(SaveProfileToFavoriteListLoadingState());
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SaveProfileToFavoriteListLoadingState');
      await userConverterRef.set(userModel, SetOptions(merge: true));
      emit(SaveProfileToFavoriteListSuccessState());
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SaveProfileToFavoriteListSuccessState');
    } on Exception catch (e) {
      emit(SaveProfileToFavoriteListFailureState(errorMessege: e.toString()));
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SaveProfileToFavoriteListFailureState');
      print(e.toString());
    }
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

}
