import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/widgets/custom_app_bar.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/female_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/male_form.dart';

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthCubit()..getUserModelGender(FirebaseAuth.instance.currentUser?.email),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  const CustomAppBar(),
                  SizedBox(height: 0.015 * screenHeight),
                  // authCubit.isGender
                  authCubit.userModel.gender=="Male" ? const MaleForm() : const FemaleForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
