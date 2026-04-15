import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// A customizable expansion tile with animated expand/collapse, configurable
/// trailing icons, optional PageStorage state persistence, and theme
/// integration.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartExpansionTile extends StatefulWidget {
  const SmartExpansionTile({
    super.key,
    this.leading,
    required this.title,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.trailingCollapsedIconVisible = true,
    this.isDisablePageStorage = false,
    this.padding,
    this.margin,
  });

  final Widget? leading;
  final Widget title;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color? backgroundColor;
  final Widget? trailing;
  final bool initiallyExpanded;

  /// Whether to show the default trailing expand/collapse icon.
  final bool trailingCollapsedIconVisible;

  /// When true, PageStorage is NOT used — the tile always starts in
  /// its [initiallyExpanded] state.
  final bool isDisablePageStorage;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  SmartExpansionTileState createState() => SmartExpansionTileState();
}

class SmartExpansionTileState extends State<SmartExpansionTile>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  CurvedAnimation? _easeOutAnimation;
  CurvedAnimation? _easeInAnimation;
  ColorTween? _borderColor;
  ColorTween? _headerColor;
  ColorTween? _iconColor;
  ColorTween? _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    final config = SmartDevWidgetsConfig();
    _controller = AnimationController(
        duration: config.expansionTileAnimationDuration, vsync: this);
    _easeOutAnimation = CurvedAnimation(
        parent: _controller!, curve: config.expansionTileAnimationCurve);
    _easeInAnimation = CurvedAnimation(
        parent: _controller!, curve: config.expansionTileAnimationCurve);
    _borderColor = ColorTween();
    _headerColor = ColorTween();
    _iconColor = ColorTween();
    _backgroundColor = ColorTween();

    _isExpanded = widget.isDisablePageStorage
        ? widget.initiallyExpanded
        : (PageStorage.of(context).readState(context) as bool?) ??
            widget.initiallyExpanded;
    if (_isExpanded) {
      _controller?.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void expand() => _setExpanded(true);

  void collapse() => _setExpanded(false);

  void toggle() => _setExpanded(!_isExpanded);

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded) {
          _controller?.forward();
        } else {
          _controller?.reverse().then<void>((value) {
            if (mounted) {
              setState(() {
                // Rebuild without widget.children.
              });
            }
          });
        }
        if (!widget.isDisablePageStorage) {
          PageStorage.of(context).writeState(context, _isExpanded);
        }
      });
      widget.onExpansionChanged?.call(_isExpanded);
    }
  }

  Widget? _buildTrailing() {
    final config = SmartDevWidgetsConfig();
    if (widget.trailing != null) {
      return widget.trailing;
    } else if (widget.trailingCollapsedIconVisible) {
      return SmartImage(
        path: _isExpanded
            ? config.expansionTileTrailingExpandedIconPath
            : config.expansionTileTrailingCollapsedIconPath,
        height: 24.w,
        width: 24.w,
      );
    }
    return null;
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final config = SmartDevWidgetsConfig();
    final Color titleColor = _headerColor?.evaluate(_easeInAnimation!) ??
        Theme.of(context).colorScheme.primary;
    return Container(
      padding: widget.padding ?? config.expansionTilePadding,
      margin: widget.margin ?? config.expansionTileMargin,
      decoration: BoxDecoration(
        color: _backgroundColor?.evaluate(_easeOutAnimation!) ??
            widget.backgroundColor ??
            config.expansionTileBackgroundColor ??
            Colors.transparent,
      ),
      child: SmartColumn(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          IconTheme.merge(
            data: IconThemeData(color: _iconColor?.evaluate(_easeInAnimation!)),
            child: ListTile(
              onTap: widget.onExpansionChanged == null ? null : toggle,
              contentPadding: EdgeInsets.zero,
              leading: widget.leading,
              title: widget.title is SmartText
                  ? widget.title
                  : DefaultTextStyle(
                      style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: titleColor) ??
                          TextStyle(color: titleColor),
                      child: widget.title,
                    ),
              trailing: _buildTrailing(),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: _easeInAnimation?.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor?.end = theme.dividerColor;
    _headerColor
      ?..begin =
          theme.textTheme.titleLarge?.color ?? theme.colorScheme.onSurface
      ..end = theme.colorScheme.primary;
    _iconColor
      ?..begin = theme.colorScheme.onSurface.withValues(alpha: 0.6)
      ..end = theme.colorScheme.primary;
    _backgroundColor
      ?..begin = widget.backgroundColor ??
          SmartDevWidgetsConfig().expansionTileBackgroundColor
      ..end = widget.backgroundColor ??
          SmartDevWidgetsConfig().expansionTileBackgroundColor;

    final bool closed = !_isExpanded && (_controller?.isDismissed == true);
    return AnimatedBuilder(
      animation: _controller!.view,
      builder: _buildChildren,
      child: closed
          ? null
          : SmartColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children),
    );
  }
}
