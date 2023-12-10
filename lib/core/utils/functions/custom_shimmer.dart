import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width:screenHeight * 0.5,
      height: screenWidth * 0.5,
      child: Shimmer.fromColors(
        direction: ShimmerDirection.rtl,
        baseColor: Colors.white,
        highlightColor: Colors.white,
        child: CardContainer(
            widget: Column(
          children: [
            SizedBox(height: screenHeight * 0.005),
            Skeleton(
              height: screenHeight * 0.005,
              width: screenWidth * 0.05,
            ),
            Skeleton(
              height: screenHeight * 0.05,
              width: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.018),
            SizedBox(height: screenHeight * 0.005),
            Skeleton(
              height: screenHeight * 0.005,
              width: screenWidth * 0.05,
            ),
            Skeleton(
              height: screenHeight * 0.05,
              width: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.018),
            SizedBox(height: screenHeight * 0.005),
            Skeleton(
              height: screenHeight * 0.005,
              width: screenWidth * 0.05,
            ),
            Skeleton(
              height: screenHeight * 0.05,
              width: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.018),
            SizedBox(height: screenHeight * 0.005),
            Skeleton(
              height: screenHeight * 0.005,
              width: screenWidth * 0.05,
            ),
            Skeleton(
              height: screenHeight * 0.05,
              width: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.018),
            SizedBox(height: screenHeight * 0.005),
            Skeleton(
              height: screenHeight * 0.005,
              width: screenWidth * 0.05,
            ),
            Skeleton(
              height: screenHeight * 0.05,
              width: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.018),
          ],
        )),
      ),
    );
    ;
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;
  static const double defaultPadding = 16.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius:
              const BorderRadius.all(Radius.circular(defaultPadding))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
