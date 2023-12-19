import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/awesome_snackbar_content.dart';
import 'package:letaskono_zawaj/core/utils/functions/flutter_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_drawer.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    TabController tabcontroller = TabController(length: 2, vsync: this);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetMyUsersSuccessState) {
          showAwesomeSnackbar(
              context: context,
              title: '',
              message: '',
              contentType: ContentType.success);
        } else if (state is GetMyUsersFailureState) {
          showAwesomeSnackbar(
              context: context,
              title: 'failure',
              message: state.errorMessege,
              contentType: ContentType.failure);
        }
      },
      builder: (context, state) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: flutterAppBar(),
            endDrawer: const CustomDrawer(),
            body: Column(
              children: [
                SizedBox(height: 0.23 * screenHeight),
                TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: tabcontroller,
                  dividerColor: AppColors.transparent,
                  indicatorColor: AppColors.primaryColor,
                  labelStyle: AppTextStyles.cairoW800PrimaryColor,
                  physics: const BouncingScrollPhysics(),
                  unselectedLabelStyle: AppTextStyles.cairoW400Black,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: AppStrings.receivedRequest,
                    ),
                    Tab(
                      text: AppStrings.sentRequest,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 0.5 * screenHeight,
                  child: TabBarView(
                    controller: tabcontroller,
                    children: [
                      Column(
                        children: [],
                      ),
                      Column(
                        children: [],
                      ),
                      
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
