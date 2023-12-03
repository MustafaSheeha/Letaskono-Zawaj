import 'package:go_router/go_router.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/on_boarding.dart';
import 'package:letaskono_zawaj/features/splash/presentation/view/splash_view.dart';

final GoRouter goRouter=GoRouter(routes: [
  GoRoute(path: AppRoutes.splash,
  builder: (context, state) => const SplashView()),
  GoRoute(path: AppRoutes.onBoarding,
  builder: (context, state) => const OnBoardingView()),
]);

