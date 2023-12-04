
import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0.035 * screenWidth,
        vertical: 0.01 * screenHeight,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 0.08 * screenWidth, vertical: 0.01 * screenHeight),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              spreadRadius: 5.0,
              offset: Offset(3.0, 3.0))
        ],
      ),
      child: widget,
    );
  }
}
