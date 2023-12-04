import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/features/auth/data/registeration_user_model.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  GlobalKey<FormState> registerFormKey = GlobalKey();
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
      handlingFirebaseAuthException(e);
    } catch (e) {
      emit(RegisterFailureState(errorMessege: e.toString()));
      print('*********************************************');
      print(e);
      print('*********************************************');
    }
  }

  void handlingFirebaseAuthException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(RegisterFailureState(errorMessege: AppStrings.weakPassword));
      print(AppStrings.weakPassword);
    } else if (e.code == 'email-already-in-use') {
      emit(RegisterFailureState(errorMessege: AppStrings.emailAlreadyInUse));
      print(AppStrings.emailAlreadyInUse);
    }
  }

  Future<void> startCreateUserWithEmailAndPassword() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerationUserModel.email!,
      password: registerationUserModel.password!,
    );
  }
}
