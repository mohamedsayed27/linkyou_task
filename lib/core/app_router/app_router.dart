import 'package:flutter/material.dart';
import 'package:linkyou_task/core/app_router/screens_name.dart';
import 'package:linkyou_task/presentation/screens/auth_screens/google_login_screen.dart';
import 'package:linkyou_task/presentation/screens/intro_screens/splash_screen.dart';
import 'package:linkyou_task/presentation/screens/users_list_screen/users_list_screen.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.usersListScreen:
          return MaterialPageRoute(builder: (_)=>const UsersListScreen(),);
        case ScreenName.splashScreen:
          return MaterialPageRoute(builder: (_)=>const SplashScreen(),);
        case ScreenName.googleSignInScreen:
          return MaterialPageRoute(builder: (_)=>const GoogleLoginScreen(),);
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error when routing to this screen'),
        ),
      );
    });
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
        );
}
