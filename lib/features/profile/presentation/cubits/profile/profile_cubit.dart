import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/create_profile_user_model/create_female_profile_model.dart';
import 'package:letaskono_zawaj/core/models/create_profile_user_model/create_male_profile_model.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  GlobalKey<FormState> editMaleProfileFormKey = GlobalKey();
  List usersList = [];
  UserModel userModel = UserModel();
  CreateMaleProfileModel createMaleProfileModel = CreateMaleProfileModel();
  CreateFemaleProfileModel createFemaleProfileModel =
      CreateFemaleProfileModel();
  var db = FirebaseFirestore.instance;
  // Future<void> getAllUsers() async {
  //   var usersRef = db.collection("users");
  //   try {
  //     emit(GetAllUsersLoadingInitial());
  //     await usersRef.get().then(
  //       (querySnapshot) {
  //         print("Successfully completed");
  //         for (var docSnapshot in querySnapshot.docs) {
  //           usersList.add(docSnapshot);
  //           print(
  //               '#################################### Start #########################################');
  //           print('${docSnapshot.id} => ${docSnapshot.data()}');
  //           print(
  //               '#################################### Finish #########################################');
  //         }
  //       },
  //       onError: (e) => print("Error completing: $e"),
  //     );
  //     emit(GetAllUsersSuccessInitial());
  //   } on Exception catch (e) {
  //     emit(GetAllUsersFailureInitial(errorMessege: e.toString()));
  //   }
  // }

  Future<void> getMyUser() async {
    var usersRef = db.collection("users");

    final myUserRef =
        usersRef.doc(FirebaseAuth.instance.currentUser!.email).withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
            );
    try {
      emit(GetMyUsersLoadingInitial());
      final docSnap = await myUserRef.get();

      final user = docSnap.data();
      emit(GetMyUsersSuccessInitial());
      print('>>>>>>>>>>>>>>>>>>>>>>>>>> got data'); // Convert to City object
      if (user != null) {
        userModel = user;

        // createMaleProfileModel.faceStyle=user.faceStyle;
        // createFemaleProfileModel.clothStyle=user.clothStyle;
      } else {
        print("No such document.");
        emit(GetMyUsersFailureInitial(errorMessege: "No such document."));
      }
    } on Exception catch (e) {
      emit(GetMyUsersFailureInitial(errorMessege: e.toString()));
    }
  }

  Future<void> editMyUser() async {
    var usersRef = db.collection("users");

    final myUserRef =
        usersRef.doc(FirebaseAuth.instance.currentUser!.email).withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
            );
    try {
      emit(EditMyUsersLoadingInitial());
      await myUserRef.set(userModel, SetOptions(merge: true));

      emit(EditMyUsersSuccessInitial());
      print('>>>>>>>>>>>>>>>>>>>>>>>>>> edit data successfully'); // Convert to City object
    } on Exception catch (e) {
      emit(GetMyUsersFailureInitial(errorMessege: e.toString()));
    }
  }
  // UserModel? userModelFromFirestore() {
  //   createMaleProfileModel =
  //       CreateMaleProfileModel.fromFirestore(usersList[1], SnapshotOptions());
  //   return createMaleProfileModel;
  // }
}
