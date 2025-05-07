import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

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

  SmartButton.white({
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
  })  : isLoading = isLoading ?? SmartDevWidgetsConfig().buttonIsLoading,
        isEnabled = isEnabled ?? SmartDevWidgetsConfig().buttonIsEnabled,
        isShadow = isShadow ?? SmartDevWidgetsConfig().buttonIsShadow,
        isWhite = true;

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    return isLoading
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              isWhite ? config.buttonActiveBackgroundColor : Colors.white,
            ),
            strokeWidth: 4.w,
          )
        : GestureDetector(
            onTap: isEnabled && !isLoading ? onTap : null,
            child: Container(
              margin: margin ?? config.buttonMargin,
              decoration: BoxDecoration(
                boxShadow: [
                  if (isShadow)
                    BoxShadow(
                      color: (activeBackgroundColor ?? config.buttonActiveBackgroundColor).withValues(alpha: 0.9),
                      blurRadius: 10.r,
                      spreadRadius: -8.0,
                      offset: const Offset(0.0, 8.0),
                    ),
                  if (boxShadow != null) boxShadow!,
                ],
                color: isEnabled
                    ? (activeBackgroundColor ?? (isWhite ? Colors.white : config.buttonActiveBackgroundColor))
                    : (disableBackgroundColor ?? config.buttonDisableBackgroundColor),
                borderRadius: borderRadius ?? config.buttonBorderRadius,
                border: borderColor != null || isWhite
                    ? Border.all(
                        width: 1.w,
                        color: borderColor ?? (isWhite ? config.buttonActiveBackgroundColor : config.buttonActiveBackgroundColor),
                      )
                    : null,
              ),
              height: height ?? config.buttonHeight,
              width: width ?? config.buttonWidth,
              padding: padding ?? config.buttonPadding,
              child: (prefixImage != null && prefixImage!.isNotEmpty) || (suffixImage != null && suffixImage!.isNotEmpty)
                  ? Center(
                      child: SmartRow(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (prefixImage != null && prefixImage!.isNotEmpty) ...[
                            Image.asset(
                              prefixImage!,
                              height: imageSize ?? config.buttonImageSize,
                              width: imageSize ?? config.buttonImageSize,
                              color: isEnabled
                                  ? (activeImageColor ?? (isWhite ? config.buttonActiveBackgroundColor : config.buttonActiveImageColor))
                                  : (disableImageColor ?? config.buttonDisableImageColor),
                            ),
                            SizedBox(width: 8.w),
                          ],
                          SmartText(
                            title,
                            textAlign: TextAlign.center,
                            style: isEnabled
                                ? (isWhite ? config.buttonTitleStyle : config.buttonTitleStyle).merge(titleStyle)
                                : config.buttonDisableTitleStyle.merge(disableTitleStyle),
                          ),
                          if (suffixImage != null && suffixImage!.isNotEmpty) ...[
                            SizedBox(width: 8.w),
                            Image.asset(
                              suffixImage!,
                              height: imageSize ?? config.buttonImageSize,
                              width: imageSize ?? config.buttonImageSize,
                              color: isEnabled
                                  ? (activeImageColor ?? (isWhite ? config.buttonActiveBackgroundColor : config.buttonActiveImageColor))
                                  : (disableImageColor ?? config.buttonDisableImageColor),
                            ),
                          ],
                        ],
                      ),
                    )
                  : Center(
                      child: SmartText(
                        title,
                        textAlign: TextAlign.center,
                        style: isEnabled
                            ? (isWhite ? config.buttonTitleStyle : config.buttonTitleStyle).merge(titleStyle)
                            : config.buttonDisableTitleStyle.merge(disableTitleStyle),
                      ),
                    ),
            ),
          );
  }
}
