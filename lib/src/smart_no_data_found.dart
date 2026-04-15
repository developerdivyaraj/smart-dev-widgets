import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// A centered empty-state widget with optional image, text, subtext, and
/// retry button.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartNoDataFound extends StatelessWidget {
  final String? text;
  final String? subText;
  final String? imagePath;
  final TextStyle? textStyle;
  final TextStyle? subTextStyle;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback? onRetry;
  final String? retryText;
  final bool isImageShow;

  const SmartNoDataFound({
    super.key,
    this.text,
    this.subText,
    this.imagePath,
    this.textStyle,
    this.subTextStyle,
    this.imageWidth,
    this.imageHeight,
    this.onRetry,
    this.retryText,
    this.isImageShow = true,
  });

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    return Center(
      child: SmartColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isImageShow) ...[
            SmartImage(
              path: imagePath ?? config.noDataFoundImagePath,
              width: imageWidth ?? 130.w,
              height: imageHeight ?? 130.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.h),
          ],
          SmartText(
            text ?? config.noDataFoundText,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
          if (subText != null) ...[
            SizedBox(height: 8.h),
            SmartText(subText!, style: subTextStyle),
          ],
          if (onRetry != null) ...[
            SizedBox(height: 16.h),
            SmartButton(
              title: retryText ?? config.noDataFoundRetryText,
              onTap: () => onRetry?.call(),
            ),
          ],
        ],
      ),
    );
  }
}
