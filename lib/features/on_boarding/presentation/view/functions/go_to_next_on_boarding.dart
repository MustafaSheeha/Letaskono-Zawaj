import 'package:flutter/material.dart';

void goToNextOnBoarding(PageController controller) {
    controller.nextPage(
        duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
  }