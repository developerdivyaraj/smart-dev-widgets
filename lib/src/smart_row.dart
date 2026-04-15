import 'package:flutter/material.dart';
import 'smart_dev_widgets_config.dart';

/// A flexible [Row] with built-in spacing, padding, margin, alignment,
/// tap handling, and optional [Expanded] wrapping.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartRow extends StatelessWidget {
  final List<Widget> children;
  final TextBaseline? textBaseline;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;
  final bool isInkwell;
  final Color? color;

  /// Accepts any [Decoration] (e.g. [BoxDecoration], [ShapeDecoration]).
  final Decoration? decoration;
  final bool expanded;

  /// Spacing between children — passed natively to [Row.spacing] (Flutter 3.27+).
  final double spacing;

  /// Alignment of the child within the container wrapping this row.
  final Alignment? alignment;

  SmartRow({
    super.key,
    TextBaseline? textBaseline,
    MainAxisSize? mainAxisSize,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    this.textDirection,
    VerticalDirection? verticalDirection,
    required this.children,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    this.width,
    this.height,
    this.onTap,
    bool? isInkwell,
    this.color,
    Decoration? decoration,
    this.expanded = false,
    double? spacing,
    this.alignment,
  })  : textBaseline = textBaseline ?? SmartDevWidgetsConfig().rowTextBaseline,
        mainAxisSize = mainAxisSize ?? SmartDevWidgetsConfig().rowMainAxisSize,
        mainAxisAlignment =
            mainAxisAlignment ?? SmartDevWidgetsConfig().rowMainAxisAlignment,
        crossAxisAlignment =
            crossAxisAlignment ?? SmartDevWidgetsConfig().rowCrossAxisAlignment,
        verticalDirection =
            verticalDirection ?? SmartDevWidgetsConfig().rowVerticalDirection,
        padding = padding ?? SmartDevWidgetsConfig().rowPadding,
        margin = margin ?? SmartDevWidgetsConfig().rowMargin,
        isInkwell = isInkwell ?? SmartDevWidgetsConfig().rowIsInkwell,
        decoration = decoration ?? SmartDevWidgetsConfig().rowDecoration,
        spacing = spacing ?? SmartDevWidgetsConfig().rowSpacing;

  @override
  Widget build(BuildContext context) {
    // Uses native Row.spacing (Flutter 3.27+).
    Widget child = Row(
      key: key,
      spacing: spacing,
      textBaseline: textBaseline,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children,
    );

    if (padding != null ||
        width != null ||
        height != null ||
        color != null ||
        decoration != null ||
        alignment != null ||
        margin != null) {
      child = Container(
        width: width,
        height: height,
        alignment: alignment,
        padding: padding,
        margin: margin,
        color: color,
        decoration: decoration,
        child: child,
      );
    }

    if (onTap != null) {
      child = isInkwell
          ? InkWell(onTap: onTap, child: child)
          : GestureDetector(onTap: onTap, child: child);
    }

    if (expanded) {
      child = Expanded(child: child);
    }

    return child;
  }
}
