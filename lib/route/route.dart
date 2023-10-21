import 'package:go_router/go_router.dart';
import 'package:inha_capstone_project_byoa/screens/byoa_pages/page_setting/responsive.dart';
import 'package:inha_capstone_project_byoa/screens/login_pages/sign_up_screen.dart';

final GoRouter route = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BYOA(),
    ),
    GoRoute(
      path: '/signUp',
      builder: (context, state) => SignUpScreen(),
    ),
  ],
);
