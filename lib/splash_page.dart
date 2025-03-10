// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:test_case/core/injections/locator.dart';
import 'package:test_case/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/colors.dart';
import 'gen/assets.gen.dart';

final _isTokenExpiredProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(authRepositoryProvider).isTokenExpired());

@RoutePage()
class SplashPage extends StatefulHookConsumerWidget {
  final String? resetToken;
  final String? userId;

  const SplashPage({this.resetToken, this.userId});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        FlutterNativeSplash.remove();

        Future.delayed(const Duration(seconds: 3), () async {
          final isTokenExpired = await ref.read(_isTokenExpiredProvider.future);
          if (isTokenExpired) {
            context.router.replace(const LoginRoute());
          } else {
            context.router.replace(const HomeNavBarRoute());
          }
        });

        return null;
      },
      [],
    );
    return Material(
      color: AppColors.background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // isTablet.fold(
          //   () => Assets.images.splashBgPhone.image(fit: BoxFit.fill),
          //   (t) => Assets.images.splashBgTablet.image(fit: BoxFit.fill),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle),
                width: 120.r,
                height: 120.r,
                child: Assets.images.logo.image(width: 60.r, height: 60.r),
              ),
            ],
          ),
          Positioned(bottom: 36.h, right: 0, left: 0, child: Container()),
        ],
      ),
    );
  }
}
