/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Add-User.svg
  SvgGenImage get addUser => const SvgGenImage('assets/icons/Add-User.svg');

  /// File path: assets/icons/Alert.svg
  SvgGenImage get alert => const SvgGenImage('assets/icons/Alert.svg');

  /// File path: assets/icons/Component 14.svg
  SvgGenImage get component14 =>
      const SvgGenImage('assets/icons/Component 14.svg');

  /// File path: assets/icons/Component 3.svg
  SvgGenImage get component3 =>
      const SvgGenImage('assets/icons/Component 3.svg');

  /// File path: assets/icons/Component 4.svg
  SvgGenImage get component4 =>
      const SvgGenImage('assets/icons/Component 4.svg');

  /// File path: assets/icons/Failure.svg
  SvgGenImage get failure => const SvgGenImage('assets/icons/Failure.svg');

  /// File path: assets/icons/Gem - Iconly Pro.svg
  SvgGenImage get gemIconlyPro =>
      const SvgGenImage('assets/icons/Gem - Iconly Pro.svg');

  /// File path: assets/icons/Hide.svg
  SvgGenImage get hide => const SvgGenImage('assets/icons/Hide.svg');

  /// File path: assets/icons/Message.svg
  SvgGenImage get message => const SvgGenImage('assets/icons/Message.svg');

  /// File path: assets/icons/Plus - Iconly Pro.svg
  SvgGenImage get plusIconlyPro =>
      const SvgGenImage('assets/icons/Plus - Iconly Pro.svg');

  /// File path: assets/icons/Show.svg
  SvgGenImage get show => const SvgGenImage('assets/icons/Show.svg');

  /// File path: assets/icons/Unlock.svg
  SvgGenImage get unlock => const SvgGenImage('assets/icons/Unlock.svg');

  /// File path: assets/icons/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/icons/apple.svg');

  /// File path: assets/icons/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/icons/facebook.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/heart.svg
  SvgGenImage get heart => const SvgGenImage('assets/icons/heart.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    addUser,
    alert,
    component14,
    component3,
    component4,
    failure,
    gemIconlyPro,
    hide,
    message,
    plusIconlyPro,
    show,
    unlock,
    apple,
    facebook,
    google,
    heart,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/IconBg.png
  AssetGenImage get iconBg => const AssetGenImage('assets/images/IconBg.png');

  /// File path: assets/images/arrow.png
  AssetGenImage get arrow => const AssetGenImage('assets/images/arrow.png');

  /// File path: assets/images/back.jpeg
  AssetGenImage get back => const AssetGenImage('assets/images/back.jpeg');

  /// File path: assets/images/blurback.png
  AssetGenImage get blurback =>
      const AssetGenImage('assets/images/blurback.png');

  /// File path: assets/images/diamond.png
  AssetGenImage get diamond => const AssetGenImage('assets/images/diamond.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/oneheart.png
  AssetGenImage get oneheart =>
      const AssetGenImage('assets/images/oneheart.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/twoheart.png
  AssetGenImage get twoheart =>
      const AssetGenImage('assets/images/twoheart.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    iconBg,
    arrow,
    back,
    blurback,
    diamond,
    logo,
    oneheart,
    splash,
    twoheart,
  ];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/lang/en-US.json
  String get enUS => 'assets/lang/en-US.json';

  /// File path: assets/lang/tr-TR.json
  String get trTR => 'assets/lang/tr-TR.json';

  /// List of all assets
  List<String> get values => [enUS, trTR];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// File path: assets/lottie/not_found.json
  String get notFound => 'assets/lottie/not_found.json';

  /// List of all assets
  List<String> get values => [loading, notFound];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
