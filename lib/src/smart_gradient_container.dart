import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A thin gradient line (typically used as a decorative divider) that fades
/// from transparent → solid → transparent.
///
/// Fully configurable via constructor parameters.
class SmartGradientContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color color;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color>? colors;
  final EdgeInsetsGeometry? margin;

  const SmartGradientContainer({
    super.key,
    this.height,
    this.width,
    this.color = Colors.grey,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.colors,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 2.h,
      width: width ?? MediaQuery.of(context).size.width,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.clamp,
          colors: colors ??
              [
                color.withValues(alpha: 0),
                color,
                color.withValues(alpha: 0),
              ],
          begin: begin,
          end: end,
        ),
      ),
    );
  }
}
