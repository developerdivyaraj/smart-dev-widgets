import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'smart_enums.dart';

/// Singleton configuration for all SmartDevWidgets.
///
/// Call [initialize] once at app startup to set global defaults that every
/// widget will fall back to when a parameter is not explicitly provided.
class SmartDevWidgetsConfig {
  // Singleton instance
  static final SmartDevWidgetsConfig _instance =
      SmartDevWidgetsConfig._internal();

  factory SmartDevWidgetsConfig() => _instance;

  SmartDevWidgetsConfig._internal();

  // ---------------------------------------------------------------------------
  // SmartColumn defaults
  // ---------------------------------------------------------------------------
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

  // ---------------------------------------------------------------------------
  // SmartRow defaults
  // ---------------------------------------------------------------------------
  MainAxisSize rowMainAxisSize = MainAxisSize.max;
  MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment rowCrossAxisAlignment = CrossAxisAlignment.center;
  VerticalDirection rowVerticalDirection = VerticalDirection.down;
  TextBaseline? rowTextBaseline;
  EdgeInsetsGeometry? rowPadding;
  EdgeInsetsGeometry? rowMargin;
  bool rowIsInkwell = false;
  Decoration? rowDecoration;

  /// Spacing between children — passed to native [Row.spacing].
  double rowSpacing = 0;

  // ---------------------------------------------------------------------------
  // SmartText defaults
  // ---------------------------------------------------------------------------
  TextStyle textStyle = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  Color? textColor;
  FontWeight? textFontWeight;

  /// Renamed from `textOptionalPaddings` to `textOptionalPadding` (singular).
  EdgeInsetsGeometry? textOptionalPadding;
  TextOverflow? textOverflow;
  TextAlign? textAlign;
  TextDecoration? textDecoration;
  int? textMaxLines;
  bool textIsAutoSizeText = false;

  // ---------------------------------------------------------------------------
  // SmartButton defaults
  // ---------------------------------------------------------------------------
  bool buttonIsLoading = false;
  bool buttonIsEnabled = true;
  bool buttonIsShadow = false;
  double buttonHeight = 48.0;
  double? buttonWidth;
  Color buttonActiveBackgroundColor = Colors.blue;
  Color buttonDisableBackgroundColor = Colors.grey;
  BorderRadiusGeometry buttonBorderRadius = BorderRadius.circular(8);
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
  EdgeInsetsDirectional buttonPadding =
      const EdgeInsetsDirectional.symmetric(horizontal: 12);
  EdgeInsetsDirectional? buttonMargin;
  Color buttonActiveImageColor = Colors.white;
  Color buttonDisableImageColor = Colors.white70;
  double buttonImageSize = 24.0;
  BoxShadow? buttonBoxShadow;
  bool buttonIsWhite = false;

  // ---------------------------------------------------------------------------
  // SmartSingleChildScrollView defaults
  // ---------------------------------------------------------------------------
  Axis scrollViewScrollDirection = Axis.vertical;
  bool scrollViewReverse = false;
  EdgeInsetsGeometry? scrollViewPadding;
  bool? scrollViewPrimary;
  DragStartBehavior scrollViewDragStartBehavior = DragStartBehavior.start;
  Clip scrollViewClipBehavior = Clip.hardEdge;
  ScrollViewKeyboardDismissBehavior scrollViewKeyboardDismissBehavior =
      ScrollViewKeyboardDismissBehavior.manual;
  bool scrollViewSafeArea = false;

  // ---------------------------------------------------------------------------
  // SmartImage defaults
  // ---------------------------------------------------------------------------
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
  double imageHeight = 100.0;
  double imageWidth = 100.0;

  /// Default loading animation style for network images.
  LoadingAnimationType imageLoadingAnimationType = LoadingAnimationType.shimmer;

  /// Whether to show animated placeholders for network images by default.
  bool imageShowLoadingAnimation = true;

