import 'dart:io';

/// Represents the type of image source.
enum ImageType { svg, lottieAsset, asset, file, network }

/// Represents the type of loading animation shown while a network image loads.
enum LoadingAnimationType { shimmer, pulse, skeleton, wave }

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (toLowerCase().endsWith('.svg')) return ImageType.svg;
    if (toLowerCase().endsWith('.json')) return ImageType.lottieAsset;
    if (startsWith('http://') || startsWith('https://'))
      return ImageType.network;
    if (File(this).existsSync()) return ImageType.file;
    return ImageType.asset;
  }

  bool get isSvgUrl => toLowerCase().endsWith('.svg');
}
