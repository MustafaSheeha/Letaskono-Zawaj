import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class EditMarriageInfoForm extends StatefulWidget {
  const EditMarriageInfoForm({super.key});

  @override
  State<EditMarriageInfoForm> createState() => _EditMarriageInfoFormState();
}

class _EditMarriageInfoFormState extends State<EditMarriageInfoForm> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetMyUsersSuccessInitial) {}
        if (state is GetMyUsersFailureInitial) {}
      },
      builder: (context, state) {
        return CardContainer(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 0.02 * screenHeight),
              const CustomHeaderTitle(headerTitle: AppStrings.marriageInfo),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.tellAboutYou,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.tellAboutYou,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.tellAboutYou = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.tellAboutPartner,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.tellAboutPartner,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.tellAboutPartner = p0;
                },
              ),
              SizedBox(height: 0.02 * screenHeight),
            ],
          ),
        );
      },
    );
  }
}
