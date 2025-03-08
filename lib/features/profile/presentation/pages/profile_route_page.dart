import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class ProfileRoutePage extends StatelessWidget {
  const ProfileRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
