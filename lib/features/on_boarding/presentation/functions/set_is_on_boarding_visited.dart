import 'package:letaskono_zawaj/core/database/cache/cache_helper.dart';
import 'package:letaskono_zawaj/core/service/service_locator.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';

void setIsOnBoardingvisited() {
    getIt<CacheHelper>().setData(key: AppStrings.isOnBoardingvisitedKey,value: true);
  }