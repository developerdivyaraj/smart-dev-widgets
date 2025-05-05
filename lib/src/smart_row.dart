import 'package:flutter/material.dart';
import 'smart_dev_widgets_config.dart';

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
  final BoxDecoration? decoration; // Changed to BoxDecoration for consistency
  final bool expanded;

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
    BoxDecoration? decoration,
    this.expanded = false,
  })  : textBaseline = textBaseline ?? SmartDevWidgetsConfig().rowTextBaseline,
        mainAxisSize = mainAxisSize ?? SmartDevWidgetsConfig().rowMainAxisSize,
        mainAxisAlignment = mainAxisAlignment ?? SmartDevWidgetsConfig().rowMainAxisAlignment,
        crossAxisAlignment = crossAxisAlignment ?? SmartDevWidgetsConfig().rowCrossAxisAlignment,
        verticalDirection = verticalDirection ?? SmartDevWidgetsConfig().rowVerticalDirection,
        padding = padding ?? SmartDevWidgetsConfig().rowPadding,
        margin = margin ?? SmartDevWidgetsConfig().rowMargin,
        isInkwell = isInkwell ?? SmartDevWidgetsConfig().rowIsInkwell,
        decoration = decoration ?? SmartDevWidgetsConfig().rowDecoration;

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      key: key,
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
        decoration != null) {
      child = Container(
        width: width,
        height: height,
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