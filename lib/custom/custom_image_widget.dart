import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    required this.height,
    this.width = double.infinity,
  });

  String _getSecureUrl(String url) {
    return url.startsWith("http://")
        ? url.replaceFirst("http://", "https://")
        : url;
  }

  @override
  Widget build(BuildContext context) {
    final secureUrl = _getSecureUrl(imageUrl);

    return Container(
      width: width,
      height: height,
      child: Image.network(
        secureUrl,
        headers: {
          'User-Agent': 'Mozilla/5.0 (compatible; FlutterApp)',
        },
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return LottieBuilder.asset(
            "assets/lottie/not_found.json",
            width: double.infinity,
            height: double.infinity,
          );
        },
      ),
    );
  }
}
