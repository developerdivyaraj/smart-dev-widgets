import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'smart_dev_widgets_config.dart';

/// A customizable checkbox with optional label, configurable colors, and a
/// `.radio` variant that renders radio-style icons instead.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartCheckbox extends StatelessWidget {
  final String? label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final TextStyle? labelStyle;
  final double? height;
  final double? width;
  final Color? activeColor;
  final Color? checkColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize? mainAxisSize;
  final double? spaceBetweenLabelAndCheckbox;
  final bool isRadio;

  const SmartCheckbox({
    super.key,
    this.label,
    required this.value,
    required this.onChanged,
    this.height,
    this.width,
    this.labelStyle,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.padding,
    this.mainAxisSize,
    this.spaceBetweenLabelAndCheckbox,
  }) : isRadio = false;

  const SmartCheckbox.radio({
    super.key,
    this.label,
    required this.value,
    required this.onChanged,
    this.height,
    this.width,
    this.labelStyle,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.padding,
    this.mainAxisSize,
    this.spaceBetweenLabelAndCheckbox,
  }) : isRadio = true;

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () => onChanged(!value),
      child: Padding(
        padding: padding ?? EdgeInsetsDirectional.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          children: [
            SizedBox(
              height: height ?? 20.w,
              width: width ?? 20.w,
              child: isRadio
                  ? Icon(
                      value
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      size: height ?? 20.w,
                      color: value
                          ? (activeColor ?? config.checkboxActiveColor)
                          : (borderColor ?? config.checkboxBorderColor),
                    )
                  : Checkbox(
                      activeColor: activeColor ?? config.checkboxActiveColor,
                      checkColor: checkColor ?? config.checkboxCheckColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      side: BorderSide(
                        color: borderColor ?? config.checkboxBorderColor,
                      ),
                      value: value,
                      onChanged: onChanged,
                    ),
            ),
            SizedBox(width: spaceBetweenLabelAndCheckbox ?? 6.w),
            if (label != null)
              Flexible(
                child: Text(label!,
                    style: labelStyle ?? config.checkboxLabelStyle),
              ),
          ],
        ),
      ),
    );
  }
}
