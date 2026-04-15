import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'smart_dev_widgets_config.dart';

/// A customizable radio button with optional label, toggle support, and
/// configurable styling.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartRadioButton<T> extends StatelessWidget {
  final String? label;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final TextStyle? textStyle;
  final Color? activeColor;
  final Color? inactiveColor;
  final EdgeInsetsGeometry? padding;
  final Widget? textLabel;
  final bool isToggle;
  final FocusNode? focusNode;
  final double? size;

  const SmartRadioButton({
    super.key,
    this.label,
    this.groupValue,
    required this.value,
    required this.onChanged,
    this.textStyle,
    this.activeColor,
    this.inactiveColor,
    this.padding,
    this.textLabel,
    this.isToggle = false,
    this.focusNode,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    bool isSelected = groupValue == value;
    return GestureDetector(
      onTap: () {
        if (isToggle && groupValue == value) {
          onChanged(null);
        } else {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: size ?? 24.w,
              color: isSelected
                  ? (activeColor ?? config.radioButtonActiveColor)
                  : (inactiveColor ?? config.radioButtonInactiveColor),
            ),
            if (label != null) SizedBox(width: 4.w),
            if (textLabel != null)
              textLabel!
            else if (label != null)
              Text(label!, style: textStyle ?? config.radioButtonTextStyle),
          ],
        ),
      ),
    );
  }
}
