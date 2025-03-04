import 'package:auto_route/auto_route.dart';
import 'package:test_case/constants/colors.dart';
import 'package:test_case/constants/text_styles.dart';
import 'package:test_case/core/extensions/context_extensions.dart';
import 'package:test_case/custom/custom_filled_button.dart';
import 'package:test_case/custom/custom_text_field.dart';
import 'package:test_case/custom/password_text_field.dart';
import 'package:test_case/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_notifier.dart';

final formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

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
    final double height = context.screenHeight;
    return Scaffold(body: Container());
  }
}
