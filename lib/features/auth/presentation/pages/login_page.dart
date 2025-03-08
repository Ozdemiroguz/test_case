import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/constants/text_styles.dart';
import 'package:test_case/custom/custom_filled_button.dart';
import 'package:test_case/custom/custom_text_field.dart';
import 'package:test_case/custom/password_text_field.dart';
import 'package:test_case/features/auth/presentation/providers/login_provider.dart';
import 'package:test_case/features/auth/presentation/widgets/social_media_sign.dart';
import 'package:test_case/gen/assets.gen.dart';
import 'package:test_case/router/router.dart';
import 'package:test_case/common/loading_overlay.dart';
import 'package:test_case/custom/custom_dialog.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Listen to the loginProvider's isLoading state to show/hide loading overlay
    ref.listen(loginProvider.select((state) => state.isLoading),
        (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide();
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 39.w),
        child: Column(
          children: [
            SizedBox(height: 260.h),
            Text(
              "hello".tr(),
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(left: 44.w, right: 44.w, top: 8.h),
              child: Text(
                "hello_underline".tr(),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),
            Form(
              key: ref.watch(_keyProvider),
              child: Column(
                children: [
                  const _EmailInput(),
                  SizedBox(height: 13.h),
                  const _PasswordInput(),
                ],
              ),
            ),
            SizedBox(height: 29.h),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // Forgot password action
                },
                child: Text(
                  "forgot_password".tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            _LoginButton(),
            SizedBox(height: 36.h),
            SocialMediaSign(),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "dont_have_account".tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(125),
                      ),
                ),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).replace(const RegisterRoute());
                  },
                  child: Text(
                    "register".tr(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    return CustomTextField(
      initialValue: state.email,
      onChanged: notifier.onEmailChanged,
      onFieldSubmitted: notifier.onEmailChanged,
      onSaved: notifier.onEmailChanged,
      validator: (value) => state.emailFailure.toNullable()?.message,
      hintText: 'email'.tr(),
      prefixIcon: Assets.icons.message.svg(width: 18.w, height: 18.h),
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    return PasswordTextField(
      onChanged: notifier.onPasswordChanged,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: notifier.onPasswordChanged,
      validator: (value) => state.passwordFailure.toNullable()?.message,
      hintText: 'password'.tr(),
      prefixIcon: Assets.icons.unlock.svg(width: 18.w, height: 18.h),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(_keyProvider);
    return CustomFilledButton(
      onPressed: () async {
        final formState = ref.read(_keyProvider).currentState;

        final notifier = ref.read(loginProvider.notifier);

        formState
          ?..save()
          ..validate();

        notifier.showValidationErrors();
        if (ref.read(loginProvider).isValid &&
            (formState?.validate() ?? false)) {
          await notifier.login();

          ref.read(loginProvider).failure.fold(
                () => context.router.replaceAll([const HomeNavBarRoute()]),
                (t) => CustomDialog.failure(
                  title: 'Hata',
                  subtitle: t.message,
                ).show(context),
              );
        }
      },
      child: Text(
        "login".tr(),
        style: labelMedium.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
