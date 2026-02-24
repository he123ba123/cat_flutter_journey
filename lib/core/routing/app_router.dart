import 'package:cat_flutter_journey/core/routing/routes.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: Routes.onboarding,
      routes: [
        // GoRoute(
        //   path: Routes.onboarding,
        //   builder: (context, state) => const OnboardingScreen(),
        // ),
      ],
    );
  }
}
