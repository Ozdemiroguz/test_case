import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialMediaSign extends ConsumerWidget {
  const SocialMediaSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('Or sign in with'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.facebook),
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.g_translate),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
