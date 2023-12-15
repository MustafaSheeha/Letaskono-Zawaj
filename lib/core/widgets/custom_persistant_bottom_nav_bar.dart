import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/chat_view/chat_view.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/favorite_view/favorite_view.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/home_view.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/request_view/request_view.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/search_view/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomPersistantBottomNavBar extends StatelessWidget {
  CustomPersistantBottomNavBar({super.key});
  final PersistentTabController _persistentTabController =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      bottomScreenMargin: 11,
      context,
      controller: _persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.primaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(110),
          topRight: Radius.circular(110),
        ),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) => ProfileCubit()..getMyUser(),
        child: const HomeView(),
      ),
      BlocProvider(
        create: (context) => SearchCubit()
          ..getAllFemaleUsers()
          ..getAllMaleUsers(),
        child: const SearchView(),
      ),
      const ChatView(),
      const RequestView(),
      BlocProvider(
        create: (context) => SearchCubit()
          ..getAllFavoriteUsers(),
        child: const FavoriteView(),
      ),
      // const RegisterView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_2, color: AppColors.primaryColor),
        inactiveIcon:
            const Icon(Icons.person_2_outlined, color: AppColors.white),
        title: ("حسابي"),
        textStyle: const TextStyle(fontFamily: 'Cairo'),
        activeColorPrimary: Colors.white,
        activeColorSecondary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search, color: AppColors.primaryColor),
        inactiveIcon: const Icon(Icons.search_outlined, color: AppColors.white),
        title: ("البحث"),
        textStyle: const TextStyle(fontFamily: 'Cairo'),
        activeColorPrimary: Colors.white,
        activeColorSecondary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.drafts, color: AppColors.primaryColor),
        inactiveIcon: const Icon(Icons.drafts_outlined, color: AppColors.white),
        title: ("المراسلة"),
        textStyle: const TextStyle(fontFamily: 'Cairo'),
        activeColorPrimary: Colors.white,
        activeColorSecondary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.request_page, color: AppColors.primaryColor),
        inactiveIcon:
            const Icon(Icons.request_page_outlined, color: AppColors.white),
        title: ("الطلبات"),
        textStyle: const TextStyle(fontFamily: 'Cairo'),
        activeColorPrimary: Colors.white,
        activeColorSecondary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite, color: AppColors.primaryColor),
        inactiveIcon:
            const Icon(Icons.favorite_outline, color: AppColors.white),
        title: ("المحفوظات"),
        textStyle: const TextStyle(fontFamily: 'Cairo'),
        activeColorPrimary: Colors.white,
        activeColorSecondary: AppColors.primaryColor,
      ),
    ];
  }
}
