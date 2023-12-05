import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class ReligiousInfoForm extends StatelessWidget {
  const ReligiousInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AuthContainer(
      widget: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const CustomHeaderTitle(headerTitle: AppStrings.religiousInfo),
        const Text(
          AppStrings.prayerCommitment,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
            selectedValue: BlocProvider.of<AuthCubit>(context)
                .createMaleProfileModel
                .prayerCommitment,
            dropdownButtonList: DropdownButtonList.prayerCommitmentList),
        SizedBox(height: 0.01 * screenHeight),
        BlocProvider.of<AuthCubit>(context).isGender
            ? const Text(
                AppStrings.faceStyle,
                style: AppTextStyles.cairoW300PrimaryColor,
              )
            : const Text(
                AppStrings.clothStyle,
                style: AppTextStyles.cairoW300PrimaryColor,
              ),
        SizedBox(height: 0.01 * screenHeight),
        BlocProvider.of<AuthCubit>(context).isGender
            ? DropdownButtonWidget(
                selectedValue: BlocProvider.of<AuthCubit>(context)
                    .createMaleProfileModel
                    .faceStyle,
                dropdownButtonList: DropdownButtonList.faceStyleList)
            : DropdownButtonWidget(
                selectedValue: BlocProvider.of<AuthCubit>(context)
                    .createFemaleProfileModel
                    .clothStyle,
                dropdownButtonList: DropdownButtonList.clothStyleList),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.quranMemorizing,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
            selectedValue: BlocProvider.of<AuthCubit>(context)
                .createMaleProfileModel
                .quranMemorizing,
            dropdownButtonList: DropdownButtonList.quranMemorizingList),
        SizedBox(height: 0.01 * screenHeight),
        !BlocProvider.of<AuthCubit>(context).isGender
            ? const Text(
                AppStrings.acceptToWearNiqab,
                style: AppTextStyles.cairoW300PrimaryColor,
              )
            : const SizedBox(),
        SizedBox(height: 0.01 * screenHeight),
        !BlocProvider.of<AuthCubit>(context).isGender
            ? DropdownButtonWidget(
                selectedValue: BlocProvider.of<AuthCubit>(context)
                    .createFemaleProfileModel
                    .acceptToWearNiqab,
                dropdownButtonList: DropdownButtonList.acceptToWearNiqabList)
            : const SizedBox(),
        SizedBox(height: 0.01 * screenHeight),
      ]),
    );
  }
}
