import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_impl/app.dart';
import 'package:go_router_impl/screens/carts/carts.dart';
import 'package:go_router_impl/screens/login.dart';
import 'package:go_router_impl/screens/products/product_details.dart';
import 'package:go_router_impl/screens/products/products.dart';
import 'package:go_router_impl/screens/home/home.dart';
import 'package:go_router_impl/screens/profile/personal_info.dart';
import 'package:go_router_impl/screens/profile/profile.dart';
import 'package:go_router_impl/utils/version_manager/module_enums.dart';
import 'package:go_router_impl/utils/version_manager/version_manager.dart';

import '../screens/profile/professional_info.dart';
import '../screens/update_required_dialog.dart';

abstract class Routes {
  static const String login = 'login';
  static const String home = 'home';
  static const String products = 'products';
  static const String productDetails = 'product-details';
  static const String carts = 'carts';
  static const String profile = 'profile';
  static const String personalInfo = 'personal-info';
  static const String professionalInfo = 'professional-info';

  /// home routes
  static final GoRoute homeRoutes = GoRoute(
      path: '/',
      name: home,
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: [loginRoutes, productRoutes, cartsRoutes, profileRoutes]);

  /// login module routes
  static final GoRoute loginRoutes = GoRoute(
    path: 'login',
    name: login,
    builder: (BuildContext context, GoRouterState state) {
      return const Login();
    },
  );

  /// products module routes
  static final GoRoute productRoutes = GoRoute(
      path: 'products',
      name: products,
      builder: (BuildContext context, GoRouterState state) {
        return Products();
      },
      routes: [
        GoRoute(
            path: 'product-details/:name',
            name: productDetails,
            builder: (BuildContext context, GoRouterState state) {
              final String name = state.params['name'] ?? '';
              return ProductDetails(productName: name);
            })
      ]);

  /// profile module routes
  static final GoRoute profileRoutes = GoRoute(
      path: 'profile',
      name: profile,
      builder: (BuildContext context, GoRouterState state) {
        return const Profile();
      },
      routes: [
        GoRoute(
            path: 'personal-info',
            name: personalInfo,
            builder: (BuildContext context, GoRouterState state) {
              return const PersonalInfo();
            }),
        GoRoute(
            path: 'professional-info',
            name: professionalInfo,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfessionalInfo();
            }),
      ]);

  /// carts module routes
  static final GoRoute cartsRoutes = GoRoute(
    path: 'carts',
    name: carts,
    builder: (BuildContext context, GoRouterState state) {
      return Carts();
    },
  );

  static void pushNamed(
      {required Module moduleName,
      required String routeName,
      Map<String, String>? params}) {
    if (VersionManager.minVersionSatisfied(moduleName)) {
      GoRouter.of(MyApp.globalGoNavigator!)
          .pushNamed(routeName, params: params ?? {});
    } else {
      showUpdateRequiredDialog(MyApp.globalGoNavigator!);
    }
  }

  static void goNamed(
      {required Module moduleName,
      required String routeName,
      Map<String, String>? params}) {
    if (VersionManager.minVersionSatisfied(moduleName)) {
      GoRouter.of(MyApp.globalGoNavigator!)
          .goNamed(routeName, params: params ?? {});
    } else {
      showUpdateRequiredDialog(MyApp.globalGoNavigator!);
    }
  }
}
