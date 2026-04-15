import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// Internal widget that adds a subtle scale-down bounce on tap — no external
/// packages required.
class _BounceTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _BounceTap({required this.child, this.onTap});

  @override
  State<_BounceTap> createState() => _BounceTapState();
}

class _BounceTapState extends State<_BounceTap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null ? (_) => _controller.forward() : null,
      onTapUp: widget.onTap != null ? (_) => _controller.reverse() : null,
      onTapCancel: widget.onTap != null ? () => _controller.reverse() : null,
      onTap: widget.onTap,
      child: ScaleTransition(scale: _scale, child: widget.child),
    );
  }
}

/// A feature-rich button with loading state, bounce animation, prefix/suffix
/// image support, enabled/disabled/white variants, and shadow.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isLoading;
  final bool isEnabled;
  final bool isShadow;
  final double? height;
  final double? width;
  final Color? activeBackgroundColor;
  final Color? disableBackgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? titleStyle;
  final TextStyle? disableTitleStyle;
  final Color? borderColor;
  final EdgeInsetsDirectional? padding;
  final EdgeInsetsDirectional? margin;
  final String? prefixImage;
  final String? suffixImage;
  final Color? activeImageColor;
  final Color? disableImageColor;
  final double? imageSize;
  final BoxShadow? boxShadow;
  final bool isWhite;

  SmartButton({
    super.key,
    required this.onTap,
    required this.title,
    bool? isLoading,
    bool? isEnabled,
    bool? isShadow,
    this.height,
    this.width,
    this.activeBackgroundColor,
    this.disableBackgroundColor,
    this.borderRadius,
    this.titleStyle,
    this.disableTitleStyle,
    this.borderColor,
    this.padding,
    this.margin,
    this.prefixImage,
    this.suffixImage,
    this.activeImageColor,
    this.disableImageColor,
    this.imageSize,
    this.boxShadow,
    bool? isWhite,
  })  : isLoading = isLoading ?? SmartDevWidgetsConfig().buttonIsLoading,
        isEnabled = isEnabled ?? SmartDevWidgetsConfig().buttonIsEnabled,
        isShadow = isShadow ?? SmartDevWidgetsConfig().buttonIsShadow,
        isWhite = isWhite ?? SmartDevWidgetsConfig().buttonIsWhite;

  const SmartButton.white({
    super.key,
    required this.onTap,
    required this.title,
    bool? isLoading,
    bool? isEnabled,
    bool? isShadow,
    this.height,
    this.width,
    this.activeBackgroundColor,
    this.disableBackgroundColor,
    this.borderRadius,
    this.titleStyle,
    this.disableTitleStyle,
    this.borderColor,
    this.padding,
    this.margin,
    this.prefixImage,
    this.suffixImage,
    this.activeImageColor,
    this.disableImageColor,
    this.imageSize,
    this.boxShadow,
  })  : isLoading = false,
        isEnabled = true,
        isShadow = false,
        isWhite = true;

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();

    if (isLoading) {
      return SmartCircularProgressIndicator(
        padding: EdgeInsets.zero,
        size: height ?? config.buttonHeight,
      );
    }

    final effectiveBgColor = isEnabled
        ? (activeBackgroundColor ??
            (isWhite ? Colors.white : config.buttonActiveBackgroundColor))
        : (disableBackgroundColor ?? config.buttonDisableBackgroundColor);

    final effectiveTitleStyle = isEnabled
        ? config.buttonTitleStyle.merge(titleStyle)
        : config.buttonDisableTitleStyle.merge(disableTitleStyle);

    final effectiveImageColor = isEnabled
        ? (activeImageColor ??
            (isWhite
                ? config.buttonActiveBackgroundColor
                : config.buttonActiveImageColor))
        : (disableImageColor ?? config.buttonDisableImageColor);

    final hasPrefixImage = prefixImage != null && prefixImage!.isNotEmpty;
    final hasSuffixImage = suffixImage != null && suffixImage!.isNotEmpty;

    return _BounceTap(
      onTap: isEnabled && !isLoading ? onTap : null,
      child: Container(
        margin: margin ?? config.buttonMargin,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            if (isShadow)
              BoxShadow(
                color: (activeBackgroundColor ??
                        config.buttonActiveBackgroundColor)
                    .withValues(alpha: 0.9),
                blurRadius: 10.r,
                spreadRadius: -8.0,
                offset: const Offset(0.0, 8.0),
              ),
            if (boxShadow != null) boxShadow!,
          ],
          color: effectiveBgColor,
          borderRadius: borderRadius ?? config.buttonBorderRadius,
          border: borderColor != null || isWhite
              ? Border.all(
                  width: 1.w,
                  color: borderColor ?? config.buttonActiveBackgroundColor,
                )
              : null,
        ),
        height: height ?? config.buttonHeight,
        width: width ?? config.buttonWidth,
        padding: padding ?? config.buttonPadding,
        child: Center(
          child: hasPrefixImage || hasSuffixImage
              ? SmartRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (hasPrefixImage) ...[
                      SmartImage(
                        path: prefixImage!,
                        height: imageSize ?? config.buttonImageSize,
                        width: imageSize ?? config.buttonImageSize,
                        color: effectiveImageColor,
                      ),
                      SizedBox(width: 8.w),
                    ],
                    SmartText(
                      title,
                      textAlign: TextAlign.center,
                      style: effectiveTitleStyle,
                    ),
                    if (hasSuffixImage) ...[
                      SizedBox(width: 8.w),
                      SmartImage(
                        path: suffixImage!,
                        height: imageSize ?? config.buttonImageSize,
                        width: imageSize ?? config.buttonImageSize,
                        color: effectiveImageColor,
                      ),
                    ],
                  ],
                )
              : SmartText(
                  title,
                  textAlign: TextAlign.center,
                  style: effectiveTitleStyle,
                ),
        ),
      ),
    );
  }
}
