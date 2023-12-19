import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/awesome_snackbar_content.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/login/login_view.dart';

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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ));
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
            child: Column(
              
              children: [
                // UserAccountsDrawerHeader(
                //   currentAccountPicture: Image.asset(Assets.onBoardingTwo),
                //   decoration: const BoxDecoration(color: AppColors.primaryColor),
                //     accountName: Text(
                //         '${BlocProvider.of<ProfileCubit>(context).myUserModel.name}'),
                //     accountEmail:
                //         Text('${FirebaseAuth.instance.currentUser!.email}')),
                state is SignOutLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : CustomTextButton(
                        text: AppStrings.loggedOut,
                        fontSize: 16,
                        onPressed: () async {
                          await authCubit.signOut(context);
                        },
                      ),
              ],
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
