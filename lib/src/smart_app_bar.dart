import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// A customizable [AppBar] with optional back button, leading image, search /
/// favorite / three-dot action icons, title, and skip mode.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? leadingImage;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? appBarHeight;
  final VoidCallback? onBack;
  final VoidCallback? onSearch;
  final VoidCallback? onFavorite;
  final VoidCallback? onThreeDotAction;
  final Widget? child;
  final TextStyle? titleStyle;
  final bool isCenter;
  final bool isBack;
  final bool isSkip;
  final bool isBorder;
  final double? optionalEndSpacing;
  final EdgeInsets? padding;
  final String? backIconPath;
  final String? searchIconPath;
  final String? favoriteIconPath;
  final String? threeDotIconPath;

  SmartAppBar({
    super.key,
    this.title,
    this.leadingImage,
    this.actions,
    this.backgroundColor,
    this.onSearch,
    this.onFavorite,
    this.titleStyle,
    this.isCenter = false,
    this.isBack = true,
    this.isBorder = true,
    this.padding,
    this.appBarHeight,
    this.onBack,
    this.child,
    this.optionalEndSpacing,
    this.isSkip = false,
    this.onThreeDotAction,
    this.backIconPath,
    this.searchIconPath,
    this.favoriteIconPath,
    this.threeDotIconPath,
  }) {
    if (isSkip) {
      if (!isBack) {
        throw Exception(
            'if isSkip is set to true then isBack must be set to true');
      }
      if (onBack == null) {
        throw Exception('if isSkip is set to true then onBack must be set');
      }
    }
  }

  final double _defaultHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: isCenter,
      backgroundColor: backgroundColor ?? config.appBarBackgroundColor,
      surfaceTintColor: backgroundColor ?? config.appBarBackgroundColor,
      toolbarHeight: appBarHeight ?? 72.h,
      elevation: 0,
      titleSpacing: 0,
      title: _buildTitle(config, context),
      actions: _buildActions(config),
    );
  }

  Widget _leadingIcon(BuildContext context, SmartDevWidgetsConfig config) {
    if (!isBack && leadingImage?.isNotEmpty == true) {
      return SmartImage(
        path: leadingImage!,
        height: 22.h,
        width: 17.w,
      );
    } else if (isBack) {
      return SmartRow(
        onTap: onBack ?? () => Navigator.of(context).maybePop(),
        padding: EdgeInsetsDirectional.only(
          start: 19.w,
          end: 12.w,
          top: 10.h,
          bottom: 10.h,
        ),
        children: [
          Opacity(
            opacity: isSkip ? 0 : 1,
            child: backIconPath != null
                ? SmartImage(
                    path: backIconPath!,
                    width: 24.w,
                    height: 24.w,
                  )
                : Icon(Icons.arrow_back_ios_new,
                    size: 20.w,
                    color: config.appBarTitleStyle.color ?? Colors.black),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildTitle(SmartDevWidgetsConfig config, BuildContext context) {
    return SmartRow(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (!isBack) SizedBox(width: 20.w),
        _leadingIcon(context, config),
        if ((isBack || leadingImage?.isNotEmpty == true) && title != null)
          SizedBox(width: 6.w),
        if (title != null)
          Expanded(
            child: SmartText(
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              title!,
              style: config.appBarTitleStyle.merge(titleStyle),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  List<Widget> _buildActions(SmartDevWidgetsConfig config) {
    final List<Widget> actionsList = [];
    if (onSearch != null) {
      actionsList.add(_buildIconButton(
        onSearch!,
        searchIconPath,
        Icons.search,
      ));
    }
    if (onFavorite != null) {
      actionsList.add(_buildIconButton(
        onFavorite!,
        favoriteIconPath,
        Icons.favorite_border,
      ));
    }
    if (onThreeDotAction != null) {
      actionsList.add(_buildIconButton(
        onThreeDotAction!,
        threeDotIconPath,
        Icons.more_vert,
      ));
    }
    if (actions != null) {
      actionsList.add(SizedBox(width: 18.w));
      actionsList.addAll(actions!);
    }
    if (optionalEndSpacing != null) {
      actionsList.add(SizedBox(width: optionalEndSpacing));
    }
    return actionsList;
  }

  Widget _buildIconButton(
      VoidCallback onTap, String? assetPath, IconData fallbackIcon) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 24.w,
          width: 24.w,
          child: Center(
            child: assetPath != null
                ? SmartImage(
                    path: assetPath,
                    height: 24.w,
                    width: 24.w,
                  )
                : Icon(fallbackIcon, size: 24.w),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? _defaultHeight);
}
