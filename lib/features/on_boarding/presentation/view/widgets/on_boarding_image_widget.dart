
import 'package:flutter/material.dart';

class OnBoardingImageWidget extends StatelessWidget {
  const OnBoardingImageWidget({
    super.key,
    required this.imagePath,
  });

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
        height: 0.3 * screenHeight,
        width: 0.5 * screenWidth,
        child: Image.asset(imagePath));
  }
}
