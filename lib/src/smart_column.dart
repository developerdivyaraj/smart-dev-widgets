import 'package:flutter/material.dart';
import 'smart_dev_widgets_config.dart';

class SmartColumn extends StatelessWidget {
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? color;
  final GestureTapCallback? onTap;
  final bool isInkwell;
  final bool expanded;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignment;
  final Clip clipBehavior;
  final double spacing;
  final bool isSafeArea;

  SmartColumn({
    super.key,
    MainAxisSize? mainAxisSize,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    this.textDirection,
    VerticalDirection? verticalDirection,
    TextBaseline? textBaseline,
    required this.children,
    EdgeInsetsGeometry? padding,
    this.width,
    this.height,
    this.onTap,
    bool? isInkwell,
    this.color,
    this.expanded = false,
    BoxDecoration? decoration,
    AlignmentGeometry? alignment,
    Clip? clipBehavior,
    double? spacing,
    EdgeInsetsGeometry? margin,
    bool? isSafeArea,
  })  : mainAxisSize = mainAxisSize ?? SmartDevWidgetsConfig().columnMainAxisSize,
        mainAxisAlignment = mainAxisAlignment ?? SmartDevWidgetsConfig().columnMainAxisAlignment,
        crossAxisAlignment = crossAxisAlignment ?? SmartDevWidgetsConfig().columnCrossAxisAlignment,
        verticalDirection = verticalDirection ?? SmartDevWidgetsConfig().columnVerticalDirection,
        textBaseline = textBaseline ?? SmartDevWidgetsConfig().columnTextBaseline,
        spacing = spacing ?? SmartDevWidgetsConfig().columnSpacing,
        padding = padding ?? SmartDevWidgetsConfig().columnPadding,
        margin = margin ?? SmartDevWidgetsConfig().columnMargin,
        isInkwell = isInkwell ?? SmartDevWidgetsConfig().columnIsInkwell,
        isSafeArea = isSafeArea ?? SmartDevWidgetsConfig().columnIsSafeArea,
        decoration = decoration ?? SmartDevWidgetsConfig().columnDecoration,
        alignment = alignment ?? SmartDevWidgetsConfig().columnAlignment,
        clipBehavior = clipBehavior ?? SmartDevWidgetsConfig().columnClipBehavior;

  @override
  Widget build(BuildContext context) {
    final spacedChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1 && spacing > 0) {
        spacedChildren.add(SizedBox(height: spacing));
      }
    }

    Widget child = Column(
      key: key,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );

    if (padding != null || width != null || height != null || color != null || decoration != null || alignment != null || margin != null) {
      child = Container(
        width: width,
        height: height,
        padding: padding,
        color: color,
        decoration: decoration,
        alignment: alignment,
        clipBehavior: clipBehavior,
        margin: margin,
        child: child,
      );
    }

    if (onTap != null) {
      child = isInkwell ? InkWell(onTap: onTap, child: child) : GestureDetector(onTap: onTap, child: child);
    }

    if (expanded) {
      child = Expanded(child: child);
    }

    if (isSafeArea) {
      return SafeArea(child: child);
    } else {
      return child;
    }
  }
}
