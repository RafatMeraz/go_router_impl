import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_impl/screens/error_screen.dart';
import 'package:go_router_impl/utils/login_state.dart';
import 'package:provider/provider.dart';
import 'utils/routes.dart';

final LoginState loginState = LoginState();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(create: (_) => LoginState())
      ],
      child: MaterialApp.router(
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        routerDelegate: goRouter.routerDelegate,
      ),
    );
  }

  final GoRouter goRouter = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      redirect: (BuildContext context, GoRouterState state) {
        final isLoggedIn = loginState.isLoggedIn;
        final isLogging = state.location == '/login';
        if (!isLoggedIn && !isLogging) {
          return '/login';
        }
        if (isLoggedIn && isLogging) return '/';
        return null;
      },
      refreshListenable: loginState,
      routes: <GoRoute>[
        Routes.homeRoutes,
      ],
      errorBuilder: (context, state) => const ErrorScreen());
}
