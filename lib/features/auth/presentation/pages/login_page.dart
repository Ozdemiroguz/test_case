import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/custom/custom_filled_button.dart';
import 'package:test_case/custom/custom_text_field.dart';
import 'package:test_case/custom/password_text_field.dart';
import 'package:test_case/features/auth/presentation/widgets/social_media_sign.dart';
import 'package:test_case/gen/assets.gen.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
//statefull widget
class LoginPage extends StatefulHookConsumerWidget {
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
  const LoginPage();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool checkedValue = false;
  final searchControllerEmail = TextEditingController();
  final searchControllerPassword = TextEditingController();
  //final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //providersları tanımla

    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 39.w),
      child: Column(
        children: [
          //   SizedBox(
          //     height: 300.5.h,
          //   ),
          //   Text(
          //     "hello".tr(),
          //     style: Theme.of(context).textTheme.titleSmall,
          //     textAlign: TextAlign.center,
          //   ),
          //   Padding(
          //     padding: EdgeInsets.only(left: 44.w, right: 44.w, top: 8.h),
          //     child: Text("hello_underline".tr(),
          //         style: Theme.of(context).textTheme.labelMedium,
          //         textAlign: TextAlign.center),
          //   ),
          //   SizedBox(
          //     height: 40.h,
          //   ),
          //   CustomTextField(
          //     prefixIcon: Assets.icons.message.svg(
          //       width: 18.w,
          //       height: 18.h,
          //     ),
          //   ),
          //   SizedBox(
          //     height: 13.h,
          //   ),
          //   PasswordTextField(
          //     prefixIcon: Assets.icons.unlock.svg(
          //       width: 18.w,
          //       height: 18.h,
          //     ),
          //   ),
          //   SizedBox(
          //     height: 29.h,
          //   ),
          //   Align(
          //       alignment: Alignment.centerLeft,
          //       child: TextButton(
          //           onPressed: () {},
          //           child: Text("forgot_password".tr(),
          //               style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //                     decoration: TextDecoration.underline,
          //                     // decorationColor: Theme.of(context).primaryColor,
          //                   )))),
          //   SizedBox(
          //     height: 29.h,
          //   ),
          //   CustomFilledButton(onPressed: () {}, child: Text("login".tr())),
          //   SizedBox(
          //     height: 36.h,
          //   ),
          //   SocialMediaSign(),
          //   SizedBox(height: 32.h),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text("dont_have_account".tr()),
          //       TextButton(
          //           onPressed: () {
          //             context.router.pushNamed('/register');
          //           },
          //           child: Text("register".tr()))
          //     ],
          //   )
        ],
      ),
    ));
  }
}
