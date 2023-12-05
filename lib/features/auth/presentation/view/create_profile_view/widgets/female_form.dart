import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/female_parent_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/general_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/identity_confirmation_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/marriage_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/personal_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/religious_info_form.dart';

class FemaleForm extends StatelessWidget {
  const FemaleForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              const GeneralInfoForm(),
              const PersonalInfoForm(),
              const ReligiousInfoForm(),
              const MarriageInfoForm(),
              const FemaleParentInfoForm(),
              CustomElevatedButton(onPressed: () {}, text: AppStrings.saveData),
              SizedBox(height: 0.03 * screenHeight),
            ],
          ),
        );
      },
    );
  }
}
