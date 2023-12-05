import 'package:flutter/widgets.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/general_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/identity_confirmation_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/marriage_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/personal_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/religious_info_form.dart';

class MaleForm extends StatelessWidget {
  const MaleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GeneralInfoForm(),
        PersonalInfoForm(),
        ReligiousInfoForm(),
        MarriageInfoForm(),
        IdentityConfirmationForm(),
      ],
    );
  }
}
