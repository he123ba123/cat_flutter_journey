import 'package:cat_flutter_journey/core/routing/routes.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/screens/reset_password_screen.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/screens/signin_screen.dart';
import 'package:cat_flutter_journey/features/Auth/presentation/screens/singup_screen.dart';
import 'package:cat_flutter_journey/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: Routes.signin,
      routes: [
        GoRoute(
          path: Routes.signin,
          builder: (context, state) => SigninScreen(),
        ),
        GoRoute(
          path: Routes.signup,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: Routes.resetPassword,
          builder: (context, state) => const ResetPasswordScreen(),
        ),
      ],
    );
  }
}
