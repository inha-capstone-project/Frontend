import 'package:go_router/go_router.dart';
import 'package:inha_capstone_project_byoa/screens/login_pages/login_screen.dart';

final GoRouter route = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
  ],
);
