import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letaskono_zawaj/core/models/create_profile_user_model/create_female_profile_model.dart';
import 'package:letaskono_zawaj/core/models/create_profile_user_model/create_male_profile_model.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/features/auth/data/registeration_user_model.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
// ############################################################################### DataConnectionChecker
  DataConnectionChecker dataConnectionChecker = DataConnectionChecker();
// ############################################################################### Picked Images
  File? frontSideImage;
  String? frontSideImageName;
  String? frontSideImageUrl;
  File? backSideImage;
  String? backSideImageName;
  String? backSideImageUrl;
  bool termsAndConditionCheckBox = false;
  bool isGender = true;

// ############################################################################### GlobalKeys
  GlobalKey<FormState> registerFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  GlobalKey<FormState> createMaleProfileFormKey = GlobalKey();
  GlobalKey<FormState> createFemaleProfileFormKey = GlobalKey();
// ############################################################################### Models
  final RegisterationUserModel registerationUserModel =
      RegisterationUserModel();
  final UserModel userModel = UserModel();
  final CreateMaleProfileModel createMaleProfileModel =
      CreateMaleProfileModel();
  final CreateFemaleProfileModel createFemaleProfileModel =
      CreateFemaleProfileModel();
// ############################################################################### maleOrFemalForm
  void maleOrFemalForm() {}
// ############################################################################### updateTermsAndConditionCheckBox
  void updateTermsAndConditionCheckBox(newValue) {
    termsAndConditionCheckBox = newValue;
    emit(TermsAndConditionState());
  }

// ############################################################################### setGender
  void setGender(newValue) {
    isGender = newValue;
    emit(SetGenderState());
  }

// ############################################################################### createUserWithEmailAndPassword
  Future<void> createUserWithEmailAndPassword() async {
    emit(ConnectionLoadingState());
    if (await dataConnectionChecker.hasConnection) {
      try {
        emit(RegisterLoadingState());
        await startCreateUserWithEmailAndPassword();
        await sendEmailVerification();
        await saveregisterationUserModel();
        emit(RegisterSuccessState());
      } on FirebaseAuthException catch (e) {
        handlingRegisterationFirebaseAuthException(e);
      } catch (e) {
        emit(RegisterFailureState(errorMessege: e.toString()));
        print('*********************************************');
        print(e.toString());
        print('*********************************************');
      }
      emit(ConnectionSuccessState());
    } else {
      emit(ConnectionFailureState(
          errorMessege: AppStrings.noInternetConnection));
    }
  }

  Future<void> startCreateUserWithEmailAndPassword() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerationUserModel.email!,
      password: registerationUserModel.password!,
    );
  }

  void handlingRegisterationFirebaseAuthException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(RegisterFailureState(errorMessege: AppStrings.weakPassword));
      print(AppStrings.weakPassword);
    } else if (e.code == 'email-already-in-use') {
      emit(RegisterFailureState(errorMessege: AppStrings.emailAlreadyInUse));
      print(AppStrings.emailAlreadyInUse);
    }
  }

// ############################################################################### sendEmailVerification
  Future<void> sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

// ############################################################################### signInWithEmailAndPassword

  Future<void> signInWithEmailAndPassword() async {
    emit(ConnectionLoadingState());
    if (await dataConnectionChecker.hasConnection) {
      try {
        emit(LoginLoadingState());
        await startSignInWithEmailAndPassword();
        // await getUserModelGender(userModel.email);
        !FirebaseAuth.instance.currentUser!.emailVerified
            ? await sendEmailVerification()
            : null;
        emit(LoginSuccessState());
      } on FirebaseAuthException catch (e) {
        handlingLoginFirebaseAuthException(e);
      } catch (e) {
        emit(LoginFailureState(errorMessege: e.toString()));
        print('*********************************************');
        print(e.toString());
        print('*********************************************');
      }
    } else {
      emit(ConnectionFailureState(
          errorMessege: AppStrings.noInternetConnection));
    }
  }

  Future<void> startSignInWithEmailAndPassword() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    );
  }

  void handlingLoginFirebaseAuthException(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      emit(LoginFailureState(errorMessege: AppStrings.userNotFound));
      print(AppStrings.userNotFound);
    } else if (e.code == 'wrong-password') {
      emit(LoginFailureState(errorMessege: AppStrings.wrongPassword));
      print(AppStrings.wrongPassword);
    } else if (e.code == 'invalid-email') {
      emit(LoginFailureState(errorMessege: AppStrings.invalidEmail));
      print(AppStrings.invalidEmail);
    } else if (e.code == 'invalid-credential') {
      emit(LoginFailureState(errorMessege: AppStrings.invalidCredential));
      print(AppStrings.invalidCredential);
    } else if (e.code == 'too-many-requests') {
      emit(LoginFailureState(errorMessege: AppStrings.tooManyRequests));
      print(AppStrings.invalidCredential);
    } else {
      emit(LoginFailureState(errorMessege: e.toString()));
      print(e.code.toString());
    }
  }

// ############################################################################### sendPasswordResetEmail
  Future<void> sendPasswordResetEmail() async {
    if (await dataConnectionChecker.hasConnection) {
      try {
        emit(PasswordResetLoadingState());
        await startsendPasswordResetEmail();
        emit(PasswordResetSuccessState());
      } on Exception catch (e) {
        emit(PasswordResetFailureState(errorMessege: e.toString()));
        print('*********************************************');
        print(e.toString());
      }
    } else {
      emit(PasswordResetFailureState(
          errorMessege: 'لا يوجد لديك اتصال بالانترنت'));
    }
  }

  Future<void> startsendPasswordResetEmail() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: registerationUserModel.email!,
    );
  }

