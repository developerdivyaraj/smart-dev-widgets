import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'smart_dev_widgets_config.dart';
import 'smart_enums.dart';
import 'smart_column.dart';

/// A robust image viewer supporting assets, files, network images, SVGs,
/// and Lottie JSON animations — with cached network loading, configurable
/// animated placeholders (shimmer / pulse / skeleton / wave), and error
/// fallback handling.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;

  /// Convenience shortcut: sets both [height] and [width] to the same value.
  final double? size;
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

  /// Clip behavior for the outer container.
  final Clip clipBehavior;

  /// Full custom [Decoration] — takes precedence over the default
  /// [BoxDecoration] built from [imageBorderRadius], [border], etc.
  final Decoration? decoration;

  /// Alignment of the child within the outer container.
  final AlignmentGeometry? alignment;

  /// Which loading animation to show for network images.
  final LoadingAnimationType animationType;

  /// Whether to show an animated placeholder (true) or a simple static one (false).
  final bool showLoadingAnimation;

  SmartImage({
    super.key,
    required this.path,
    double? height,
    double? width,
    this.size,
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
    this.clipBehavior = Clip.none,
    this.decoration,
    this.alignment,
    LoadingAnimationType? animationType,
    bool? showLoadingAnimation,
  })  : height = height ?? SmartDevWidgetsConfig().imageHeight,
        width = width ?? SmartDevWidgetsConfig().imageWidth,
        fit = fit ?? SmartDevWidgetsConfig().imageFit,
        imageBorderRadius =
            imageBorderRadius ?? SmartDevWidgetsConfig().imageBorderRadius,
        backgroundColor =
            backgroundColor ?? SmartDevWidgetsConfig().imageBackgroundColor,
        padding = padding ?? SmartDevWidgetsConfig().imagePadding,
        margin = margin ?? SmartDevWidgetsConfig().imageMargin,
        inkwellBorderRadius = inkwellBorderRadius ??
            SmartDevWidgetsConfig().imageInkwellBorderRadius,
        border = border ?? SmartDevWidgetsConfig().imageBorder,
        isMemCacheEnabled =
            isMemCacheEnabled ?? SmartDevWidgetsConfig().imageIsMemCacheEnabled,
        matchTextDirection = matchTextDirection ??
            SmartDevWidgetsConfig().imageMatchTextDirection,
        shape = shape ?? SmartDevWidgetsConfig().imageShape,
        animationType =
            animationType ?? SmartDevWidgetsConfig().imageLoadingAnimationType,
        showLoadingAnimation = showLoadingAnimation ??
            SmartDevWidgetsConfig().imageShowLoadingAnimation;

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    final double? finalHeight = size ?? height;
    final double? finalWidth = size ?? width;
    String? placeholderImage = config.imagePlaceholderPath;

    final defaultDecoration = BoxDecoration(
      borderRadius: imageBorderRadius,
      border: border,
      color: backgroundColor,
      shape: shape,
    );

    Widget? child;

    // Empty / invalid path → show placeholder
    if (path.isEmpty || !path.contains('/')) {
      child = Container(
        height: finalHeight,
        width: finalWidth,
        padding: padding,
        margin: margin,
        clipBehavior: Clip.hardEdge,
        decoration: decoration ?? defaultDecoration,
        child: Image.asset(
          placeholderImage ?? 'assets/images/placeholder.png',
          height: finalHeight,
          width: finalWidth,
          fit: BoxFit.contain,
          matchTextDirection: matchTextDirection,
          color: color,
        ),
      );
    }

    if (child == null) {
      switch (path.imageType) {
        case ImageType.svg:
          child = path.startsWith('http')
              ? SvgPicture.network(
                  path,
                  width: finalWidth,
                  height: finalHeight,
                  fit: fit ?? BoxFit.contain,
                  colorFilter: color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
                  matchTextDirection: matchTextDirection,
                )
              : SvgPicture.asset(
                  path,
                  width: finalWidth,
                  height: finalHeight,
                  fit: fit ?? BoxFit.contain,
                  colorFilter: color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
                  matchTextDirection: matchTextDirection,
                );
          break;

        case ImageType.lottieAsset:
          child = Lottie.asset(
            path,
            width: finalWidth,
            height: finalHeight,
            fit: fit ?? BoxFit.contain,
          );
          break;

        case ImageType.asset:
          child = Image.asset(
            path,
            height: finalHeight,
            width: finalWidth,
            fit: fit ?? BoxFit.cover,
            matchTextDirection: matchTextDirection,
            color: color,
          );
          break;

        case ImageType.file:
          child = Image.file(
            File(path),
            height: finalHeight,
            width: finalWidth,
            fit: fit ?? BoxFit.cover,
            matchTextDirection: matchTextDirection,
            color: color,
          );
          break;

        case ImageType.network:
          child = path.isSvgUrl
              ? SvgPicture.network(path, width: finalWidth, height: finalHeight)
              : CachedNetworkImage(
                  matchTextDirection: matchTextDirection,
                  height: finalHeight,
                  width: finalWidth,
                  fit: fit,
                  errorListener: kDebugMode
                      ? (error) => debugPrint(
                          '❌ Error in CachedNetworkImage: $path, error: $error')
                      : null,
                  errorWidget: (context, url, error) => Image.asset(
                    placeholderImage ?? 'assets/images/placeholder.png',
                    height: finalHeight,
                    width: finalWidth,
                    fit: BoxFit.contain,
                    matchTextDirection: matchTextDirection,
                  ),
                  placeholder: (context, url) => showLoadingAnimation
                      ? _buildAnimatedPlaceholder(
                          context, finalHeight, finalWidth)
                      : _buildSimplePlaceholder(
                          context, finalHeight, finalWidth),
                  imageUrl: path,
                  fadeInDuration: const Duration(milliseconds: 400),
                  fadeOutDuration: const Duration(milliseconds: 200),
                );
          break;
      }
    }

    // Wrap in Container when any layout / decoration props are set
    if (finalHeight != null ||
        finalWidth != null ||
        padding != null ||
        margin != null ||
        decoration != null ||
        alignment != null ||
        border != null ||
        imageBorderRadius != null) {
      child = Container(
        height: finalHeight,
        width: finalWidth,
        padding: padding,
        margin: margin,
        clipBehavior: clipBehavior,
        alignment: alignment,
        decoration: decoration ??
            BoxDecoration(borderRadius: imageBorderRadius, border: border),
        child: child,
      );
    }

    // child is guaranteed non-null at this point via flow analysis.
    return onTap != null
        ? InkWell(onTap: onTap, borderRadius: inkwellBorderRadius, child: child)
        : child;
  }

  // ---------------------------------------------------------------------------
  // Loading placeholders
  // ---------------------------------------------------------------------------

  Widget _buildAnimatedPlaceholder(BuildContext context, double? h, double? w) {
    final br = imageBorderRadius is BorderRadius
        ? imageBorderRadius as BorderRadius
        : BorderRadius.circular(12);

    switch (animationType) {
      case LoadingAnimationType.shimmer:
        return _shimmer(h, w, br);
      case LoadingAnimationType.pulse:
        return _pulse(h, w, br);
      case LoadingAnimationType.skeleton:
        return _skeleton(h, w, br);
      case LoadingAnimationType.wave:
        return _wave(h, w, br);
    }
  }

  Widget _buildSimplePlaceholder(BuildContext context, double? h, double? w) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: imageBorderRadius ?? BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(Icons.image_outlined,
            size: (h ?? w ?? 80) * 0.3, color: Colors.grey[400]),
      ),
    );
  }

  Widget _shimmer(double? h, double? w, BorderRadiusGeometry br) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 1500),
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(color: Colors.white, borderRadius: br),
        child: Center(
          child: Icon(Icons.image_outlined,
              size: (h ?? w ?? 80) * 0.3, color: Colors.grey[400]),
        ),
      ),
    );
  }

  Widget _pulse(double? h, double? w, BorderRadiusGeometry br) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.3, end: 1.0),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return AnimatedOpacity(
          opacity: value,
          duration: const Duration(milliseconds: 800),
          child: Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              color: Colors.grey[200]?.withValues(alpha: value),
              borderRadius: br,
            ),
            child: Center(
              child: Icon(
                Icons.image_outlined,
                size: (h ?? w ?? 80) * 0.25,
                color: Colors.grey[400]?.withValues(alpha: value),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _skeleton(double? h, double? w, BorderRadiusGeometry br) {
    return SmartColumn(
      height: h,
      width: w,
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: br),
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 8,
                  width: w != null ? w * 0.6 : 100,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _wave(double? h, double? w, BorderRadiusGeometry br) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1200),
      builder: (context, value, child) {
        return Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            borderRadius: br,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                (value - 0.3).clamp(0.0, 1.0),
                value,
                (value + 0.3).clamp(0.0, 1.0)
              ],
              colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
            ),
          ),
          child: Center(
            child: Icon(Icons.image_search_outlined,
                size: (h ?? w ?? 80) * 0.3, color: Colors.grey[400]),
          ),
        );
      },
    );
  }
}