  // ---------------------------------------------------------------------------
  // SmartExpansionTile defaults
  // ---------------------------------------------------------------------------
  EdgeInsetsGeometry? expansionTilePadding;
  EdgeInsetsGeometry? expansionTileMargin;
  Color? expansionTileBackgroundColor;
  String expansionTileTrailingExpandedIconPath = 'assets/images/arrow_up.svg';
  String expansionTileTrailingCollapsedIconPath =
      'assets/images/arrow_down.svg';
  bool expansionTileTrailingCollapsedIconVisible = true;
  bool expansionTileUsePageStorage = true;
  Duration expansionTileAnimationDuration = const Duration(milliseconds: 200);
  Curve expansionTileAnimationCurve = Curves.easeInOut;

  // ---------------------------------------------------------------------------
  // SmartTextField defaults
  // ---------------------------------------------------------------------------
  TextStyle textFieldStyle =
      const TextStyle(fontSize: 14, color: Colors.black87);
  TextStyle textFieldHintStyle =
      const TextStyle(fontSize: 14, color: Colors.grey);
  TextStyle textFieldLabelStyle =
      const TextStyle(fontSize: 12, color: Colors.grey);
  TextStyle textFieldErrorStyle =
      const TextStyle(fontSize: 12, color: Colors.red);
  Color textFieldFillColor = const Color(0xFFF5F5F5);
  Color textFieldEnabledBorderColor = const Color(0xFFDDDDDD);
  Color textFieldFocusedBorderColor = Colors.blue;
  Color textFieldDisabledBorderColor = const Color(0xFFEEEEEE);
  Color textFieldErrorBorderColor = Colors.red;
  Color textFieldCursorColor = Colors.black87;

  // ---------------------------------------------------------------------------
  // SmartCheckbox defaults
  // ---------------------------------------------------------------------------
  Color checkboxActiveColor = Colors.blue;
  Color checkboxCheckColor = Colors.white;
  Color checkboxBorderColor = Colors.grey;
  TextStyle checkboxLabelStyle =
      const TextStyle(fontSize: 14, color: Colors.black87);

  // ---------------------------------------------------------------------------
  // SmartRadioButton defaults
  // ---------------------------------------------------------------------------
  Color radioButtonActiveColor = Colors.blue;
  Color radioButtonInactiveColor = Colors.grey;
  TextStyle radioButtonTextStyle =
      const TextStyle(fontSize: 14, color: Colors.black87);

  // ---------------------------------------------------------------------------
  // SmartDropDown defaults
  // ---------------------------------------------------------------------------
  Color dropdownBackgroundColor = Colors.white;

  // ---------------------------------------------------------------------------
  // SmartAppBar / SmartCommonAppBar defaults
  // ---------------------------------------------------------------------------
  Color appBarBackgroundColor = Colors.white;
  TextStyle appBarTitleStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  // ---------------------------------------------------------------------------
  // SmartStepper defaults
  // ---------------------------------------------------------------------------
  Color stepperActiveColor = Colors.blue;
  Color stepperCompletedColor = Colors.green;
  Color stepperUpcomingColor = Colors.grey;

  // ---------------------------------------------------------------------------
  // SmartTabBar defaults
  // ---------------------------------------------------------------------------
  Color? tabBarDividerColor;
  Color? tabBarUnselectedLabelColor;
  TextStyle? tabBarLabelStyle;
  TextStyle? tabBarUnselectedLabelStyle;

  // ---------------------------------------------------------------------------
  // SmartNoDataFound defaults
  // ---------------------------------------------------------------------------
  String noDataFoundImagePath = 'assets/images/placeholder.png';
  String noDataFoundText = 'No data found';
  String noDataFoundRetryText = 'Retry';

  // ---------------------------------------------------------------------------
  // initialize()
  // ---------------------------------------------------------------------------

