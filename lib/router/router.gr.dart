// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [DetailedProfilePage]
class DetailedProfileRoute extends PageRouteInfo<void> {
  const DetailedProfileRoute({List<PageRouteInfo>? children})
    : super(DetailedProfileRoute.name, initialChildren: children);

  static const String name = 'DetailedProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DetailedProfilePage();
    },
  );
}

/// generated route for
/// [HomeNavBarPage]
class HomeNavBarRoute extends PageRouteInfo<void> {
  const HomeNavBarRoute({List<PageRouteInfo>? children})
    : super(HomeNavBarRoute.name, initialChildren: children);

  static const String name = 'HomeNavBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeNavBarPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [IntroPage]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute({List<PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return IntroPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [ProfileImageUpdatePage]
class ProfileImageUpdateRoute
    extends PageRouteInfo<ProfileImageUpdateRouteArgs> {
  ProfileImageUpdateRoute({
    required bool isSetupAccount,
    List<PageRouteInfo>? children,
  }) : super(
         ProfileImageUpdateRoute.name,
         args: ProfileImageUpdateRouteArgs(isSetupAccount: isSetupAccount),
         rawPathParams: {'isSetupAccount': isSetupAccount},
         initialChildren: children,
       );

  static const String name = 'ProfileImageUpdateRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProfileImageUpdateRouteArgs>(
        orElse:
            () => ProfileImageUpdateRouteArgs(
              isSetupAccount: pathParams.getBool('isSetupAccount'),
            ),
      );
      return ProfileImageUpdatePage(isSetupAccount: args.isSetupAccount);
    },
  );
}

class ProfileImageUpdateRouteArgs {
  const ProfileImageUpdateRouteArgs({required this.isSetupAccount});

  final bool isSetupAccount;

  @override
  String toString() {
    return 'ProfileImageUpdateRouteArgs{isSetupAccount: $isSetupAccount}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [ProfileRoutePage]
class ProfileRouteRoute extends PageRouteInfo<void> {
  const ProfileRouteRoute({List<PageRouteInfo>? children})
    : super(ProfileRouteRoute.name, initialChildren: children);

  static const String name = 'ProfileRouteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileRoutePage();
    },
  );
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return RegisterPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    String? resetToken,
    String? userId,
    List<PageRouteInfo>? children,
  }) : super(
         SplashRoute.name,
         args: SplashRouteArgs(resetToken: resetToken, userId: userId),
         initialChildren: children,
       );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return SplashPage(resetToken: args.resetToken, userId: args.userId);
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.resetToken, this.userId});

  final String? resetToken;

  final String? userId;

  @override
  String toString() {
    return 'SplashRouteArgs{resetToken: $resetToken, userId: $userId}';
  }
}
