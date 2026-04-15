import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// A customizable [AppBar] designed for common screen layouts with optional
/// back button, close button, notification icon, profile avatar, subtitle,
/// and custom logo.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartCommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final bool showBackButton;
  final bool showCloseButton;
  final bool showNotificationIcon;
  final String? profileImageUrl;
  final VoidCallback? onBackPressed;
  final VoidCallback? onClosePressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onProfilePressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final Widget? customLogo;
  final TextStyle? textStyle;
  final TextStyle? subTitleStyle;
  final double? toolbarHeight;
  final String? backIconPath;
  final String? closeIconPath;
  final String? notificationIconPath;

  const SmartCommonAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.showBackButton = false,
    this.showCloseButton = false,
    this.showNotificationIcon = false,
    this.profileImageUrl,
    this.onBackPressed,
    this.onClosePressed,
    this.onNotificationPressed,
    this.onProfilePressed,
    this.backgroundColor,
    this.textColor,
    this.elevation,
    this.customLogo,
    this.textStyle,
    this.subTitleStyle,
    this.toolbarHeight,
    this.backIconPath,
    this.closeIconPath,
    this.notificationIconPath,
  });

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    return AppBar(
      backgroundColor: backgroundColor ?? config.appBarBackgroundColor,
      elevation: elevation ?? 0,
      leading: _buildLeadingWidget(context, config),
      title: _buildTitleWidget(config),
      centerTitle: true,
      actions: _buildActions(config),
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight ?? 80.h,
    );
  }

  Widget? _buildLeadingWidget(
      BuildContext context, SmartDevWidgetsConfig config) {
    if (showBackButton) {
      return _iconButton(
        context,
        iconPath: backIconPath,
        fallbackIcon: Icons.arrow_back_ios_new,
        onTap: onBackPressed ?? () => Navigator.of(context).maybePop(),
        size: 32,
      );
    }

    if (showCloseButton) {
      return _iconButton(
        context,
        iconPath: closeIconPath,
        fallbackIcon: Icons.close,
        onTap: onClosePressed ?? () => Navigator.of(context).maybePop(),
        size: 32,
      );
    }

    if (showNotificationIcon) {
      return _iconButton(
        context,
        iconPath: notificationIconPath,
        fallbackIcon: Icons.notifications_outlined,
        onTap: onNotificationPressed,
        size: 24,
      );
    }

    return null;
  }

  Widget? _buildTitleWidget(SmartDevWidgetsConfig config) {
    if (customLogo != null) return customLogo;

    if (title != null) {
      if (subtitle != null) {
        return SmartColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmartText(title!, style: textStyle ?? config.appBarTitleStyle),
            SmartText(subtitle!,
                style: subTitleStyle ??
                    config.appBarTitleStyle.copyWith(
                        fontSize: 12.sp, fontWeight: FontWeight.w400)),
          ],
        );
      }
      return SmartText(title!, style: textStyle ?? config.appBarTitleStyle);
    }

    return null;
  }

  List<Widget> _buildActions(SmartDevWidgetsConfig config) {
    List<Widget> actions = [];

    if (profileImageUrl != null && onProfilePressed != null) {
      actions.add(
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: GestureDetector(
            onTap: onProfilePressed,
            child: CircleAvatar(
              radius: 16.r,
              backgroundImage: NetworkImage(profileImageUrl!),
            ),
          ),
        ),
      );
    }

    return actions;
  }

  Widget _iconButton(
    BuildContext context, {
    String? iconPath,
    required IconData fallbackIcon,
    VoidCallback? onTap,
    double size = 24,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: iconPath != null
            ? SmartImage(
                path: iconPath,
                size: size.w,
                alignment: Alignment.center,
              )
            : Icon(fallbackIcon, size: size.w),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 80.h);
}