  /// Call once (typically in `main()`) to set global defaults for all widgets.
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
    Decoration? rowDecoration,
    double? rowSpacing,
    // SmartText
    TextStyle? textStyle,
    Color? textColor,
    FontWeight? textFontWeight,
    EdgeInsetsGeometry? textOptionalPadding,
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
    double? imageHeight,
    double? imageWidth,
    LoadingAnimationType? imageLoadingAnimationType,
    bool? imageShowLoadingAnimation,
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
    // SmartColumn
    this.columnMainAxisSize = columnMainAxisSize ?? this.columnMainAxisSize;
    this.columnMainAxisAlignment =
        columnMainAxisAlignment ?? this.columnMainAxisAlignment;
    this.columnCrossAxisAlignment =
        columnCrossAxisAlignment ?? this.columnCrossAxisAlignment;
    this.columnVerticalDirection =
        columnVerticalDirection ?? this.columnVerticalDirection;
    this.columnTextBaseline = columnTextBaseline ?? this.columnTextBaseline;
    this.columnSpacing = columnSpacing ?? this.columnSpacing;
    this.columnPadding = columnPadding ?? this.columnPadding;
    this.columnMargin = columnMargin ?? this.columnMargin;
    this.columnIsInkwell = columnIsInkwell ?? this.columnIsInkwell;
    this.columnIsSafeArea = columnIsSafeArea ?? this.columnIsSafeArea;
    this.columnDecoration = columnDecoration ?? this.columnDecoration;
    this.columnAlignment = columnAlignment ?? this.columnAlignment;
    this.columnClipBehavior = columnClipBehavior ?? this.columnClipBehavior;

    // SmartRow
    this.rowMainAxisSize = rowMainAxisSize ?? this.rowMainAxisSize;
    this.rowMainAxisAlignment =
        rowMainAxisAlignment ?? this.rowMainAxisAlignment;
    this.rowCrossAxisAlignment =
        rowCrossAxisAlignment ?? this.rowCrossAxisAlignment;
    this.rowVerticalDirection =
        rowVerticalDirection ?? this.rowVerticalDirection;
    this.rowTextBaseline = rowTextBaseline ?? this.rowTextBaseline;
    this.rowPadding = rowPadding ?? this.rowPadding;
    this.rowMargin = rowMargin ?? this.rowMargin;
    this.rowIsInkwell = rowIsInkwell ?? this.rowIsInkwell;
    this.rowDecoration = rowDecoration ?? this.rowDecoration;
    this.rowSpacing = rowSpacing ?? this.rowSpacing;

    // SmartText
    this.textStyle = textStyle ?? this.textStyle;
    this.textColor = textColor ?? this.textColor;
    this.textFontWeight = textFontWeight ?? this.textFontWeight;
    this.textOptionalPadding = textOptionalPadding ?? this.textOptionalPadding;
    this.textOverflow = textOverflow ?? this.textOverflow;
    this.textAlign = textAlign ?? this.textAlign;
    this.textDecoration = textDecoration ?? this.textDecoration;
    this.textMaxLines = textMaxLines ?? this.textMaxLines;
    this.textIsAutoSizeText = textIsAutoSizeText ?? this.textIsAutoSizeText;

    // SmartButton
    this.buttonIsLoading = buttonIsLoading ?? this.buttonIsLoading;
    this.buttonIsEnabled = buttonIsEnabled ?? this.buttonIsEnabled;
    this.buttonIsShadow = buttonIsShadow ?? this.buttonIsShadow;
    this.buttonHeight = buttonHeight ?? this.buttonHeight;
    this.buttonWidth = buttonWidth ?? this.buttonWidth;
    this.buttonActiveBackgroundColor =
        buttonActiveBackgroundColor ?? this.buttonActiveBackgroundColor;
    this.buttonDisableBackgroundColor =
        buttonDisableBackgroundColor ?? this.buttonDisableBackgroundColor;
    this.buttonBorderRadius = buttonBorderRadius ?? this.buttonBorderRadius;
    this.buttonTitleStyle = buttonTitleStyle ?? this.buttonTitleStyle;
    this.buttonDisableTitleStyle =
        buttonDisableTitleStyle ?? this.buttonDisableTitleStyle;
    this.buttonBorderColor = buttonBorderColor ?? this.buttonBorderColor;
    this.buttonPadding = buttonPadding ?? this.buttonPadding;
    this.buttonMargin = buttonMargin ?? this.buttonMargin;
    this.buttonActiveImageColor =
        buttonActiveImageColor ?? this.buttonActiveImageColor;
    this.buttonDisableImageColor =
        buttonDisableImageColor ?? this.buttonDisableImageColor;
    this.buttonImageSize = buttonImageSize ?? this.buttonImageSize;
    this.buttonBoxShadow = buttonBoxShadow ?? this.buttonBoxShadow;
    this.buttonIsWhite = buttonIsWhite ?? this.buttonIsWhite;

