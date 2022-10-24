import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_impl/screens/error_screen.dart';
import 'package:go_router_impl/utils/login_state.dart';
import 'utils/routes.dart';

final LoginState loginState = LoginState();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  static BuildContext? globalGoNavigator;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MyApp.globalGoNavigator =
          goRouter.routerDelegate.navigatorKey.currentContext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      routerDelegate: goRouter.routerDelegate,
      key: navigatorKey,
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
