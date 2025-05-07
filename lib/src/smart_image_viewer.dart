import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'smart_dev_widgets_config.dart';

enum ImageType { svg, asset, file, network }

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (toLowerCase().endsWith('.svg')) return ImageType.svg;
    if (startsWith('http://') || startsWith('https://')) return ImageType.network;
    if (File(this).existsSync()) return ImageType.file;
    return ImageType.asset;
  }

  bool get isSvgUrl {
    return toLowerCase().endsWith('.svg');
  }
}

class SmartImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadiusGeometry? imageBorderRadius;
  final Color? color;
  final Color? backgroundColor;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? inkwellBorderRadius;
  final BoxBorder? border;
  final bool isMemCacheEnabled;
  final bool matchTextDirection;
  final BoxShape shape;

  SmartImage({
    super.key,
    required this.path,
    double? height,
    double? width,
    BoxFit? fit,
    BorderRadiusGeometry? imageBorderRadius,
    this.color,
    Color? backgroundColor,
    this.onTap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? inkwellBorderRadius,
    BoxBorder? border,
    bool? isMemCacheEnabled,
    bool? matchTextDirection,
    BoxShape? shape,
  })  : height = height ?? SmartDevWidgetsConfig().imageHeight,
        width = width ?? SmartDevWidgetsConfig().imageWidth,
        fit = fit ?? SmartDevWidgetsConfig().imageFit,
        imageBorderRadius = imageBorderRadius ?? SmartDevWidgetsConfig().imageBorderRadius,
        backgroundColor = backgroundColor ?? SmartDevWidgetsConfig().imageBackgroundColor,
        padding = padding ?? SmartDevWidgetsConfig().imagePadding,
        margin = margin ?? SmartDevWidgetsConfig().imageMargin,
        inkwellBorderRadius = inkwellBorderRadius ?? SmartDevWidgetsConfig().imageInkwellBorderRadius,
        border = border ?? SmartDevWidgetsConfig().imageBorder,
        isMemCacheEnabled = isMemCacheEnabled ?? SmartDevWidgetsConfig().imageIsMemCacheEnabled,
        matchTextDirection = matchTextDirection ?? SmartDevWidgetsConfig().imageMatchTextDirection,
        shape = shape ?? SmartDevWidgetsConfig().imageShape;

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    final ValueNotifier<bool> isError = ValueNotifier<bool>(false);
    String? placeholderImage = config.imagePlaceholderPath;

    Widget? child;
    if (path.isEmpty) {
      child = Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: imageBorderRadius,
          border: border,
          color: backgroundColor,
          shape: shape,
        ),
        child: Image.asset(
          placeholderImage ?? 'assets/images/placeholder.png',
          height: height,
          width: width,
          fit: fit,
          matchTextDirection: matchTextDirection,
          color: color,
        ),
      );
    }

    if (child == null) {
      switch (path.imageType) {
        case ImageType.svg:
          child = Container(
            height: height,
            width: width,
            padding: padding,
            margin: margin,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: imageBorderRadius,
              border: border,
              color: backgroundColor,
              shape: shape,
            ),
            child: path.startsWith('http')
                ? SvgPicture.network(
                    path,
                    width: width,
                    height: height,
                    fit: fit ?? BoxFit.contain,
                    colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
                    matchTextDirection: matchTextDirection,
                  )
                : SvgPicture.asset(
                    path,
                    width: width,
                    height: height,
                    fit: fit ?? BoxFit.contain,
                    colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
                    matchTextDirection: matchTextDirection,
                  ),
          );
          break;
        case ImageType.asset:
          child = Container(
            height: height,
            width: width,
            padding: padding,
            margin: margin,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: imageBorderRadius,
              border: border,
              color: backgroundColor,
              shape: shape,
            ),
            child: Image.asset(
              path,
              height: height,
              width: width,
              fit: fit,
              matchTextDirection: matchTextDirection,
              color: color,
            ),
          );
          break;
        case ImageType.file:
          child = Container(
            height: height,
            width: width,
            padding: padding,
            margin: margin,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: imageBorderRadius,
              border: border,
              color: backgroundColor,
              shape: shape,
            ),
            child: Image.file(
              File(path),
              height: height,
              width: width,
              fit: fit,
              matchTextDirection: matchTextDirection,
              color: color,
            ),
          );
          break;
        case ImageType.network:
          child = Container(
            height: height,
            width: width,
            padding: padding,
            margin: margin,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: imageBorderRadius,
              border: border,
              color: backgroundColor,
              shape: shape,
            ),
            child: ValueListenableBuilder(
              valueListenable: isError,
              builder: (context, value, child) {
                if (value) {
                  return Image.asset(
                    placeholderImage ?? 'assets/images/placeholder.png',
                    height: height,
                    width: width,
                    fit: fit,
                    matchTextDirection: matchTextDirection,
                    color: color,
                  );
                } else {
                  return CachedNetworkImage(
                    matchTextDirection: matchTextDirection,
                    memCacheWidth: isMemCacheEnabled && height?.isFinite == true ? height!.toInt() : null,
                    memCacheHeight: isMemCacheEnabled && width?.isFinite == true ? width!.toInt() : null,
                    height: height,
                    width: width,
                    fit: fit,
                    errorListener: (error) {
                      isError.value = true;
                      if (kDebugMode) {
                        debugPrint("❌ Error in CachedNetworkImage: $path, error: $error");
                      }
                    },
                    errorWidget: (context, url, error) => Image.asset(
                      placeholderImage ?? 'assets/images/placeholder.png',
                      height: height,
                      width: width,
                      fit: fit,
                      matchTextDirection: matchTextDirection,
                      color: color,
                    ),
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: height ?? 50.w,
                        width: width ?? 50.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.w,
                          color: config.imageLoadingColor,
                        ),
                      ),
                    ),
                    imageUrl: path,
                  );
                }
              },
            ),
          );
          break;
      }
    }

    return onTap != null ? InkWell(onTap: onTap, borderRadius: inkwellBorderRadius, child: child) : child;
  }
}
