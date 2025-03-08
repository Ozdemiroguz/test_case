import 'package:auto_route/auto_route.dart';
import 'package:test_case/features/home/presentation/pages/home_page.dart';
import 'package:test_case/features/profile/presentation/pages/profile_page.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';

import '../features/home/presentation/pages/home_nav_bar_page.dart';
import '../features/intro/presentation/pages/intro_page.dart';
import '../features/profile/presentation/pages/detailed_profile_page.dart';
import '../features/profile/presentation/pages/profile_image_update_page.dart';
import '../features/profile/presentation/pages/profile_route_page.dart';
import '../splash_page.dart';

part "router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Page|Screen|View|Widget|Tab,Route")
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        // Initial route
        AutoRoute(page: SplashRoute.page, initial: true),

        // Authentication routes
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ProfileImageUpdateRoute.page),

        AutoRoute(page: HomeNavBarRoute.page, children: [
          AutoRoute(
            page: ProfileRouteRoute.page,
            children: [
              AutoRoute(
                  page: ProfileRoute.page, initial: true), // Ana profil sayfası
              AutoRoute(
                  page: DetailedProfileRoute.page), // Detaylı profil sayfası
            ],
          ),
          AutoRoute(
            page: HomeRoute.page,
          ),
        ]),

        // Intro route
        AutoRoute(page: IntroRoute.page),
      ];
}
