import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String? path; // bisa URL atau assets
  final double? width;
  final double? height;
  final BoxFit fit;
  final String fallbackAsset;

  const AppImage({
    super.key,
    this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.fallbackAsset = "assets/images/default.jpeg",
  });

  bool get _isUrl => path != null && (path!.startsWith("http") || path!.startsWith("https"));

  @override
  Widget build(BuildContext context) {
    if (path == null) {
      return Image.asset(fallbackAsset, width: width, height: height, fit: fit);
    }

    if (_isUrl) {
      return Image.network(
        path!,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: width,
            height: height,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
        errorBuilder: (_, __, ___) {
          return Image.asset(fallbackAsset, width: width, height: height, fit: fit);
        },
      );
    }

    // kalau bukan URL, anggap assets
    return Image.asset(
      path!,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) {
        return Image.asset(fallbackAsset, width: width, height: height, fit: fit);
      },
    );
  }
}
