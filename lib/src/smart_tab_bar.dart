import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// A customizable [TabBar] + views widget that manages its own
/// [TabController]. Supports scrollable tabs, custom indicators, and
/// an optional widget between the tab bar and the content.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartTabBar extends StatefulWidget {
  final int length;
  final List<Widget> tabs;
  final List<Widget> tabBarView;
  final ValueChanged<TabController>? onTabInitialized;
  final bool isScrollable;
  final ValueChanged<int>? onTapTab;
  final ScrollPhysics physics;
  final Widget? tabBetweenView;
  final Color? tabBarColor;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final EdgeInsetsGeometry? labelPadding;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final TabBarIndicatorSize? indicatorSize;
  final double? indicatorHeight;
  final Color? dividerColor;
  final TabAlignment? tabAlignment;
  final EdgeInsetsGeometry? padding;
  final bool isExpanded;

  const SmartTabBar({
    super.key,
    required this.length,
    required this.tabs,
    required this.tabBarView,
    this.onTabInitialized,
    this.isScrollable = false,
    this.onTapTab,
    this.physics = const NeverScrollableScrollPhysics(),
    this.tabBetweenView,
    this.tabBarColor,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelPadding,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.indicatorSize,
    this.indicatorHeight,
    this.dividerColor,
    this.tabAlignment,
    this.padding,
    this.isExpanded = true,
  });

  @override
  State<SmartTabBar> createState() => _SmartTabBarState();
}

class _SmartTabBarState extends State<SmartTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<int> _notifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.length, vsync: this);
    widget.onTabInitialized?.call(_tabController);
    _tabController.addListener(_tabListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabListener);
    _tabController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  void _tabListener() {
    if (_tabController.indexIsChanging) {
      _notifier.value = _tabController.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    final primaryColor = Theme.of(context).colorScheme.primary;
    return SmartColumn(
      color: widget.tabBarColor,
      children: [
        TabBar(
          padding: widget.padding,
          physics: widget.physics,
          isScrollable: widget.isScrollable,
          tabAlignment: widget.tabAlignment,
          onTap: widget.onTapTab,
          controller: _tabController,
          tabs: widget.tabs,
          dividerHeight: 1.h,
          dividerColor: widget.dividerColor ??
              config.tabBarDividerColor ??
              Colors.grey[300],
          indicatorColor: widget.indicatorColor ?? primaryColor,
          labelColor: widget.labelColor ?? primaryColor,
          unselectedLabelColor: widget.unselectedLabelColor ??
              config.tabBarUnselectedLabelColor ??
              Colors.grey,
          labelPadding: widget.labelPadding,
          labelStyle: widget.labelStyle ?? config.tabBarLabelStyle,
          unselectedLabelStyle:
              widget.unselectedLabelStyle ?? config.tabBarUnselectedLabelStyle,
          indicatorSize: widget.indicatorSize ?? TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0.r),
              topLeft: Radius.circular(10.0.r),
            ),
            borderSide: BorderSide(
              width: widget.indicatorHeight ?? 3.0.h,
              color: widget.indicatorColor ?? primaryColor,
            ),
          ),
        ),
        if (widget.tabBetweenView != null) widget.tabBetweenView!,
        ValueListenableBuilder<int>(
          valueListenable: _notifier,
          builder: (context, value, child) {
            return widget.isExpanded
                ? Expanded(child: widget.tabBarView[value])
                : widget.tabBarView[value];
          },
        ),
      ],
    );
  }
}
