import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_case/gen/assets.gen.dart';
import 'package:test_case/router/router.dart';

@RoutePage()
class HomeNavBarPage extends StatelessWidget {
  const HomeNavBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final tabsRouter = AutoTabsRouter.of(context);

    return Scaffold(
      body: AutoTabsRouter(
        routes: [
          HomeRoute(),
          ProfileRouteRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),
              height: 71.h,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .scaffoldBackgroundColor, // Arka plan rengi
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BottomNavBarButton(
                    icon: Assets.icons.component4,
                    label: "home".tr(),
                    isSelected: tabsRouter.activeIndex == 0,
                    onTap: () => tabsRouter.setActiveIndex(0),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  _BottomNavBarButton(
                    icon: Assets.icons.component3,
                    label: "profile".tr(),
                    isSelected: tabsRouter.activeIndex == 1,
                    onTap: () => tabsRouter.setActiveIndex(1),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BottomNavBarButton extends StatelessWidget {
  final SvgGenImage icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomNavBarButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 135.w,
        height: 41.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
            width: 1.r,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.5.w, vertical: 6.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon.svg(
              width: 28.w,
              height: 28.h,
            ),
            SizedBox(width: 8.w),
            Text(label, style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