// ############################################################################### saveregisterationUserModel
  Future<void> saveregisterationUserModel() async {
    var db = FirebaseFirestore.instance;
    final collectionRef = db.collection("users");
    final docRef = collectionRef
        .withConverter(
          fromFirestore: RegisterationUserModel.fromFirestore,
          toFirestore:
              (RegisterationUserModel registerationUserModel, options) =>
                  registerationUserModel.toFirestore(),
        )
        .doc("${registerationUserModel.email}");
    await docRef.set(registerationUserModel);
  }

// ############################################################################### saveUserModel
  Future<void> saveUserModel() async {
    var db = FirebaseFirestore.instance;
    final femaleDocRef = db
        .collection("users")
        .withConverter(
          fromFirestore: CreateFemaleProfileModel.fromFirestore,
          toFirestore:
              (CreateFemaleProfileModel createFemaleProfileModel, options) =>
                  createFemaleProfileModel.toFirestore(),
        )
        .doc(FirebaseAuth.instance.currentUser?.email);
    final maleDocRef = db
        .collection("users")
        .withConverter(
          fromFirestore: CreateMaleProfileModel.fromFirestore,
          toFirestore:
              (CreateMaleProfileModel createMaleProfileModel, options) =>
                  createMaleProfileModel.toFirestore(),
        )
        .doc(FirebaseAuth.instance.currentUser?.email);
    emit(ConnectionLoadingState());

    if (await dataConnectionChecker.hasConnection) {
      try {
        emit(CreateProfileLoadingState());

        await getUserModelGender(FirebaseAuth.instance.currentUser?.email);
        if (userModel.gender == "Male") {
          await maleDocRef.set(
              createMaleProfileModel,
              SetOptions(
                merge: true,
              ));
        } else {
          await femaleDocRef.set(
              createFemaleProfileModel,
              SetOptions(
                merge: true,
              ));
        }
        emit(CreateProfileSuccessState());
      } on Exception catch (e) {
        emit(CreateProfileFailureState(errorMessege: e.toString()));
      }
    } else {
      emit(ConnectionFailureState(
          errorMessege: AppStrings.noInternetConnection));
    }
  }

// ############################################################################### getUserModelGender
  Future<String?> getUserModelGender(String? email) async {
    var db = FirebaseFirestore.instance;
    String? gender;
    final emailDocRef = db.collection("users").doc(email);
    try {
      emit(GetGenderLoadingState());
      await emailDocRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          gender = data["gender"];
          if (gender == "Male") {
            userModel.gender = "Male";
          } else {
            userModel.gender = "Female";
          }
        },
        onError: (e) => print("Error getting document: $e"),
      );
      emit(GetGenderSuccessState());
    } on Exception catch (e) {
      emit(GetGenderFailureState(errorMessege: e.toString()));
    }
    return userModel.gender;
  }

// ############################################################################### frontSideImagePickFromGallery

  Future<void> frontSideImagePickFromGallery() async {
    try {
      emit(FrontSideImagePickerLoadingState());
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        frontSideImage = File(pickedImage.path);
        frontSideImageName = pickedImage.name;
        emit(FrontSideImagePickerSuccessState());
      } else {
        emit(FrontSideImagePickerFailureState(
            errorMessege:
                '############### returnedImage is Null ###############'));
      }
    } on Exception catch (e) {
      emit(FrontSideImagePickerFailureState(errorMessege: e.toString()));
    }
  }

// ############################################################################### backSideImagePickFromGallery

  Future<void> backSideImagePickFromGallery() async {
    try {
      emit(BackSideImagePickerLoadingState());
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        backSideImage = File(pickedImage.path);
        backSideImageName = pickedImage.name;
        emit(BackSideImagePickerSuccessState());
      } else {
        emit(FrontSideImagePickerFailureState(
            errorMessege:
                '############### returnedImage is Null ###############'));
      }
    } on Exception catch (e) {
      emit(BackSideImagePickerFailureState(errorMessege: e.toString()));
    }
  }

// ############################################################################### UploadImage
  Future<void> uploadFrontSideImage() async {
    try {
      // emit(UploadLoadingState());
      final ref = FirebaseStorage.instance.ref().child(
          '${FirebaseAuth.instance.currentUser!.email}/$frontSideImageName');
      final uploadTask = ref.putFile(frontSideImage!);
      final snapshot = await uploadTask.whenComplete(
        () {},
      );
      final url = await snapshot.ref.getDownloadURL();
      createMaleProfileModel.idFrontSideUrl = url;
      print(createMaleProfileModel.idFrontSideUrl);
      // emit(UploadtSuccessState());
    } on Exception catch (e) {
      // emit(UploadFailureState(errorMessege: e.toString()));
    }
  }

  Future<void> uploadBackSideImage() async {
    try {
      // emit(UploadLoadingState());
      final ref = FirebaseStorage.instance.ref().child(
          '${FirebaseAuth.instance.currentUser!.email}/$backSideImageName');
      final uploadTask = ref.putFile(backSideImage!);
      final snapshot = await uploadTask.whenComplete(
        () {},
      );
      final url = await snapshot.ref.getDownloadURL();
      createMaleProfileModel.idBackSideUrl = url;
      print(
          '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333');
      print(createMaleProfileModel.idBackSideUrl);
      print(
          '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333');
      // emit(UploadtSuccessState());
    } on Exception catch (e) {
      // emit(UploadFailureState(errorMessege: e.toString()));
    }
  }
// ############################################################################### signOut

  Future<void> signOut() async {
    try {
      emit(SignOutLoadingState());
      await FirebaseAuth.instance.signOut();
      emit(SignOutLoadingState());
    } on Exception catch (e) {
      emit(SignOutFailureState(errorMessege: e.toString()));
    }
  }
}
