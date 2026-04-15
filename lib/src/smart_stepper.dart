import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'smart_dev_widgets_config.dart';

/// Data model for a single step in [SmartStepper].
class SmartStep {
  final Widget title;
  final String? subtitle;
  final Widget content;
  final TextStyle? titleStyle;

  SmartStep({
    required this.title,
    this.subtitle,
    required this.content,
    this.titleStyle,
  });
}

/// A vertical timeline-style stepper with animated item insertion, active /
/// completed / upcoming states, dashed or solid connecting lines, and
/// configurable icons per state.
class SmartStepper extends StatefulWidget {
  final int currentStep;
  final List<SmartStep> steps;
  final Color? activeColor;
  final Color? completedColor;
  final Color? upcomingColor;
  final bool isDashedLine;
  final Widget? completedIcon;
  final Widget? upcomingIcon;

  const SmartStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    this.activeColor,
    this.completedColor,
    this.upcomingColor,
    this.isDashedLine = true,
    this.completedIcon,
    this.upcomingIcon,
  });

  @override
  State<SmartStepper> createState() => _SmartStepperState();
}

class _SmartStepperState extends State<SmartStepper> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _visibleSteps = [];

  @override
  void initState() {
    super.initState();
    _animateSteps();
  }

  Future<void> _animateSteps() async {
    for (int i = 0; i < widget.steps.length; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (!mounted) return;
      _visibleSteps.add(i);
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    return AnimatedList(
      key: _listKey,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      initialItemCount: _visibleSteps.length,
      itemBuilder: (context, index, animation) {
        final SmartStep step = widget.steps[index];
        final currentStep = widget.currentStep;
        final bool isCompleted = index < currentStep;
        final bool isActive = index == currentStep;
        final bool isUpcoming = index > currentStep;

        return SizeTransition(
          sizeFactor: animation,
          child: _buildStep(
            config: config,
            title: step.title,
            content: step.content,
            isActive: isActive,
            isCompleted: isCompleted,
            isUpcoming: isUpcoming,
            index: index,
            showDivider: index < (widget.steps.length - 1),
          ),
        );
      },
    );
  }

  Widget _buildStep({
    required SmartDevWidgetsConfig config,
    required Widget title,
    required Widget content,
    required bool isActive,
    required bool isCompleted,
    required bool isUpcoming,
    required int index,
    required bool showDivider,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIcon(config, isActive, isCompleted, isUpcoming),
              if (showDivider)
                _buildDivider(
                  config,
                  isActive: isActive,
                  isCompleted: isCompleted,
                  isUpcoming: isUpcoming,
                ),
            ],
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                title,
                SizedBox(height: 4.h),
                content,
                if (showDivider) SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(SmartDevWidgetsConfig config, bool isActive,
      bool isCompleted, bool isUpcoming) {
    Color getColor() {
      if (isCompleted) {
        return widget.completedColor ?? config.stepperCompletedColor;
      }
      if (isActive) {
        return widget.activeColor ?? config.stepperActiveColor;
      }
      if (isUpcoming) {
        return widget.upcomingColor ?? config.stepperUpcomingColor;
      }
      return config.stepperCompletedColor;
    }

    if (isCompleted && widget.completedIcon != null) {
      return Container(
        margin: EdgeInsets.all(2.w),
        alignment: Alignment.center,
        child: widget.completedIcon,
      );
    }
    if (isUpcoming && widget.upcomingIcon != null) {
      return widget.upcomingIcon!;
    }

    if (!isUpcoming) {
      return Container(
        height: 20.w,
        width: 20.w,
        margin: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: getColor(), width: 1.w),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 12.w,
          width: 12.w,
          decoration: BoxDecoration(shape: BoxShape.circle, color: getColor()),
        ),
      );
    }

    return Container(
      height: 24.w,
      width: 24.w,
      alignment: Alignment.center,
      child: Container(
        height: 12.w,
        width: 12.w,
        decoration: BoxDecoration(color: getColor(), shape: BoxShape.circle),
      ),
    );
  }

  Widget _buildDivider(
    SmartDevWidgetsConfig config, {
    required bool isActive,
    required bool isCompleted,
    required bool isUpcoming,
  }) {
    Color getDividerColor() {
      if (isCompleted) {
        return widget.completedColor ?? config.stepperCompletedColor;
      }
      if (isActive) {
        return widget.activeColor ?? config.stepperUpcomingColor;
      }
      if (isUpcoming) {
        return widget.upcomingColor ?? config.stepperUpcomingColor;
      }
      return config.stepperCompletedColor;
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: widget.isDashedLine
            ? CustomPaint(
                painter: _StepperDashedLinePainter(color: getDividerColor()))
            : Container(width: 1.w, color: getDividerColor()),
      ),
    );
  }
}

class _StepperDashedLinePainter extends CustomPainter {
  final Color color;

  _StepperDashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 1.w;

    var max = size.height;
    var dashWidth = 4.w;
    var dashSpace = 0.0;
    double startY = 0;
    while (startY < max) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
