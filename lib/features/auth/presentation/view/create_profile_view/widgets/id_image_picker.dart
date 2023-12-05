import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/id_image_widget.dart';

class IdImagePicker extends StatelessWidget {
  const IdImagePicker({
    super.key,
    required this.onTap,
    required this.isFront,
  });
  final void Function() onTap;
  final bool isFront;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, child: IdImageWidget(isFront: isFront));
  }
}
