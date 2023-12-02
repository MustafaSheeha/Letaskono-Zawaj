import 'package:get_it/get_it.dart';
import 'package:letaskono_zawaj/core/database/cache/cache_helper.dart';

final getIt = GetIt.instance;

void registerSingletonService(){
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}