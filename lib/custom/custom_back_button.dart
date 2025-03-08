import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsets.only(left: 24),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(25),
          border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
              width: 1),
        ),
        padding: EdgeInsets.all(10),
        child: Assets.icons.component14.svg(),
      ),
    );
  }
}
