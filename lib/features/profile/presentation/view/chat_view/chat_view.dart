import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/flutter_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_drawer.dart';
import 'package:letaskono_zawaj/core/widgets/custom_horizontal_divider.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
          const ChatTile(),
          const CustomHorizontalDivider(),
        ],
      ),
    );
  }
}


class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryColor,
        ),
        title: Text('مصطفى محمود'),
        titleTextStyle: AppTextStyles.cairoW300PrimaryColor,
        subtitle: Text('مرحبا أهلا بك'),
        subtitleTextStyle: AppTextStyles.cairoW400Black,
        trailing: Text('21/10/2023'),
      ),
    );
  }
}
