import 'package:go_router/go_router.dart';
import 'package:letaskono_zawaj/features/splash/presentation/view/splash_view.dart';

final GoRouter goRouter=GoRouter(routes: [
  GoRoute(path: '/',
  builder: (context, state) => const SplashView(),)
]);