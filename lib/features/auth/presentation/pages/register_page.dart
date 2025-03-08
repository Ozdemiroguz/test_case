import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:test_case/constants/text_styles.dart';
import 'package:test_case/custom/custom_filled_button.dart';
import 'package:test_case/custom/custom_text_field.dart';
import 'package:test_case/custom/password_text_field.dart';
import 'package:test_case/features/auth/presentation/providers/signup_provider.dart';
import 'package:test_case/features/auth/presentation/widgets/social_media_sign.dart';
import 'package:test_case/gen/assets.gen.dart';
import 'package:test_case/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/loading_overlay.dart';
import '../../../../custom/custom_dialog.dart';

final _formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
//statefull widget
class RegisterPage extends StatefulHookConsumerWidget {
  const RegisterPage();

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(signupProvider.select((value) => value.isLoading),
        (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide();
      }
    });
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text(
              'welcome'.tr(),
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 8.h),
              child: Text('welcome_underline'.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 40.h,
            ),
            Form(
              key: ref.watch(_formKeyProvider),
              child: Column(
                children: [
                  _NameInput(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _EmailInput(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _PasswordInput(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _PasswordRepeatInput(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _AgreementText(),
                  SizedBox(
                    height: 38.h,
                  ),
                  _SignUpButton(),
                ],
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            SocialMediaSign(),
            SizedBox(height: 32.h),
            _AlreayHaveAccount(),
          ],
        ),
      ),
    ));
  }
}

class _NameInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupProvider.notifier);
    final state = ref.watch(signupProvider);
    return CustomTextField(
      initialValue: state.name,
      hintText: 'name_surname'.tr(),
      onChanged: notifier.onNameChanged,
      onFieldSubmitted: notifier.onNameChanged,
      onSaved: notifier.onNameChanged,
      prefixIcon: Assets.icons.addUser.svg(
        width: 18.w,
        height: 18.h,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'name_error'.tr();
        }
        return null;
      },
    );
  }
}

class _EmailInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupProvider.notifier);
    final state = ref.watch(signupProvider);
    return CustomTextField(
      initialValue: state.email,
      onChanged: notifier.onEmailChanged,
      onFieldSubmitted: notifier.onEmailChanged,
      onSaved: notifier.onEmailChanged,
      validator: (value) => state.emailFailure.toNullable()?.message,
      hintText: 'email'.tr(),
      prefixIcon: Assets.icons.message.svg(
        width: 18.w,
        height: 18.h,
      ),
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupProvider.notifier);
    final state = ref.watch(signupProvider);

    return PasswordTextField(
      onChanged: notifier.onPasswordChanged,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: notifier.onPasswordChanged,
      hintText: 'password'.tr(),
      prefixIcon: Assets.icons.unlock.svg(
        width: 18.w,
        height: 18.h,
      ),
      validator: (value) => state.passwordFailure.toNullable()?.message,
    );
  }
}

//şifre repeat
class _PasswordRepeatInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupProvider.notifier);
    final state = ref.watch(signupProvider);

    return PasswordTextField(
      onChanged: notifier.onConfirmPasswordChanged,
      onFieldSubmitted: notifier.onConfirmPasswordChanged,
      onSaved: notifier.onConfirmPasswordChanged,
      hintText: 'password_confirm'.tr(),
      prefixIcon: Assets.icons.unlock.svg(
        width: 18.w,
        height: 18.h,
      ),
      validator: (value) => state.confirmPasswordFailure.toNullable()?.message,
    );
  }
}

//kullnaıcı sözleşmesi okudjm kabul ediyorum kısmı tıklanabilir ve kalın

class _AgreementText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "agreement1".tr(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context)
                .colorScheme
                .onPrimary
                .withAlpha(125)), // Açık gri renk
        children: [
          TextSpan(
              text: "agreement2".tr(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Kullanıcı sözleşmesi sayfasına yönlendirme yapılacak
                },
              children: [
                TextSpan(
                  text: "agreement3".tr(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(125)), // Açık gri renk
                ),
              ]),
        ],
      ),
    );
  }
}

class _SignUpButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
      onPressed: () async {
        final formState = ref.read(_formKeyProvider).currentState;

        final notifier = ref.read(signupProvider.notifier);

        formState
          ?..save()
          ..validate();

        notifier.showValidationErrors();

        if (ref.read(signupProvider).isValid &&
            (formState?.validate() ?? false)) {
          await notifier.signUp();

          ref.read(signupProvider).failure.fold(
                () => AutoRouter.of(context).replace(ProfileImageUpdateRoute(
                  isSetupAccount: true,
                )),
                (t) => CustomDialog.failure(
                  title: 'Hata',
                  subtitle: t.message.tr(),
                ).show(context),
              );
        }
      },
      child: Text(
        'register'.tr(),
        style: labelMedium.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp),
      ),
    );
  }
}

class _AlreayHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'already_have_account'.tr(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(125),
              ),
        ),
        TextButton(
          onPressed: () {
            AutoRouter.of(context).replace(const LoginRoute());
          },
          child:
              Text('login'.tr(), style: Theme.of(context).textTheme.labelSmall),
        ),
      ],
    );
  }
}
