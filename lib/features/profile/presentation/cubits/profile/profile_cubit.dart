import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  GlobalKey<FormState> editProfileFormKey = GlobalKey();
  UserModel myUserModel = UserModel();
  UserModel otherUserModel = UserModel();
  List<UserModel> femaleUserModelList = [];
  List<UserModel> maleUserModelList = [];
  List<UserModel> myFavoriteUserModelList = [];
  List<UserModel> myReceivedUserModelList = [];
  List<UserModel> mySendUserModelList = [];
  int femaleIndex = 0;
  int maleIndex = 0;
  int sendIndex = 0;
  int receivedIndex = 0;
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
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>> ProfileCubit getMyUser'); // Convert to City object
      if (user != null) {
        myUserModel = user;
        myUserModel.favoriteList = user.favoriteList ?? [];
        print(
            '>>>>>>>>>>>>>>>>>>>>>> userModel.favoriteList: ${myUserModel.favoriteList}');
        emit(GetMyUsersSuccessState());
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
      await myUserRef.set(myUserModel, SetOptions(merge: true));
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
            print(
                'Female user added ${docSnapshot.id} => ${docSnapshot.data()}');
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
            print(
                'Male user added :${docSnapshot.id} => ${docSnapshot.data()}');
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
    await getMyUser();
    myUserModel.favoriteList?.add(partnerEmail);
    print(myUserModel.favoriteList);
    final usersCollectionRef = db.collection("users");
    final userDocRef =
        usersCollectionRef.doc(FirebaseAuth.instance.currentUser!.email);
    final userConverterRef = userDocRef.withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
    );

    try {
      emit(SaveProfileToFavoriteListLoadingState());
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SaveProfileToFavoriteListLoadingState');
      await userConverterRef.set(myUserModel, SetOptions(merge: true));
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
    var favoriteCollectionRef = db.collection("users");
    final updates = <String, dynamic>{
      "favoriteList":
          FieldValue.arrayRemove([myUserModel.favoriteList?[index]]),
    };
    await favoriteCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update(updates);
  }

  Future<void> getMyFavoriteUserModelList() async {
    await getMyUser();
    var usersCollectionRef = db.collection("users");
    print(
        '>>>>>>>>>>>>>>>>>>>>>>>> userModel.favoriteList.length : ${myUserModel.favoriteList?.length} ');
    for (var index = 0; index < myUserModel.favoriteList!.length; index++) {
      final userDocRef =
          usersCollectionRef.doc('${myUserModel.favoriteList?[index]}');
      final userConverterRef = userDocRef.withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
      );
      try {
        emit(GetMyFavoriteUsersLoadingState());
        print(
            '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyFavoriteUsersLoadingState');
        final docSnap = await userConverterRef.get();
        final user = docSnap.data();
        if (user != null) {
          myFavoriteUserModelList.add(user);
          emit(GetMyFavoriteUsersSuccessState());
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyFavoriteUsersSuccessState');
        } else {
          emit(GetMyFavoriteUsersFailureState(
              errorMessege: AppStrings.someThingWentWrong));
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyFavoriteUsersFailureState ${AppStrings.someThingWentWrong}');
        }
      } on Exception catch (e) {
        emit(GetMyFavoriteUsersFailureState(errorMessege: e.toString()));
        print(
            '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyFavoriteUsersFailureState ${e.toString()} ');
      }
    }
  }

  Future<void> saveSendRequest({required String partnerEmail}) async {
    await getMyUser();
    // myUserModel.sendRequestList = [];
    myUserModel.sendRequestList?.add(partnerEmail);
    var usersCollectionRef = db.collection("users");
    final myUserDocRef = usersCollectionRef
        .doc(FirebaseAuth.instance.currentUser!.email)
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
        );
    try {
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> saveSendRequest Start');
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  userModel.sendRequestList : ${myUserModel.sendRequestList}');
      await myUserDocRef.set(myUserModel, SetOptions(merge: true));
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> saveSendRequest Success');
    } on Exception catch (e) {
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> saveSendRequest Failed : ${e.toString()}');
    }
  }

  Future<void> saveReceivedRequest({required String partnerEmail}) async {
    // await getMyUser();
    otherUserModel.receivedRequestList = [];
    otherUserModel.receivedRequestList
        ?.add(FirebaseAuth.instance.currentUser!.email);
    var favoriteCollectionRef = db.collection("users");
    final otherUserDocRef =
        favoriteCollectionRef.doc(partnerEmail).withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (UserModel otherUserModel, _) =>
                  otherUserModel.toFirestore(),
            );
    try {
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> saveReceivedRequest Start');
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  otherUserModel.receivedRequestList : ${otherUserModel.receivedRequestList}');
      await otherUserDocRef.set(otherUserModel, SetOptions(merge: true));
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> saveReceivedRequest Success');
    } on Exception catch (e) {
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> saveReceivedRequest Failed : ${e.toString()}');
    }
  }

  Future<void> getMySendUserModelList() async {
    await getMyUser();
myUserModel.sendRequestList?? [];
    var usersCollectionRef = db.collection("users");
    print(
        '>>>>>>>>>>>>>>>>>>>>>>>> userModel.sendRequestList.length : ${myUserModel.sendRequestList?.length} ');
    if (myUserModel.sendRequestList!.isEmpty) {
    } else {
      for (var index = 0;
          index < myUserModel.sendRequestList!.length;
          index++) {
        final userDocRef =
            usersCollectionRef.doc('${myUserModel.sendRequestList?[index]}');
        final userConverterRef = userDocRef.withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
        );
        try {
          emit(GetMySendUsersLoadingState());
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMySendUsersSuccessState');
          final docSnap = await userConverterRef.get();
          final user = docSnap.data();
          if (user != null) {
            mySendUserModelList.add(user);
            emit(GetMySendUsersSuccessState());
            print(
                '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMySendUsersSuccessState');
          } else {
            emit(GetMySendUsersFailureState(
                errorMessege: AppStrings.someThingWentWrong));
            print(
                '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMySendUsersFailureState ${AppStrings.someThingWentWrong}');
          }
        } on Exception catch (e) {
          emit(GetMySendUsersFailureState(errorMessege: e.toString()));
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMySendUsersFailureState ${e.toString()} ');
        }
      }
    }
  }

  Future<void> getMyReceivedUserModelList() async {
    await getMyUser();
    var usersCollectionRef = db.collection("users");
    print(
        '>>>>>>>>>>>>>>>>>>>>>>>> userModel.receivedRequestList.length : ${myUserModel.receivedRequestList?.length} ');
    for (var index = 0;
        index < myUserModel.receivedRequestList!.length;
        index++) {
      final userDocRef =
          usersCollectionRef.doc('${myUserModel.receivedRequestList?[index]}');
      final userConverterRef = userDocRef.withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (UserModel userModel, _) => userModel.toFirestore(),
      );
      try {
        emit(GetMyReceivedUsersLoadingState());
        print(
            '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyReceivedUsersLoadingState');
        final docSnap = await userConverterRef.get();
        final user = docSnap.data();
        if (user != null) {
          myReceivedUserModelList.add(user);
          emit(GetMyReceivedUsersSuccessState());
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyReceivedUsersSuccessState');
        } else {
          emit(GetMyReceivedUsersFailureState(
              errorMessege: AppStrings.someThingWentWrong));
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyReceivedUsersFailureState ${AppStrings.someThingWentWrong}');
        }
      } on Exception catch (e) {
        emit(GetMyReceivedUsersFailureState(errorMessege: e.toString()));
        print(
            '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GetMyReceivedUsersFailureState ${e.toString()} ');
      }
    }
  }
}
