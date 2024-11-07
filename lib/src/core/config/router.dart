import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/money/pages/money_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/extra_model.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/money',
      builder: (context, state) => MoneyPage(
        extra: state.extra as ExtraModel,
      ),
    ),
  ],
);
