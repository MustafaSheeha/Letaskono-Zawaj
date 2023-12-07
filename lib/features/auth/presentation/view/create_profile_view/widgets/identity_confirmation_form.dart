import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/id_image_picker.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class IdentityConfirmationForm extends StatefulWidget {
  const IdentityConfirmationForm({super.key});

  @override
  State<IdentityConfirmationForm> createState() =>
      _IdentityConfirmationFormState();
}

class _IdentityConfirmationFormState extends State<IdentityConfirmationForm> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return AuthContainer(
          widget: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const CustomHeaderTitle(
                headerTitle: AppStrings.identityConfirmation),
            const Text(AppStrings.idFrontSide,
                style: AppTextStyles.cairoW300PrimaryColor),
            SizedBox(height: 0.01 * screenHeight),
            IdImagePicker(
                onTap: () async {
                  await authCubit.frontSideImagePickFromGallery();
                  print(
                      '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333');

                  print('############ Start Uploading');

                  await authCubit.uploadFrontSideImage();
                  print('############ finish Uploading');
                  print(
                      '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333');
                },
                isFront: true),
            SizedBox(height: 0.01 * screenHeight),
            const Text(AppStrings.idBackSide,
                style: AppTextStyles.cairoW300PrimaryColor),
            SizedBox(height: 0.01 * screenHeight),
            IdImagePicker(
                onTap: () async {
                  await authCubit.backSideImagePickFromGallery();
                  print(
                      '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333');

                  print('############ Start Uploading');

                  await authCubit.uploadBackSideImage();
                  print('############ finish Uploading');
                  print(
                      '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333');
                },
                isFront: false),
            SizedBox(height: 0.01 * screenHeight),
            const Text(AppStrings.idNumber,
                style: AppTextStyles.cairoW300PrimaryColor),
            SizedBox(height: 0.01 * screenHeight),
            CustomTextFormField(
              obscureText: false,
              onChanged: (p0) {
                authCubit.createMaleProfileModel.idNumber = p0;
              },
            ),
            SizedBox(height: 0.01 * screenHeight),
          ]),
        );
      },
    );
  }
}
