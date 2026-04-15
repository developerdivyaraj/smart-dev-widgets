import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'smart_dev_widgets_config.dart';

/// An enhanced [SingleChildScrollView] with optional pull-to-refresh,
/// automatic keyboard dismissal on tap, SafeArea support, and default
/// [ClampingScrollPhysics].
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;

  /// If null, defaults to [Axis.vertical] at build time.
  final Axis? scrollDirection;
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
    this.scrollDirection,
    ScrollPhysics? physics,
    bool? reverse,
    EdgeInsetsGeometry? padding,
    bool? primary,
    DragStartBehavior? dragStartBehavior,
    Clip? clipBehavior,
    this.restorationId,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    this.onRefresh,
    bool? safeArea,
  })  : physics = physics ?? const ClampingScrollPhysics(),
        reverse = reverse ?? SmartDevWidgetsConfig().scrollViewReverse,
        padding = padding ?? SmartDevWidgetsConfig().scrollViewPadding,
        primary = primary ?? SmartDevWidgetsConfig().scrollViewPrimary,
        dragStartBehavior = dragStartBehavior ??
            SmartDevWidgetsConfig().scrollViewDragStartBehavior,
        clipBehavior =
            clipBehavior ?? SmartDevWidgetsConfig().scrollViewClipBehavior,
        keyboardDismissBehavior = keyboardDismissBehavior ??
            SmartDevWidgetsConfig().scrollViewKeyboardDismissBehavior,
        safeArea = safeArea ?? SmartDevWidgetsConfig().scrollViewSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget view = SingleChildScrollView(
      controller: controller,
      scrollDirection: scrollDirection ?? Axis.vertical,
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: _withRefresh(view),
    );

    if (safeArea) {
      view = SafeArea(child: view);
    }

    return view;
  }

  Widget _withRefresh(Widget view) {
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
