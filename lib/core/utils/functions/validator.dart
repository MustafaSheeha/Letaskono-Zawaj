import 'package:letaskono_zawaj/core/utils/app_strings.dart';

String? validator(value) {
    if (value!.isEmpty) {
      return AppStrings.isRequired;
    } else {
      return null;
    }
  }