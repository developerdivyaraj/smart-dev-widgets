import 'package:flutter_test/flutter_test.dart';
import 'package:smart_dev_widgets/src/smart_enums.dart';

void main() {
  group('ImageTypeExtension Tests', () {
    test('local files with extension', () {
      expect('assets/icon.svg'.imageType, ImageType.svg);
      expect('assets/anim.json'.imageType, ImageType.lottieAsset);
      expect('assets/image.png'.imageType, ImageType.asset);
    });

    test('network urls without queries', () {
      expect('https://example.com/logo.svg'.imageType, ImageType.svg);
      expect('https://example.com/anim.json'.imageType, ImageType.lottieAsset);
      expect('https://example.com/photo.png'.imageType, ImageType.network);
    });

    test('network urls with query parameters', () {
      expect('https://cdn.shopify.com/s/files/collections/smiggle.svg?v=1780656675'.imageType, ImageType.svg);
      expect('https://example.com/anim.json?version=2.0'.imageType, ImageType.lottieAsset);
      expect('https://example.com/photo.png?w=500&h=500'.imageType, ImageType.network);
    });

    test('network urls with fragment/hash', () {
      expect('https://example.com/logo.svg#icon'.imageType, ImageType.svg);
      expect('https://example.com/anim.json#loop'.imageType, ImageType.lottieAsset);
      expect('https://example.com/photo.png#header'.imageType, ImageType.network);
    });

    test('isSvgUrl tests', () {
      expect('https://cdn.shopify.com/s/files/collections/smiggle.svg?v=1780656675'.isSvgUrl, isTrue);
      expect('https://example.com/logo.svg'.isSvgUrl, isTrue);
      expect('https://example.com/photo.png?v=123'.isSvgUrl, isFalse);
      expect('assets/icon.svg'.isSvgUrl, isTrue);
      expect(''.isSvgUrl, isFalse);
    });
  });
}
