import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/features/auth/data/registeration_user_model.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  GlobalKey<FormState> registerFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  bool termsAndConditionCheckBox = false;
  final RegisterationUserModel registerationUserModel =
      RegisterationUserModel();

  void updateTermsAndConditionCheckBox(newValue) {
    termsAndConditionCheckBox = newValue;
    emit(TermsAndConditionState());
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      emit(RegisterLoadingState());
      await startCreateUserWithEmailAndPassword();
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

  void handlingRegisterationFirebaseAuthException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(RegisterFailureState(errorMessege: AppStrings.weakPassword));
      print(AppStrings.weakPassword);
    } else if (e.code == 'email-already-in-use') {
      emit(RegisterFailureState(errorMessege: AppStrings.emailAlreadyInUse));
      print(AppStrings.emailAlreadyInUse);
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(LoginLoadingState());
      await startSignInWithEmailAndPassword();
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

  Future<void> startCreateUserWithEmailAndPassword() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerationUserModel.email!,
      password: registerationUserModel.password!,
    );
  }
}
