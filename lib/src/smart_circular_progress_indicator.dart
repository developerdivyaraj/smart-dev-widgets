import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'smart_dev_widgets_config.dart';

/// A customizable circular progress indicator with configurable size, color,
/// stroke width, and padding. Falls back to [SmartDevWidgetsConfig] defaults.
class SmartCircularProgressIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  final double? strokeWidth;
  final EdgeInsetsGeometry? padding;

  const SmartCircularProgressIndicator({
    super.key,
    this.size,
    this.color,
    this.strokeWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    Widget indicator = SizedBox(
      height: size ?? 24.w,
      width: size ?? 24.w,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3.w,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? config.buttonActiveBackgroundColor,
        ),
      ),
    );
    if (padding != null) {
      return Padding(padding: padding!, child: indicator);
    }
    return indicator;
  }
}
