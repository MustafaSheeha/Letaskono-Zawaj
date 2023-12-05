
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class DropdownButtonWidget extends StatefulWidget {
   DropdownButtonWidget({super.key, required this.selectedValue, required this.dropdownButtonList});
   String? selectedValue;
  final List<String> dropdownButtonList;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      
      // margin: const EdgeInsets.only(left: 20, right: 12),
      height: screenHeight * 0.059,
      width: screenWidth * 0.8,
      // alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButton<String?>(
          
          icon: const Icon(Icons.expand_more,color: AppColors.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          isExpanded: true,
          alignment: Alignment.centerRight,
          underline: Container(),
          padding: const EdgeInsets.all(11),
          value: widget.selectedValue,
          items: widget.dropdownButtonList.map((e) {
            return DropdownMenuItem<String?>(
              alignment: Alignment.centerRight,
              value: e,
              child: Text(
                e,
                style: AppTextStyles.cairoW400Black,
                textAlign: TextAlign.end,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.selectedValue= value!;
            });
          },
        ),
      ),
    );
  }
}
