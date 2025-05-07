import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartDevWidgetsConfig {
  // Singleton instance
  static final SmartDevWidgetsConfig _instance = SmartDevWidgetsConfig._internal();

  factory SmartDevWidgetsConfig() => _instance;

  SmartDevWidgetsConfig._internal();

  // Default values for SmartColumn
  MainAxisSize columnMainAxisSize = MainAxisSize.max;
  MainAxisAlignment columnMainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment columnCrossAxisAlignment = CrossAxisAlignment.center;
  VerticalDirection columnVerticalDirection = VerticalDirection.down;
  TextBaseline? columnTextBaseline = TextBaseline.alphabetic;
  double columnSpacing = 0;
  EdgeInsetsGeometry? columnPadding;
  EdgeInsetsGeometry? columnMargin;
  bool columnIsInkwell = false;
  bool columnIsSafeArea = false;
  BoxDecoration? columnDecoration;
  AlignmentGeometry? columnAlignment;
  Clip columnClipBehavior = Clip.none;

  // Default values for SmartRow
  MainAxisSize rowMainAxisSize = MainAxisSize.max;
  MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment rowCrossAxisAlignment = CrossAxisAlignment.center;
  VerticalDirection rowVerticalDirection = VerticalDirection.down;
  TextBaseline? rowTextBaseline;
  EdgeInsetsGeometry? rowPadding;
  EdgeInsetsGeometry? rowMargin;
  bool rowIsInkwell = false;
  BoxDecoration? rowDecoration;

  // Default values for SmartText
  TextStyle textStyle = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  Color? textColor;
  FontWeight? textFontWeight;
  EdgeInsetsGeometry? textOptionalPaddings;
  TextOverflow? textOverflow;
  TextAlign? textAlign;
  TextDecoration? textDecoration;
  int? textMaxLines;
  bool textIsAutoSizeText = false;

  // Default values for SmartButton
  bool buttonIsLoading = false;
  bool buttonIsEnabled = true;
  bool buttonIsShadow = false;
  double buttonHeight = 48.w;
  double? buttonWidth;
  Color buttonActiveBackgroundColor = Colors.blue;
  Color buttonDisableBackgroundColor = Colors.grey;
  BorderRadiusGeometry buttonBorderRadius = BorderRadius.circular(8.r);
  TextStyle buttonTitleStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  TextStyle buttonDisableTitleStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );
  Color? buttonBorderColor;
  EdgeInsetsDirectional buttonPadding = EdgeInsetsDirectional.symmetric(horizontal: 12.w);
  EdgeInsetsDirectional? buttonMargin;
  Color buttonActiveImageColor = Colors.white;
  Color buttonDisableImageColor = Colors.white70;
  double buttonImageSize = 24.w;
  BoxShadow? buttonBoxShadow;
  bool buttonIsWhite = false;

  // Default values for SmartSingleChildScrollView
  Axis scrollViewScrollDirection = Axis.vertical;
  bool scrollViewReverse = false;
  EdgeInsetsGeometry? scrollViewPadding;
  bool? scrollViewPrimary;
  DragStartBehavior scrollViewDragStartBehavior = DragStartBehavior.start;
  Clip scrollViewClipBehavior = Clip.hardEdge;
  ScrollViewKeyboardDismissBehavior scrollViewKeyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual;
  bool scrollViewSafeArea = false;

  // Default values for SmartImage
  BoxFit imageFit = BoxFit.cover;
  BorderRadiusGeometry? imageBorderRadius;
  Color? imageBackgroundColor;
  EdgeInsetsGeometry? imagePadding;
  EdgeInsetsGeometry? imageMargin;
  BorderRadius? imageInkwellBorderRadius;
  BoxBorder? imageBorder;
  bool imageIsMemCacheEnabled = true;
  bool imageMatchTextDirection = false;
  BoxShape imageShape = BoxShape.rectangle;
  String? imagePlaceholderPath = 'assets/images/placeholder.png';
  Color imageLoadingColor = Colors.blue;
  double imageHeight = 100.w;
  double imageWidth = 100.w;

  // Default values for SmartExpansionTile
  EdgeInsetsGeometry? expansionTilePadding;
  EdgeInsetsGeometry? expansionTileMargin;
  Color? expansionTileBackgroundColor;
  String expansionTileTrailingExpandedIconPath = 'assets/images/arrow_up.svg';
  String expansionTileTrailingCollapsedIconPath = 'assets/images/arrow_down.svg';
  bool expansionTileTrailingCollapsedIconVisible = true;
  bool expansionTileUsePageStorage = true;
  Duration expansionTileAnimationDuration = const Duration(milliseconds: 200);
  Curve expansionTileAnimationCurve = Curves.easeInOut;

  // Initialize defaults
  void initialize({
    // SmartColumn
    MainAxisSize? columnMainAxisSize,
    MainAxisAlignment? columnMainAxisAlignment,
    CrossAxisAlignment? columnCrossAxisAlignment,
    VerticalDirection? columnVerticalDirection,
    TextBaseline? columnTextBaseline,
    double? columnSpacing,
    EdgeInsetsGeometry? columnPadding,
    EdgeInsetsGeometry? columnMargin,
    bool? columnIsInkwell,
    bool? columnIsSafeArea,
    BoxDecoration? columnDecoration,
    AlignmentGeometry? columnAlignment,
    Clip? columnClipBehavior,
    // SmartRow
    MainAxisSize? rowMainAxisSize,
    MainAxisAlignment? rowMainAxisAlignment,
    CrossAxisAlignment? rowCrossAxisAlignment,
    VerticalDirection? rowVerticalDirection,
    TextBaseline? rowTextBaseline,
    EdgeInsetsGeometry? rowPadding,
    EdgeInsetsGeometry? rowMargin,
    bool? rowIsInkwell,
    BoxDecoration? rowDecoration,
    // SmartText
    TextStyle? textStyle,
    Color? textColor,
    FontWeight? textFontWeight,
    EdgeInsetsGeometry? textOptionalPaddings,
    TextOverflow? textOverflow,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    int? textMaxLines,
    bool? textIsAutoSizeText,
    // SmartButton
    bool? buttonIsLoading,
    bool? buttonIsEnabled,
    bool? buttonIsShadow,
    double? buttonHeight,
    double? buttonWidth,
    Color? buttonActiveBackgroundColor,
    Color? buttonDisableBackgroundColor,
    BorderRadiusGeometry? buttonBorderRadius,
    TextStyle? buttonTitleStyle,
    TextStyle? buttonDisableTitleStyle,
    Color? buttonBorderColor,
    EdgeInsetsDirectional? buttonPadding,
    EdgeInsetsDirectional? buttonMargin,
    Color? buttonActiveImageColor,
    Color? buttonDisableImageColor,
    double? buttonImageSize,
    BoxShadow? buttonBoxShadow,
    bool? buttonIsWhite,
    // SmartSingleChildScrollView
    Axis? scrollViewScrollDirection,
    bool? scrollViewReverse,
    EdgeInsetsGeometry? scrollViewPadding,
    bool? scrollViewPrimary,
    DragStartBehavior? scrollViewDragStartBehavior,
    Clip? scrollViewClipBehavior,
    ScrollViewKeyboardDismissBehavior? scrollViewKeyboardDismissBehavior,
    bool? scrollViewSafeArea,
// SmartImage
    BoxFit? imageFit,
    BorderRadiusGeometry? imageBorderRadius,
    Color? imageBackgroundColor,
    EdgeInsetsGeometry? imagePadding,
    EdgeInsetsGeometry? imageMargin,
    BorderRadius? imageInkwellBorderRadius,
    BoxBorder? imageBorder,
    bool? imageIsMemCacheEnabled,
    bool? imageMatchTextDirection,
    BoxShape? imageShape,
    String? imagePlaceholderPath,
    Color? imageLoadingColor,
    double? imageHeight, // Added
    double? imageWidth, // Added
    // SmartExpansionTile
    EdgeInsetsGeometry? expansionTilePadding,
    EdgeInsetsGeometry? expansionTileMargin,
    Color? expansionTileBackgroundColor,
    String? expansionTileTrailingExpandedIconPath,
    String? expansionTileTrailingCollapsedIconPath,
    bool? expansionTileTrailingCollapsedIconVisible,
    bool? expansionTileUsePageStorage,
    Duration? expansionTileAnimationDuration,
    Curve? expansionTileAnimationCurve,
  }) {
    // Update SmartColumn defaults
    this.columnMainAxisSize = columnMainAxisSize ?? this.columnMainAxisSize;
    this.columnMainAxisAlignment = columnMainAxisAlignment ?? this.columnMainAxisAlignment;
    this.columnCrossAxisAlignment = columnCrossAxisAlignment ?? this.columnCrossAxisAlignment;
    this.columnVerticalDirection = columnVerticalDirection ?? this.columnVerticalDirection;
    this.columnTextBaseline = columnTextBaseline ?? this.columnTextBaseline;
    this.columnSpacing = columnSpacing ?? this.columnSpacing;
    this.columnPadding = columnPadding ?? this.columnPadding;
    this.columnMargin = columnMargin ?? this.columnMargin;
    this.columnIsInkwell = columnIsInkwell ?? this.columnIsInkwell;
    this.columnIsSafeArea = columnIsSafeArea ?? this.columnIsSafeArea;
    this.columnDecoration = columnDecoration ?? this.columnDecoration;
    this.columnAlignment = columnAlignment ?? this.columnAlignment;
    this.columnClipBehavior = columnClipBehavior ?? this.columnClipBehavior;

    // Update SmartRow defaults
    this.rowMainAxisSize = rowMainAxisSize ?? this.rowMainAxisSize;
    this.rowMainAxisAlignment = rowMainAxisAlignment ?? this.rowMainAxisAlignment;
    this.rowCrossAxisAlignment = rowCrossAxisAlignment ?? this.rowCrossAxisAlignment;
    this.rowVerticalDirection = rowVerticalDirection ?? this.rowVerticalDirection;
    this.rowTextBaseline = rowTextBaseline ?? this.rowTextBaseline;
    this.rowPadding = rowPadding ?? this.rowPadding;
    this.rowMargin = rowMargin ?? this.rowMargin;
    this.rowIsInkwell = rowIsInkwell ?? this.rowIsInkwell;
    this.rowDecoration = rowDecoration ?? this.rowDecoration;

    // Update SmartText defaults
    this.textStyle = textStyle ?? this.textStyle;
    this.textColor = textColor ?? this.textColor;
    this.textFontWeight = textFontWeight ?? this.textFontWeight;
    this.textOptionalPaddings = textOptionalPaddings ?? this.textOptionalPaddings;
    this.textOverflow = textOverflow ?? this.textOverflow;
    this.textAlign = textAlign ?? this.textAlign;
    this.textDecoration = textDecoration ?? this.textDecoration;
    this.textMaxLines = textMaxLines ?? this.textMaxLines;
    this.textIsAutoSizeText = textIsAutoSizeText ?? this.textIsAutoSizeText;

    // Update SmartButton defaults
    this.buttonIsLoading = buttonIsLoading ?? this.buttonIsLoading;
    this.buttonIsEnabled = buttonIsEnabled ?? this.buttonIsEnabled;
    this.buttonIsShadow = buttonIsShadow ?? this.buttonIsShadow;
    this.buttonHeight = buttonHeight ?? this.buttonHeight;
    this.buttonWidth = buttonWidth ?? this.buttonWidth;
    this.buttonActiveBackgroundColor = buttonActiveBackgroundColor ?? this.buttonActiveBackgroundColor;
    this.buttonDisableBackgroundColor = buttonDisableBackgroundColor ?? this.buttonDisableBackgroundColor;
    this.buttonBorderRadius = buttonBorderRadius ?? this.buttonBorderRadius;
    this.buttonTitleStyle = buttonTitleStyle ?? this.buttonTitleStyle;
    this.buttonDisableTitleStyle = buttonDisableTitleStyle ?? this.buttonDisableTitleStyle;
    this.buttonBorderColor = buttonBorderColor ?? this.buttonBorderColor;
    this.buttonPadding = buttonPadding ?? this.buttonPadding;
    this.buttonMargin = buttonMargin ?? this.buttonMargin;
    this.buttonActiveImageColor = buttonActiveImageColor ?? this.buttonActiveImageColor;
    this.buttonDisableImageColor = buttonDisableImageColor ?? this.buttonDisableImageColor;
    this.buttonImageSize = buttonImageSize ?? this.buttonImageSize;
    this.buttonBoxShadow = buttonBoxShadow ?? this.buttonBoxShadow;
    this.buttonIsWhite = buttonIsWhite ?? this.buttonIsWhite;

    // Update SmartSingleChildScrollView defaults
    this.scrollViewScrollDirection = scrollViewScrollDirection ?? this.scrollViewScrollDirection;
    this.scrollViewReverse = scrollViewReverse ?? this.scrollViewReverse;
    this.scrollViewPadding = scrollViewPadding ?? this.scrollViewPadding;
    this.scrollViewPrimary = scrollViewPrimary ?? this.scrollViewPrimary;
    this.scrollViewDragStartBehavior = scrollViewDragStartBehavior ?? this.scrollViewDragStartBehavior;
    this.scrollViewClipBehavior = scrollViewClipBehavior ?? this.scrollViewClipBehavior;
    this.scrollViewKeyboardDismissBehavior = scrollViewKeyboardDismissBehavior ?? this.scrollViewKeyboardDismissBehavior;
    this.scrollViewSafeArea = scrollViewSafeArea ?? this.scrollViewSafeArea;

    // Update SmartImage defaults
    this.imageFit = imageFit ?? this.imageFit;
    this.imageBorderRadius = imageBorderRadius ?? this.imageBorderRadius;
    this.imageBackgroundColor = imageBackgroundColor ?? this.imageBackgroundColor;
    this.imagePadding = imagePadding ?? this.imagePadding;
    this.imageMargin = imageMargin ?? this.imageMargin;
    this.imageInkwellBorderRadius = imageInkwellBorderRadius ?? this.imageInkwellBorderRadius;
    this.imageBorder = imageBorder ?? this.imageBorder;
    this.imageIsMemCacheEnabled = imageIsMemCacheEnabled ?? this.imageIsMemCacheEnabled;
    this.imageMatchTextDirection = imageMatchTextDirection ?? this.imageMatchTextDirection;
    this.imageShape = imageShape ?? this.imageShape;
    this.imagePlaceholderPath = imagePlaceholderPath ?? this.imagePlaceholderPath;
    this.imageLoadingColor = imageLoadingColor ?? this.imageLoadingColor;
    this.imageHeight = imageHeight ?? this.imageHeight; // Added
    this.imageWidth = imageWidth ?? this.imageWidth; // Added

    // Update SmartExpansionTile defaults
    this.expansionTilePadding = expansionTilePadding ?? this.expansionTilePadding;
    this.expansionTileMargin = expansionTileMargin ?? this.expansionTileMargin;
    this.expansionTileBackgroundColor = expansionTileBackgroundColor ?? this.expansionTileBackgroundColor;
    this.expansionTileTrailingExpandedIconPath =
        expansionTileTrailingExpandedIconPath ?? this.expansionTileTrailingExpandedIconPath;
    this.expansionTileTrailingCollapsedIconPath =
        expansionTileTrailingCollapsedIconPath ?? this.expansionTileTrailingCollapsedIconPath;
    this.expansionTileTrailingCollapsedIconVisible =
        expansionTileTrailingCollapsedIconVisible ?? this.expansionTileTrailingCollapsedIconVisible;
    this.expansionTileUsePageStorage = expansionTileUsePageStorage ?? this.expansionTileUsePageStorage;
    this.expansionTileAnimationDuration = expansionTileAnimationDuration ?? this.expansionTileAnimationDuration;
    this.expansionTileAnimationCurve = expansionTileAnimationCurve ?? this.expansionTileAnimationCurve;
  }
}
