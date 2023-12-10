import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/awesome_snackbar_content.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            showAwesomeSnackbar(
                context: context,
                title: AppStrings.accountLoggedOutSuccessfully,
                message: AppStrings.redirectingToLogin,
                contentType: ContentType.success);
          }
          if (state is SignOutFailureState) {
            showAwesomeSnackbar(
                context: context,
                title: AppStrings.someThingWentWrong,
                message: state.errorMessege,
                contentType: ContentType.failure);
          }
        },
        builder: (context, state) {
          AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

          return Drawer(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                side: BorderSide(color: AppColors.primaryColor)),
            child: state is SignOutLoadingState
                ? const Center(child: CircularProgressIndicator())
                : CustomTextButton(
                    text: 'تسجيل الخروج',
                    fontSize: 16,
                    onPressed: () async {
                      await authCubit.signOut(context);
                    },
                  ),
          );
        },
      ),
    );
  }

  Future<void> customFutureDelayed(BuildContext context, String path) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => naviPushReplacementNamed(context, path),
    );
  }
}