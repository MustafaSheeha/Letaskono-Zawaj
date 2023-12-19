import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/flutter_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_drawer.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/request_view/widgets/received_carousel_slider.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/request_view/widgets/send_carousel_slider.dart';

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
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
        return Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: flutterAppBar(),
            endDrawer: const CustomDrawer(),
            body: SingleChildScrollView(
              child: Column(
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
                    height: 0.7 * screenHeight,
                    child: TabBarView(
                      controller: tabcontroller,
                      children: [
                        state is GetMyReceivedUsersLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : profileCubit.myReceivedUserModelList.isEmpty
                                ? const Center(
                                    child: Text(
                                    AppStrings.youHaveNoReceivedRequestsYet,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                  ))
                                : const ReceivedCarouselSlider(),
                        state is GetMySendUsersLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : profileCubit.mySendUserModelList.isEmpty
                                ? const Center(
                                    child: Text(
                                    AppStrings.youHavenotSendRequestsYet,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                  ))
                                : const SendCarouselSlider(),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