    // SmartSingleChildScrollView
    this.scrollViewScrollDirection =
        scrollViewScrollDirection ?? this.scrollViewScrollDirection;
    this.scrollViewReverse = scrollViewReverse ?? this.scrollViewReverse;
    this.scrollViewPadding = scrollViewPadding ?? this.scrollViewPadding;
    this.scrollViewPrimary = scrollViewPrimary ?? this.scrollViewPrimary;
    this.scrollViewDragStartBehavior =
        scrollViewDragStartBehavior ?? this.scrollViewDragStartBehavior;
    this.scrollViewClipBehavior =
        scrollViewClipBehavior ?? this.scrollViewClipBehavior;
    this.scrollViewKeyboardDismissBehavior =
        scrollViewKeyboardDismissBehavior ??
            this.scrollViewKeyboardDismissBehavior;
    this.scrollViewSafeArea = scrollViewSafeArea ?? this.scrollViewSafeArea;

    // SmartImage
    this.imageFit = imageFit ?? this.imageFit;
    this.imageBorderRadius = imageBorderRadius ?? this.imageBorderRadius;
    this.imageBackgroundColor =
        imageBackgroundColor ?? this.imageBackgroundColor;
    this.imagePadding = imagePadding ?? this.imagePadding;
    this.imageMargin = imageMargin ?? this.imageMargin;
    this.imageInkwellBorderRadius =
        imageInkwellBorderRadius ?? this.imageInkwellBorderRadius;
    this.imageBorder = imageBorder ?? this.imageBorder;
    this.imageIsMemCacheEnabled =
        imageIsMemCacheEnabled ?? this.imageIsMemCacheEnabled;
    this.imageMatchTextDirection =
        imageMatchTextDirection ?? this.imageMatchTextDirection;
    this.imageShape = imageShape ?? this.imageShape;
    this.imagePlaceholderPath =
        imagePlaceholderPath ?? this.imagePlaceholderPath;
    this.imageLoadingColor = imageLoadingColor ?? this.imageLoadingColor;
    this.imageHeight = imageHeight ?? this.imageHeight;
    this.imageWidth = imageWidth ?? this.imageWidth;
    this.imageLoadingAnimationType =
        imageLoadingAnimationType ?? this.imageLoadingAnimationType;
    this.imageShowLoadingAnimation =
        imageShowLoadingAnimation ?? this.imageShowLoadingAnimation;

    // SmartExpansionTile
    this.expansionTilePadding =
        expansionTilePadding ?? this.expansionTilePadding;
    this.expansionTileMargin = expansionTileMargin ?? this.expansionTileMargin;
    this.expansionTileBackgroundColor =
        expansionTileBackgroundColor ?? this.expansionTileBackgroundColor;
    this.expansionTileTrailingExpandedIconPath =
        expansionTileTrailingExpandedIconPath ??
            this.expansionTileTrailingExpandedIconPath;
    this.expansionTileTrailingCollapsedIconPath =
        expansionTileTrailingCollapsedIconPath ??
            this.expansionTileTrailingCollapsedIconPath;
    this.expansionTileTrailingCollapsedIconVisible =
        expansionTileTrailingCollapsedIconVisible ??
            this.expansionTileTrailingCollapsedIconVisible;
    this.expansionTileUsePageStorage =
        expansionTileUsePageStorage ?? this.expansionTileUsePageStorage;
    this.expansionTileAnimationDuration =
        expansionTileAnimationDuration ?? this.expansionTileAnimationDuration;
    this.expansionTileAnimationCurve =
        expansionTileAnimationCurve ?? this.expansionTileAnimationCurve;
  }
}
