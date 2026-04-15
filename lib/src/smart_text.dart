import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'smart_dev_widgets_config.dart';

/// An enhanced [Text] or [AutoSizeText] with color/weight overrides, optional
/// padding, tap handling, and [Expanded]/[Flexible] wrapping support.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartText extends StatelessWidget {
  final String? _text;
  final TextStyle? _style;
  final Color? color;
  final FontWeight? fontWeight;

  /// Optional padding around the text when [text] is non-empty.
  final EdgeInsetsGeometry? optionalPadding;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final bool isAutoSizeText;
  final bool expanded;
  final bool flexible;
  final int flex;

  SmartText(
    String? text, {
    super.key,
    Color? color,
    TextStyle? style,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? optionalPadding,
    TextOverflow? overflow,
    TextAlign? textAlign,
    TextDecoration? decoration,
    int? maxLines,
    bool? isAutoSizeText,
    this.onTap,
    this.expanded = false,
    this.flexible = false,
    this.flex = 1,
  })  : _text = text,
        _style = style ?? SmartDevWidgetsConfig().textStyle,
        color = color ?? SmartDevWidgetsConfig().textColor,
        fontWeight = fontWeight ?? SmartDevWidgetsConfig().textFontWeight,
        optionalPadding =
            optionalPadding ?? SmartDevWidgetsConfig().textOptionalPadding,
        overflow = overflow ?? SmartDevWidgetsConfig().textOverflow,
        textAlign = textAlign ?? SmartDevWidgetsConfig().textAlign,
        decoration = decoration ?? SmartDevWidgetsConfig().textDecoration,
        maxLines = maxLines ?? SmartDevWidgetsConfig().textMaxLines,
        isAutoSizeText =
            isAutoSizeText ?? SmartDevWidgetsConfig().textIsAutoSizeText {
    assert(!(expanded && flexible),
        'expanded and flexible cannot both be true at the same time');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? style = _style;
    Widget child;

    final mergedStyle =
        (color != null || fontWeight != null || decoration != null)
            ? style?.merge(TextStyle(
                color: color, fontWeight: fontWeight, decoration: decoration))
            : style;

    if (isAutoSizeText) {
      child = AutoSizeText(
        _text ?? '',
        style: mergedStyle,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
      );
    } else {
      child = Text(
        _text ?? '',
        style: mergedStyle,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
      );
    }

    if (_text != null && _text!.isNotEmpty && optionalPadding != null) {
      child = Padding(padding: optionalPadding!, child: child);
    }

    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }

    if (expanded) {
      child = Expanded(flex: flex, child: child);
    } else if (flexible) {
      child = Flexible(flex: flex, child: child);
    }

    return child;
  }
}
