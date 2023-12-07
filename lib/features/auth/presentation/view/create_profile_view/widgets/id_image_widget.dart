import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';

class IdImageWidget extends StatelessWidget {
  const IdImageWidget({
    super.key,
    required this.isFront,
  });
  final bool isFront;
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return isFront ? const FrontSide() : const BackSide();
  }
}

class FrontSide extends StatelessWidget {
  const FrontSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Container(
          height: 0.249 * screenHeight,
          width: 0.9 * screenWidth,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: state is FrontSideImagePickerLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.idBackground,
                    ),
                    color: const Color.fromARGB(255, 234, 237, 242),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: authCubit.frontSideImage == null
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const UpRow(),
                              SizedBox(height: 0.04 * screenHeight),
                              const DownRow(),
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.file(
                            authCubit.frontSideImage!,
                            fit: BoxFit.cover,
                            // height: 0.2 * screenHeight,
                            // width: 0.9 * screenWidth,
                          ),
                        )),
        );
      },
    );
  }
}

class BackSide extends StatelessWidget {
  const BackSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Container(
          height: 0.249 * screenHeight,
          width: 0.9 * screenWidth,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: state is BackSideImagePickerLoadingState
              ? const Center(
                  child: SizedBox(child: CircularProgressIndicator()))
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.idBackground,
                    ),
                    color: const Color.fromARGB(255, 234, 237, 242),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: authCubit.backSideImage == null
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      const UpElongatedRoundedRectangle(),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const UpElongatedRoundedRectangle(),
                                    ],
                                  ),
                                  SizedBox(width: 0.1 * screenWidth),
                                  Row(
                                    children: [
                                      const ElongatedColumnBack(),
                                      SizedBox(width: 0.02 * screenWidth),
                                      const ElongatedColumnBack(),
                                      SizedBox(width: 0.02 * screenWidth),
                                      const ElongatedColumnBack(),
                                      SizedBox(width: 0.02 * screenWidth),
                                      const ElongatedColumnBack(),
                                      SizedBox(width: 0.02 * screenWidth),
                                      const ElongatedColumnBack(),
                                      SizedBox(width: 0.02 * screenWidth),
                                      const ElongatedColumnBack(),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 0.04 * screenHeight),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      const DownElongatedBack(),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const DownElongatedBack(),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const DownElongatedBack(),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.file(
                            authCubit.backSideImage!,
                            fit: BoxFit.cover,
                            // height: 0.2 * screenHeight,
                            // width: 0.9 * screenWidth,
                          ),
                        )),
        );
      },
    );
  }
}

class ElongatedColumnBack extends StatelessWidget {
  const ElongatedColumnBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 0.045 * screenHeight,
      width: 0.007 * screenWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            spreadRadius: 0.5,
          )
        ],
        color: AppColors.idBright,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class DownElongatedBack extends StatelessWidget {
  const DownElongatedBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 0.01 * screenHeight,
      width: 0.65 * screenWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            spreadRadius: 0.5,
          )
        ],
        color: AppColors.idBright,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class DownRow extends StatelessWidget {
  const DownRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Column(
          children: [
            const DownElongatedRoundedRectangle(),
            SizedBox(height: 0.02 * screenHeight),
            const DownElongatedRoundedRectangle(),
            SizedBox(height: 0.02 * screenHeight),
            const DownElongatedRoundedRectangle(),
          ],
        ),
        SizedBox(width: 0.1 * screenWidth),
        const CircularContainer()
      ],
    );
  }
}

class UpRow extends StatelessWidget {
  const UpRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(width: 0.01 * screenWidth),
        const RoundedRectangleContainer(),
        SizedBox(width: 0.15 * screenWidth),
        Column(
          children: [
            const UpElongatedRoundedRectangle(),
            SizedBox(height: 0.04 * screenWidth),
            const UpElongatedRoundedRectangle(),
          ],
        )
      ],
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 0.06 * screenHeight,
      width: 0.13 * screenWidth,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 5,
          blurStyle: BlurStyle.outer,
          spreadRadius: 0.5,
        )
      ], color: AppColors.idBright, shape: BoxShape.circle),
    );
  }
}

class DownElongatedRoundedRectangle extends StatelessWidget {
  const DownElongatedRoundedRectangle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 0.01 * screenHeight,
      width: 0.45 * screenWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            spreadRadius: 0.5,
          )
        ],
        color: AppColors.idBright,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class UpElongatedRoundedRectangle extends StatelessWidget {
  const UpElongatedRoundedRectangle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 0.01 * screenHeight,
      width: 0.4 * screenWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            spreadRadius: 0.5,
          )
        ],
        color: AppColors.idBright,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class RoundedRectangleContainer extends StatelessWidget {
  const RoundedRectangleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 44,
      width: 0.08 * screenWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
            spreadRadius: 0.5,
          )
        ],
        color: AppColors.idDark,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
