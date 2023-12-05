import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/widgets/custom_app_bar.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/female_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/male_form.dart';

class CreateProfileView extends StatelessWidget {
  const CreateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  const CustomAppBar(),
                  SizedBox(height: 0.015 * screenHeight),
                  BlocProvider.of<AuthCubit>(context).isGender
                      ? const MaleForm()
                      : const FemaleForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
