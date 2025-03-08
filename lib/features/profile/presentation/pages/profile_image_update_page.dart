import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_case/custom/custom_app_bar.dart';
import 'package:test_case/custom/custom_filled_button.dart';
import 'package:test_case/features/profile/presentation/providers/profile_image_update_provider.dart';
import 'package:test_case/features/profile/presentation/providers/profile_provider.dart';
import 'package:test_case/gen/assets.gen.dart';
import 'package:test_case/router/router.dart';

import '../../../../common/loading_overlay.dart';

@RoutePage()

//consumer widget
class ProfileImageUpdatePage extends ConsumerWidget {
  final bool isSetupAccount;

  const ProfileImageUpdatePage({
    @PathParam('isSetupAccount') required this.isSetupAccount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileImageUpdateProvider);
    ref.listen(profileImageUpdateProvider.select((value) => value.isLoading),
        (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide();
      }
    });
    return Scaffold(
      appBar: CustomAppBar(
        title: 'profile_image_update'.tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('profile_image_update'.tr()),
            SizedBox(height: 8.h),
            Text('profile_image_update_description'.tr()),
            SizedBox(height: 47.h),
            _AddImage(),
            SizedBox(height: 16.h),
            _InfoWidge(),
            Spacer(),
            if (isSetupAccount || state.profileImageUrl == null)
              _ContinueButton(
                isSetupAccount: isSetupAccount,
              )
          ],
        ),
      ),
    );
  }
}

class _InfoWidge extends ConsumerWidget {
  const _InfoWidge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileImageUpdateProvider);
    return state.failure.fold(
      () => state.profileImageUrl != null
          ? Text(
              'profile_image_updated'.tr(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : const SizedBox.shrink(),
      (failure) {
        return Text(
          failure.toString(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}

class _AddImage extends ConsumerWidget {
  const _AddImage({Key? key}) : super(key: key);

  Future<ImageSource?> _showImageSourceBottomSheet(BuildContext context) async {
    return showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Camera Option
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      iconSize: 40,
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.camera),
                    ),
                    const Text('Camera'),
                  ],
                ),
                // Gallery Option
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.photo_library),
                      iconSize: 40,
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.gallery),
                    ),
                    const Text('Gallery'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileImageUpdateProvider);
    return GestureDetector(
      onTap: () async {
        final source = await _showImageSourceBottomSheet(context);
        if (source != null) {
          final image = await ImagePicker().pickImage(source: source);
          if (image != null) {
            ref
                .read(profileImageUpdateProvider.notifier)
                .onProfileImagePathChanged(image.path);
          }
        }
      },
      child: Container(
        width: 169.w,
        height: 164.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(25),
          borderRadius: BorderRadius.circular(31),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(25),
            width: 1,
          ),
        ),
        child: state.profileImagePath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(31),
                child: Image.file(
                  File(state.profileImagePath!),
                  fit: BoxFit.cover,
                ),
              )
            : Assets.icons.plusIconlyPro.svg(),
      ),
    );
  }
}

class _ContinueButton extends ConsumerWidget {
  final bool isSetupAccount;

  const _ContinueButton({required this.isSetupAccount});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileImageUpdateProvider);

    return Padding(
      padding: EdgeInsets.all(26.r),
      child: CustomFilledButton(
          enabled: state.profileImagePath != null,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              state.profileImagePath != null
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary.withAlpha(25),
            ),
          ),
          onPressed: () async {
            if (state.profileImageUrl != null) {
              AutoRouter.of(context).replaceAll([HomeNavBarRoute()]);
            } else {
              await ref
                  .read(profileImageUpdateProvider.notifier)
                  .updateProfileImage(state.profileImagePath!);

              if (!isSetupAccount) {
                print('getProfile');
                ref.watch(profileProvider.notifier).getProfile();
              }
            }
          },
          child: Text(
            state.profileImageUrl != null
                ? 'continue'.tr()
                : 'upload_image'.tr(),
          )),
    );
  }
}
