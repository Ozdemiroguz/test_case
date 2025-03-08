import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/constants/colors.dart';
import 'package:test_case/gen/assets.gen.dart';

class SocialMediaSign extends ConsumerWidget {
  const SocialMediaSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialMediaSignButton(
          icon: Assets.icons.google,
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        _SocialMediaSignButton(
          icon: Assets.icons.facebook,
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        _SocialMediaSignButton(
          icon: Assets.icons.apple,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _SocialMediaSignButton extends StatelessWidget {
  final SvgGenImage icon;
  final void Function() onPressed;

  const _SocialMediaSignButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
                  width: 1.r),
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(25),
              borderRadius: BorderRadius.circular(18.r),
            ),
            padding: EdgeInsets.all(19.r),
            width: 60.w,
            height: 60.h,
            child: icon.svg()));
  }
}
