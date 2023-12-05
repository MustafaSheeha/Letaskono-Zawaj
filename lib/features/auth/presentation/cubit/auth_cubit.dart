import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/create_profile_user_model/create_female_profile_model.dart';
import 'package:letaskono_zawaj/core/models/create_profile_user_model/create_male_profile_model.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/features/auth/data/registeration_user_model.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  GlobalKey<FormState> registerFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  bool termsAndConditionCheckBox = false;
  bool isGender = true;
  final RegisterationUserModel registerationUserModel =
      RegisterationUserModel();
  final CreateMaleProfileModel createMaleProfileModel =
      CreateMaleProfileModel();
  final CreateFemaleProfileModel createFemaleProfileModel =
      CreateFemaleProfileModel();

  void updateTermsAndConditionCheckBox(newValue) {
    termsAndConditionCheckBox = newValue;
    emit(TermsAndConditionState());
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      emit(RegisterLoadingState());
      await startCreateUserWithEmailAndPassword();
      await sendEmailVerification();
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      handlingRegisterationFirebaseAuthException(e);
    } catch (e) {
      emit(RegisterFailureState(errorMessege: AppStrings.pleaseTryAgainLater));
      print('*********************************************');
      print(e.toString());
      print('*********************************************');
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

  Future<void> sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(LoginLoadingState());
      await startSignInWithEmailAndPassword();
      !FirebaseAuth.instance.currentUser!.emailVerified
          ? await sendEmailVerification()
          : null;
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      handlingLoginFirebaseAuthException(e);
    } catch (e) {
      emit(LoginFailureState(errorMessege: AppStrings.pleaseTryAgainLater));
      print('*********************************************');
      print(e.toString());
      print('*********************************************');
    }
  }

  Future<void> startSignInWithEmailAndPassword() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: registerationUserModel.email!,
      password: registerationUserModel.password!,
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
    } else {
      emit(LoginFailureState(errorMessege: e.toString()));
      print(e.code.toString());
    }
  }

  Future<void> sendPasswordResetEmail() async {
    try {
      emit(PasswordResetLoadingState());
      await startsendPasswordResetEmail();
      emit(PasswordResetSuccessState());
    } on Exception catch (e) {
      emit(PasswordResetFailureState(errorMessege: e.toString()));
      print('*********************************************');
      print(e.toString());
    }
  }

  Future<void> startsendPasswordResetEmail() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: registerationUserModel.email!,
    );
  }
}
