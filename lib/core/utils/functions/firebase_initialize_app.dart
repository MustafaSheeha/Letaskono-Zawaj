import 'package:firebase_core/firebase_core.dart';
import 'package:letaskono_zawaj/firebase_options.dart';

Future<void> firebaseInitializeApp() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
