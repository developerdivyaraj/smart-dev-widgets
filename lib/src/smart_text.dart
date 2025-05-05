import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'smart_dev_widgets_config.dart';

class SmartText extends StatelessWidget {
  final String? _text;
  final TextStyle? _style;
  final Color? color;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? optionalPaddings; // Declaration (plural)
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final bool isAutoSizeText;
  final bool isExpanded;
  final bool isFlexible;
  final int flex;

  SmartText(
    String? text, {
    super.key,
    Color? color,
    TextStyle? style,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? optionalPaddings, // Fixed to plural
    TextOverflow? overflow,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    int? maxLines,
    bool? isAutoSizeText,
    this.onTap,
    this.isExpanded = false,
    this.isFlexible = false,
    this.flex = 1,
  })  : _text = text,
        _style = style ?? SmartDevWidgetsConfig().textStyle,
        color = color ?? SmartDevWidgetsConfig().textColor,
        fontWeight = fontWeight ?? SmartDevWidgetsConfig().textFontWeight,
        optionalPaddings = optionalPaddings ?? SmartDevWidgetsConfig().textOptionalPaddings,
        // Fixed to plural
        overflow = overflow ?? SmartDevWidgetsConfig().textOverflow,
        textAlign = textAlign ?? SmartDevWidgetsConfig().textAlign,
        textDecoration = textDecoration ?? SmartDevWidgetsConfig().textDecoration,
        maxLines = maxLines ?? SmartDevWidgetsConfig().textMaxLines,
        isAutoSizeText = isAutoSizeText ?? SmartDevWidgetsConfig().textIsAutoSizeText {
    assert(!(isExpanded && isFlexible), 'isExpanded and isFlexible cannot be true at the same time');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? style = _style;
    Widget child;
    if (isAutoSizeText) {
      child = AutoSizeText(
        _text ?? '',
        style: (color != null || fontWeight != null || textDecoration != null)
            ? style?.merge(TextStyle(
                color: color,
                fontWeight: fontWeight,
                decoration: textDecoration,
              ))
            : style,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
      );
    } else {
      child = Text(
        _text ?? '',
        style: (color != null || fontWeight != null || textDecoration != null)
            ? style?.merge(TextStyle(
                color: color,
                fontWeight: fontWeight,
                decoration: textDecoration,
              ))
            : style,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
      );
    }

    if (_text != null && _text!.isNotEmpty && optionalPaddings != null) {
      child = Padding(padding: optionalPaddings!, child: child);
    }
    if (onTap != null) {
      child = GestureDetector(
        onTap: onTap,
        child: child,
      );
    }

    if (isExpanded) {
      child = Expanded(
        flex: flex,
        child: child,
      );
    } else if (isFlexible) {
      child = Flexible(
        flex: flex,
        child: child,
      );
    }
    return child;
  }
}
