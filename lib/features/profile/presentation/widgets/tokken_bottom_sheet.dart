import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:test_case/constants/colors.dart';
import 'package:test_case/custom/custom_filled_button.dart';

import '../../../../constants/dummy_data.dart';
import '../../domain/models/bonus.dart';
import '../../domain/models/token_package.dart';

class TokenBottomSheet extends StatelessWidget {
  const TokenBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Positioned(
                top: 0, child: Image.asset("assets/images/blurback.png")),
            Positioned(
                bottom: 0,
                child: Transform.rotate(
                    angle: 3.14,
                    child: Image.asset("assets/images/blurback.png"))),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                const _HeaderText(),
                const SizedBox(height: 16),
                _BonusSection(),
                const SizedBox(height: 21),
                Text("unlock_token_pack".tr(),
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 16),
                _TokenPackages(),
                _ViewAllButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Header Section
class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("limited_offer".tr(),
            style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        Padding(
          padding:
              const EdgeInsets.only(top: 4, left: 80, right: 80, bottom: 12),
          child: Text(
            "limited_offer_description".tr(),
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// Bonus Section (Dynamic)
class _BonusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 22, left: 22, right: 22, bottom: 14),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        gradient: RadialGradient(
          colors: [
            Theme.of(context)
                .colorScheme
                .onPrimary
                .withAlpha(25), // 10% Opacity
            Theme.of(context).colorScheme.onPrimary.withAlpha(7), // 3% Opacity
          ],
          stops: [0.0, 1.0], // Start at the center and fade out
          radius: 0.8, // Adjust radius for size of the gradient
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(25),
            width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("bonus".tr(), style: Theme.of(context).textTheme.displayLarge),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                bonusList.map((bonus) => _BonusItem(bonus: bonus)).toList(),
          ),
        ],
      ),
    );
  }
}

// Single Bonus Item
class _BonusItem extends StatelessWidget {
  final Bonus bonus;

  const _BonusItem({required this.bonus});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InnerShadow(
          blur: 5,
          offset: const Offset(0, 0),
          color: AppColors.white,
          child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF6F060B)),
              child: Image.asset(bonus.iconPath, width: 36, height: 36)),
        ),

        // Load dynamic images
        SizedBox(height: 12),
        SizedBox(
          width: 70,
          child: Text(
            textAlign: TextAlign.center,
            bonus.title,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}

class _TokenPackages extends StatelessWidget {
  const _TokenPackages();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tokenPackages.length,
          (index) => _TokenPackageItem(package: tokenPackages[index]),
        ),
      ),
    );
  }
}

// Token Package Item (Dynamic)
class _TokenPackageItem extends StatelessWidget {
  final TokenPackage package;

  const _TokenPackageItem({required this.package});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          InnerShadow(
            blur: 5,
            offset: const Offset(0, 0),
            color: AppColors.white,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15, left: 8, right: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [package.color, AppColors.brandColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 56,
                  ),
                  Text(
                    package.oldAmount,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    package.newAmount,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "token".tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Divider(
                    color: AppColors.white.withAlpha(25),
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    package.price,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text("per_week".tr(),
                      style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: InnerShadow(
                  blur: 5,
                  offset: const Offset(0, 0),
                  color: AppColors.white,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 3.5,
                      bottom: 3.5,
                    ),
                    child: Text(package.bonus,
                        style: TextStyle(color: AppColors.white, fontSize: 16)),
                    decoration: BoxDecoration(
                      color: package.color,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ))),
        ],
      ),
    );
  }
}

// "View All Tokens" Button
class _ViewAllButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomFilledButton(
          onPressed: () {},
          child: Text("view_all".tr(),
              style: Theme.of(context).textTheme.displayLarge)),
    );
  }
}
