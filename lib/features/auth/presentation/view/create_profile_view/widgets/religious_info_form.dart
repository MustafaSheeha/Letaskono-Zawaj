import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class ReligiousInfoForm extends StatefulWidget {
  const ReligiousInfoForm({super.key});

  @override
  State<ReligiousInfoForm> createState() => _ReligiousInfoFormState();
}

class _ReligiousInfoFormState extends State<ReligiousInfoForm> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return AuthContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 0.02 * screenHeight),
          const CustomHeaderTitle(headerTitle: AppStrings.religiousInfo),
          SizedBox(height: 0.01 * screenHeight),
          const Text(
            AppStrings.prayerCommitment,
            style: AppTextStyles.cairoW300PrimaryColor,
          ),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ?DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createMaleProfileModel.prayerCommitment = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createMaleProfileModel.prayerCommitment,
                  dropdownButtonList: DropdownButtonList.prayerCommitmentList,
                )
              : DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createFemaleProfileModel.prayerCommitment = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createFemaleProfileModel.prayerCommitment,
                  dropdownButtonList: DropdownButtonList.prayerCommitmentList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ? const Text(
                  AppStrings.faceStyle,
                  style: AppTextStyles.cairoW300PrimaryColor,
                )
              : const Text(
                  AppStrings.clothStyle,
                  style: AppTextStyles.cairoW300PrimaryColor,
                ),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ?DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createMaleProfileModel.faceStyle = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createMaleProfileModel.faceStyle,
                  dropdownButtonList: DropdownButtonList.faceStyleList,
                )
              : DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createFemaleProfileModel.clothStyle = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createFemaleProfileModel.clothStyle,
                  dropdownButtonList: DropdownButtonList.clothStyleList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(
            AppStrings.quranMemorizing,
            style: AppTextStyles.cairoW300PrimaryColor,
          ),
          SizedBox(height: 0.01 * screenHeight),
         authCubit.isGender
              ?DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createMaleProfileModel.quranMemorizing = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createMaleProfileModel.quranMemorizing,
                  dropdownButtonList: DropdownButtonList.quranMemorizingList,
                )
              : DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createFemaleProfileModel.quranMemorizing = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createFemaleProfileModel.quranMemorizing,
                  dropdownButtonList: DropdownButtonList.quranMemorizingList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          !BlocProvider.of<AuthCubit>(context).isGender
              ? const Text(
                  AppStrings.acceptToWearNiqab,
                  style: AppTextStyles.cairoW300PrimaryColor,
                )
              : const SizedBox(),
          SizedBox(height: 0.01 * screenHeight),
          !authCubit.isGender
              ?DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createFemaleProfileModel.acceptToWearNiqab = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createFemaleProfileModel.acceptToWearNiqab,
                  dropdownButtonList: DropdownButtonList.acceptToWearNiqabList,
                )
              : const SizedBox(),
          SizedBox(height: 0.02 * screenHeight),
        ],
      ),
    );
  }
}
