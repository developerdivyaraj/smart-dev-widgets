import 'package:flutter/material.dart';

/// A dashed (or dotted) line divider supporting both horizontal and vertical
/// orientations with configurable dash width, spacing, stroke, and color.
class SmartDashedDivider extends StatelessWidget {
  final Axis axis;
  final Color color;
  final double dashSpace;
  final double dashWidth;
  final double strokeWidth;

  /// Length of the divider (width for horizontal, height for vertical).
  /// Defaults to `double.infinity`.
  final double? length;

  const SmartDashedDivider({
    super.key,
    this.axis = Axis.horizontal,
    this.color = Colors.grey,
    this.dashSpace = 3.0,
    this.dashWidth = 3.0,
    this.strokeWidth = 1,
    this.length,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: axis == Axis.horizontal
          ? length ?? MediaQuery.of(context).size.width
          : strokeWidth,
      height: axis == Axis.vertical
          ? length ?? MediaQuery.of(context).size.height
          : strokeWidth,
      child: CustomPaint(
        painter: _DashedLinePainter(
          axis: axis,
          color: color,
          dashSpace: dashSpace,
          dashWidth: dashWidth,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Axis axis;
  final Color color;
  final double dashSpace;
  final double dashWidth;
  final double strokeWidth;

  _DashedLinePainter({
    required this.axis,
    required this.color,
    required this.dashSpace,
    required this.dashWidth,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    if (axis == Axis.vertical) {
      double startY = 0;
      while (startY < size.height) {
        canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashWidth),
          paint,
        );
        startY += dashWidth + dashSpace;
      }
    } else {
      double startX = 0;
      while (startX < size.width) {
        canvas.drawLine(
          Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2),
          paint,
        );
        startX += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) => false;
}
