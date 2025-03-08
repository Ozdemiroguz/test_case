import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../router/router.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String id;
  final String imageUrl;
  final bool isProfile;
  final VoidCallback? onTap;
  final VoidCallback? buttonAction;

  const ProfileHeader({
    required this.name,
    required this.id,
    required this.imageUrl,
    this.isProfile = true,
    this.onTap,
    this.buttonAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isProfile
          ? onTap ??
              () => AutoRouter.of(context).push(const DetailedProfileRoute())
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          children: [
            if (imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 61,
                  height: 61,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                width: 61,
                height: 61,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Colors.white),
              ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: isProfile ? 200 : 120,
                    child: Text(name, style: const TextStyle(fontSize: 20))),
                SizedBox(
                  width: isProfile ? 200 : 120,
                  child: Text('ID: $id',
                      style: TextStyle(
                          color: Colors.grey, overflow: TextOverflow.ellipsis)),
                ),
              ],
            ),
            Spacer(),
            isProfile
                ? Icon(Icons.arrow_forward_ios, size: 32, color: Colors.grey)
                : GestureDetector(
                    onTap: buttonAction,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'add_photo'.tr(),
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
