import 'package:auto_route/auto_route.dart';
import 'package:test_case/constants/colors.dart';
import 'package:test_case/constants/text_styles.dart';
import 'package:test_case/custom/custom_filled_button.dart';
import 'package:test_case/gen/assets.gen.dart';
import 'package:test_case/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//size of the screen

@RoutePage()
class IntroPage extends StatelessWidget {
  const IntroPage();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: AppColors.background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 120.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Assets.icons.show.svg(
                    width: 200.r,
                    height: 130.r,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30.h,
            child: SizedBox(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350.w,
                    height: 60.h,
                    child: CustomFilledButton(
                      onPressed: () {
                        context.router.push(const LoginRoute());
                      },
                      child: Text(
                        'Login',
                        style: labelMedium.copyWith(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350.w,
                    height: 60.r,
                    child: TextButton(
                      style: TextButtonTheme.of(context).style?.copyWith(
                        overlayColor: WidgetStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.transparent;
                            }
                            return Colors.transparent;
                          },
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: labelMedium.copyWith(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      ),
                      onPressed: () {
                        // context.router.replace(const HomeRoute());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
