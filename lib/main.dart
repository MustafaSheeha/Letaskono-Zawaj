import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/database/cache/cache_helper.dart';
import 'package:letaskono_zawaj/core/service/service_locator.dart';
import 'package:letaskono_zawaj/material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerSingletonService();
  await getIt<CacheHelper>().init();
  runApp(const LetaskonoZawajApp());
}
