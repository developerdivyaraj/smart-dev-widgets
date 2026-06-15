import 'dart:io';

/// Represents the type of image source.
enum ImageType { svg, lottieAsset, asset, file, network }

/// Represents the type of loading animation shown while a network image loads.
enum LoadingAnimationType { shimmer, pulse, skeleton, wave }

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (_pathEndsWith(this, '.svg')) return ImageType.svg;
    if (_pathEndsWith(this, '.json')) return ImageType.lottieAsset;
    if (startsWith('http://') || startsWith('https://')) {
      return ImageType.network;
    }
    if (File(this).existsSync()) return ImageType.file;
    return ImageType.asset;
  }

  bool get isSvgUrl => _pathEndsWith(this, '.svg');
}

bool _pathEndsWith(String value, String extension) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return false;

  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    final uri = Uri.tryParse(trimmed);
    if (uri != null) {
      return uri.path.toLowerCase().endsWith(extension);
    }
  }

  final withoutQuery = trimmed.split('?').first.split('#').first;
  return withoutQuery.toLowerCase().endsWith(extension);
}
