import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';

import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/flutter_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_drawer.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_state.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/search_view/widgets/female_carousel_slider.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/search_view/widgets/male_carousel_slider.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/search_view/widgets/search_filter_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    TabController tabcontroller = TabController(length: 2, vsync: this);
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        // SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
        return Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: flutterAppBar(),
            endDrawer: const CustomDrawer(),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 0.01 * screenHeight),
                const SearchFilterWidget(),
                SizedBox(
                  width: double.maxFinite,
                  child: TabBar(
                    padding: const EdgeInsets.symmetric(horizontal: 88),
                    controller: tabcontroller,
                    dividerColor: AppColors.transparent,
                    indicatorColor: AppColors.primaryColor,
                    labelStyle: AppTextStyles.cairoW800PrimaryColor,
                    physics: const BouncingScrollPhysics(),
                    unselectedLabelStyle: AppTextStyles.cairoW400Black,
                    // isScrollable: true,
                    tabs: const [
                      Tab(
                        text: AppStrings.women,
                      ),
                      Tab(
                        text: AppStrings.men,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 0.7 * screenHeight,
                  child: TabBarView(
                    controller: tabcontroller,
                    children: const [
                      FemaleCarouselSlider(),
                      MaleCarouselSlider(),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
