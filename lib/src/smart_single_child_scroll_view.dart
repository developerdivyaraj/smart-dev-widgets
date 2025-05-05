import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'smart_dev_widgets_config.dart';

class SmartSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final bool reverse;
  final EdgeInsetsGeometry? padding;
  final bool? primary;
  final DragStartBehavior dragStartBehavior;
  final Clip clipBehavior;
  final String? restorationId;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final RefreshCallback? onRefresh;
  final bool safeArea;

  SmartSingleChildScrollView({
    super.key,
    required this.child,
    this.controller,
    Axis? scrollDirection,
    this.physics,
    bool? reverse,
    EdgeInsetsGeometry? padding, // Removed default here
    bool? primary, // Removed default here
    DragStartBehavior? dragStartBehavior,
    Clip? clipBehavior,
    this.restorationId,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    this.onRefresh,
    bool? safeArea,
  })  : scrollDirection = scrollDirection ?? SmartDevWidgetsConfig().scrollViewScrollDirection,
        reverse = reverse ?? SmartDevWidgetsConfig().scrollViewReverse,
        padding = padding ?? SmartDevWidgetsConfig().scrollViewPadding,
        primary = primary ?? SmartDevWidgetsConfig().scrollViewPrimary,
        dragStartBehavior = dragStartBehavior ?? SmartDevWidgetsConfig().scrollViewDragStartBehavior,
        clipBehavior = clipBehavior ?? SmartDevWidgetsConfig().scrollViewClipBehavior,
        keyboardDismissBehavior = keyboardDismissBehavior ?? SmartDevWidgetsConfig().scrollViewKeyboardDismissBehavior,
        safeArea = safeArea ?? SmartDevWidgetsConfig().scrollViewSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget view = SingleChildScrollView(
      controller: controller,
      scrollDirection: scrollDirection,
      physics: physics,
      reverse: reverse,
      padding: padding,
      primary: primary,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: child,
    );
    view = GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: _getRefreshIndicatorView(view: view),
    );

    if (safeArea) {
      view = SafeArea(child: view);
    }

    return view;
  }

  Widget _getRefreshIndicatorView({required Widget view}) {
    if (onRefresh != null) {
      return RefreshIndicator.adaptive(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: onRefresh!,
        child: view,
      );
    }
    return view;
  }
}
