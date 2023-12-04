import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/database/cache/cache_helper.dart';
import 'package:letaskono_zawaj/core/service/service_locator.dart';
import 'package:letaskono_zawaj/core/utils/functions/check_current_auth_state.dart';
import 'package:letaskono_zawaj/core/utils/functions/firebase_initialize_app.dart';
import 'package:letaskono_zawaj/core/utils/functions/set_system_ui_overlay_style.dart';
import 'package:letaskono_zawaj/material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitializeApp();
  checkCurrentAuthState();
  registerSingletonService();
  await getIt<CacheHelper>().init();
  setSystemUIOverlayStyle();

  runApp(const LetaskonoZawajApp());
}
