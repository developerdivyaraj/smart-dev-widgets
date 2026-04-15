import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// Enum for the image source type.
enum SmartImageSourceType { camera, gallery }

/// A modal bottom sheet for choosing between Camera and Gallery as an image
/// source. Animated slide-up entrance with configurable icons, labels, and
/// styling.
class SmartImagePickDialogSheet extends StatelessWidget {
  final ValueChanged<SmartImageSourceType> onTapSource;
  final String? title;
  final String? cameraLabel;
  final String? galleryLabel;
  final String? cameraIconPath;
  final String? galleryIconPath;
  final String? closeIconPath;
  final Color? primaryColor;

  const SmartImagePickDialogSheet({
    super.key,
    required this.onTapSource,
    this.title,
    this.cameraLabel,
    this.galleryLabel,
    this.cameraIconPath,
    this.galleryIconPath,
    this.closeIconPath,
    this.primaryColor,
  });

  /// Show this dialog sheet as a modal bottom sheet.
  static Future<void> show(
    BuildContext context, {
    required ValueChanged<SmartImageSourceType> onTapSource,
    String? title,
    String? cameraLabel,
    String? galleryLabel,
    String? cameraIconPath,
    String? galleryIconPath,
    String? closeIconPath,
    Color? primaryColor,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => SmartImagePickDialogSheet(
        onTapSource: onTapSource,
        title: title,
        cameraLabel: cameraLabel,
        galleryLabel: galleryLabel,
        cameraIconPath: cameraIconPath,
        galleryIconPath: galleryIconPath,
        closeIconPath: closeIconPath,
        primaryColor: primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = primaryColor ?? Theme.of(context).colorScheme.primary;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        );
      },
      child: Stack(
        children: [
          SmartColumn(
            key: const ValueKey<String>('image_picker_dialog'),
            isSafeArea: false,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.1),
                  blurRadius: 12.r,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartText(
                title ?? 'Choose Option',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24.h),
              SmartRow(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionCard(
                    context,
                    icon: cameraIconPath,
                    fallbackIcon: Icons.camera_alt_outlined,
                    label: cameraLabel ?? 'Camera',
                    color: color,
                    bgColor: bgColor,
                    onTap: () {
                      Navigator.of(context).pop();
                      onTapSource(SmartImageSourceType.camera);
                    },
                  ),
                  _buildOptionCard(
                    context,
                    icon: galleryIconPath,
                    fallbackIcon: Icons.photo_library_outlined,
                    label: galleryLabel ?? 'Gallery',
                    color: color,
                    bgColor: bgColor,
                    onTap: () {
                      Navigator.of(context).pop();
                      onTapSource(SmartImageSourceType.gallery);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
          Positioned(
            right: 16.w,
            top: 16.h,
            child: closeIconPath != null
                ? SmartImage(
                    path: closeIconPath!,
                    width: 24.w,
                    height: 24.w,
                    onTap: () => Navigator.of(context).pop(),
                  )
                : IconButton(
                    icon: Icon(Icons.close, size: 24.w),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String? icon,
    required IconData fallbackIcon,
    required String label,
    required Color color,
    required Color bgColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SmartColumn(
        width: 100.w,
        height: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.15),
              color.withValues(alpha: 0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor.withValues(alpha: 0.8),
            ),
            child: icon != null
                ? SmartImage(path: icon, width: 28.w, height: 28.w)
                : Icon(fallbackIcon, size: 28.w, color: color),
          ),
          SizedBox(height: 10.h),
          SmartText(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
