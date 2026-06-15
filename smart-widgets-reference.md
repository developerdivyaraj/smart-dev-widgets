# SmartDevWidgets Reference

Comprehensive property reference for all public widgets in the `smart_dev_widgets` package. Use this to avoid redundant wrapping and ensure consistent styling.

## SmartAppBar
**Purpose:** A customizable [AppBar] with optional back button, leading image, search / favorite / three-dot action icons, title, and skip mode.
**Constructors:** SmartAppBar(...)
**Built-in props:** title, leadingImage, actions, backgroundColor, appBarHeight, onBack, onSearch, onFavorite, onThreeDotAction, child, titleStyle, isCenter, isBack, isSkip, isBorder, optionalEndSpacing, padding, backIconPath, searchIconPath, favoriteIconPath, threeDotIconPath
**❌ DO NOT wrap with:** Padding, SizedBox (for center alignment)
**✅ Use instead:** `padding` for Padding, `isCenter: true` for horizontal centering

```dart
SmartAppBar(
  title: 'Profile',
  isBack: true,
  onBack: () => print('Back tapped'),
)
```

## SmartButton
**Purpose:** A feature-rich button with loading state, bounce animation, prefix/suffix image support, enabled/disabled/white variants, and shadow.
**Constructors:** SmartButton(...), SmartButton.white(...)
**Built-in props:** onTap, title, isLoading, isEnabled, isShadow, height, width, activeBackgroundColor, disableBackgroundColor, borderRadius, titleStyle, disableTitleStyle, borderColor, padding, margin, prefixImage, suffixImage, activeImageColor, disableImageColor, imageSize, boxShadow, isWhite
**❌ DO NOT wrap with:** GestureDetector, InkWell, Padding, Container (for margin/decoration/shadow), SizedBox (for sizing), CircularProgressIndicator
**✅ Use instead:** `onTap` for interaction, `padding`/`margin` for spacing, `height`/`width` for sizing, `isLoading: true` for loading state, `isShadow: true` or `boxShadow` for shadows

```dart
SmartButton(
  title: 'Submit',
  onTap: () => print('Submitted'),
  isLoading: _busy,
  isShadow: true,
)
```

## SmartCheckbox
**Purpose:** A customizable checkbox with optional label, configurable colors, and a `.radio` variant that renders radio-style icons instead.
**Constructors:** SmartCheckbox(...), SmartCheckbox.radio(...)
**Built-in props:** label, value, onChanged, labelStyle, height, width, activeColor, checkColor, borderColor, padding, mainAxisSize, spaceBetweenLabelAndCheckbox
**❌ DO NOT wrap with:** InkWell, Row, Padding, SizedBox (for sizing)
**✅ Use instead:** `label` for the text, `padding` for inner spacing, `height`/`width` for clickable area size

```dart
SmartCheckbox(
  label: 'Accept Terms',
  value: _accepted,
  onChanged: (val) => setState(() => _accepted = val!),
)
```

## SmartCircularProgressIndicator
**Purpose:** A customizable circular progress indicator with configurable size, color, stroke width, and padding.
**Constructors:** SmartCircularProgressIndicator(...)
**Built-in props:** size, color, strokeWidth, padding
**❌ DO NOT wrap with:** Padding, SizedBox (for sizing)
**✅ Use instead:** `padding` for spacing, `size` for dimensions

```dart
SmartCircularProgressIndicator(
  size: 32.w,
  color: Colors.red,
)
```

## SmartColumn
**Purpose:** A customizable [Column] with built-in spacing, padding, margin, tap handling, SafeArea support, and optional [Expanded] wrapping.
**Constructors:** SmartColumn(...)
**Built-in props:** children, spacing, padding, margin, width, height, color, onTap, isInkwell, expanded, decoration, alignment, clipBehavior, isSafeArea, mainAxisSize, mainAxisAlignment, crossAxisAlignment, textDirection, verticalDirection, textBaseline
**❌ DO NOT wrap with:** Column, Padding, Container (for margin/decoration/color/alignment), GestureDetector, InkWell, Expanded, SafeArea, SizedBox (between children for spacing)
**✅ Use instead:** `children` for content, `spacing` for gap between items, `padding`/`margin` for spacing, `onTap` for interaction, `expanded: true` for Expanded, `isSafeArea: true` for SafeArea

```dart
SmartColumn(
  spacing: 12.h,
  padding: EdgeInsets.all(16.w),
  isSafeArea: true,
  children: [ Text('Item 1'), Text('Item 2') ],
)
```

## SmartCommonAppBar
**Purpose:** A customizable [AppBar] designed for common screen layouts with optional back/close buttons, notification icon, and profile avatar.
**Constructors:** SmartCommonAppBar(...)
**Built-in props:** title, subtitle, showBackButton, showCloseButton, showNotificationIcon, profileImageUrl, onBackPressed, onClosePressed, onNotificationPressed, onProfilePressed, backgroundColor, textColor, elevation, customLogo, textStyle, subTitleStyle, toolbarHeight, backIconPath, closeIconPath, notificationIconPath
**❌ DO NOT wrap with:** SizedBox (for height)
**✅ Use instead:** `toolbarHeight` for height

```dart
SmartCommonAppBar(
  title: 'Home',
  showNotificationIcon: true,
  onNotificationPressed: () => print('Notifications'),
)
```

## SmartDashedDivider
**Purpose:** A dashed (or dotted) line divider supporting both horizontal and vertical orientations.
**Constructors:** SmartDashedDivider(...)
**Built-in props:** axis, color, dashSpace, dashWidth, strokeWidth, length
**❌ DO NOT wrap with:** SizedBox (for length)
**✅ Use instead:** `length` for dimension (width if horizontal, height if vertical)

```dart
SmartDashedDivider(
  axis: Axis.horizontal,
  dashWidth: 5.w,
  color: Colors.blue,
)
```

## SmartDropDown
**Purpose:** A customizable dropdown that opens a modal bottom sheet with an optional search field and scrollable list.
**Constructors:** SmartDropDown(...)
**Built-in props:** onChanged, items, selectedItem, selectionWindowHeight, buttonHeight, hintText, labelText, scrollDirection, focusNode, borderRadius, border, contentPadding, textStyle, backgroundColor, isIcArrowDropDown, isExpanded, isChangeableValue, onSearchEvent, canSearch, errorText, emptyText, itemAlignment, searchHintText, selectedItemColor, selectedBorderColor, unselectedBorderColor, selectedTextStyle, unselectedTextStyle
**❌ DO NOT wrap with:** InkWell, Column (for error text), SizedBox (for button height)
**✅ Use instead:** `onChanged` for selection, `errorText` for validation errors, `buttonHeight` for custom height

```dart
SmartDropDown<String>(
  hintText: 'Select Country',
  items: [ SmartDropDownItem(title: 'USA', value: 'us') ],
  onChanged: (val) => print(val),
)
```

## SmartExpansionTile
**Purpose:** A customizable expansion tile with animated expand/collapse and PageStorage state persistence.
**Constructors:** SmartExpansionTile(...)
**Built-in props:** title, children, leading, backgroundColor, onExpansionChanged, trailing, initiallyExpanded, trailingCollapsedIconVisible, isDisablePageStorage, padding, margin
**❌ DO NOT wrap with:** Container (for padding/margin/color)
**✅ Use instead:** `padding`/`margin` for spacing, `backgroundColor` for background

```dart
SmartExpansionTile(
  title: Text('Advanced Settings'),
  children: [ Text('Setting 1'), Text('Setting 2') ],
)
```

## SmartGradientContainer
**Purpose:** A thin gradient line (typically used as a decorative divider) that fades transparent → solid → transparent.
**Constructors:** SmartGradientContainer(...)
**Built-in props:** height, width, color, begin, end, colors, margin
**❌ DO NOT wrap with:** Container (for margin/decoration), SizedBox (for size)
**✅ Use instead:** `height`/`width` for size, `margin` for spacing, `colors` for custom gradient

```dart
SmartGradientContainer(
  color: Colors.grey,
  height: 1.h,
)
```

## SmartImage
**Purpose:** Universal image viewer supporting assets, files, network, SVGs, and Lottie with cached loading and animated placeholders.
**Constructors:** SmartImage(...)
**Built-in props:** path, height, width, size, fit, imageBorderRadius, color, backgroundColor, onTap, padding, margin, inkwellBorderRadius, border, isMemCacheEnabled, matchTextDirection, shape, clipBehavior, decoration, alignment, animationType, showLoadingAnimation
**❌ DO NOT wrap with:** Image.network, Image.asset, Image.file, SvgPicture, Lottie, CachedNetworkImage, Container (for margin/padding/decoration/alignment/border), InkWell, GestureDetector, ClipRRect (for radius), SizedBox (for sizing), Shimmer (for loading)
**✅ Use instead:** `path` (handles all types automatically), `onTap` for interaction, `imageBorderRadius` or `decoration` for corners, `padding`/`margin` for spacing, `animationType` for different loading styles (shimmer, pulse, skeleton, wave)

```dart
SmartImage(
  path: 'https://example.com/image.png',
  size: 80.w,
  imageBorderRadius: BorderRadius.circular(10.r),
  onTap: () => print('Image tapped'),
)
```

## SmartImagePickDialogSheet
**Purpose:** A modal bottom sheet for choosing between Camera and Gallery source selection.
**Constructors:** SmartImagePickDialogSheet(...)
**Built-in props:** onTapSource, title, cameraLabel, galleryLabel, cameraIconPath, galleryIconPath, closeIconPath, primaryColor
**❌ DO NOT wrap with:** showModalBottomSheet (call `SmartImagePickDialogSheet.show` instead)
**✅ Use instead:** `SmartImagePickDialogSheet.show(context, ...)`

```dart
SmartImagePickDialogSheet.show(
  context,
  onTapSource: (source) => print(source),
)
```

## SmartNoDataFound
**Purpose:** A centered empty-state widget with optional image, text, subtext, and retry button.
**Constructors:** SmartNoDataFound(...)
**Built-in props:** text, subText, imagePath, textStyle, subTextStyle, imageWidth, imageHeight, onRetry, retryText, isImageShow
**❌ DO NOT wrap with:** Center, Column
**✅ Use instead:** `text` for main message, `onRetry` to show a retry button

```dart
SmartNoDataFound(
  text: 'No Results Found',
  onRetry: () => fetchData(),
)
```

## SmartRadioButton
**Purpose:** A customizable radio button with optional label and toggle support.
**Constructors:** SmartRadioButton(...)
**Built-in props:** label, value, groupValue, onChanged, textStyle, activeColor, inactiveColor, padding, textLabel, isToggle, focusNode, size
**❌ DO NOT wrap with:** GestureDetector, Padding, Row
**✅ Use instead:** `label` for text, `padding` for spacing, `isToggle: true` to allow deselecting

```dart
SmartRadioButton<int>(
  label: 'Option A',
  value: 1,
  groupValue: _selected,
  onChanged: (val) => setState(() => _selected = val),
)
```

## SmartRow
**Purpose:** A flexible [Row] with built-in spacing, padding, margin, alignment, tap handling, and optional [Expanded] wrapping.
**Constructors:** SmartRow(...)
**Built-in props:** children, spacing, padding, margin, width, height, onTap, isInkwell, color, decoration, expanded, alignment, mainAxisSize, mainAxisAlignment, crossAxisAlignment, textDirection, verticalDirection, textBaseline
**❌ DO NOT wrap with:** Row, Padding, Container (for margin/decoration/color/alignment), GestureDetector, InkWell, Expanded, SizedBox (between children for spacing)
**✅ Use instead:** `children` for content, `spacing` for gap between items, `padding`/`margin` for spacing, `onTap` for interaction, `expanded: true` for Expanded

```dart
SmartRow(
  spacing: 8.w,
  alignment: Alignment.centerLeft,
  children: [ Icon(Icons.star), Text('Favorite') ],
)
```

## SmartSingleChildScrollView
**Purpose:** Enhanced [SingleChildScrollView] with pull-to-refresh, keyboard dismissal on tap, and SafeArea support.
**Constructors:** SmartSingleChildScrollView(...)
**Built-in props:** child, controller, scrollDirection, physics, reverse, padding, primary, dragStartBehavior, clipBehavior, restorationId, keyboardDismissBehavior, onRefresh, safeArea
**❌ DO NOT wrap with:** SingleChildScrollView, RefreshIndicator, GestureDetector (for keyboard dismissal), SafeArea, Padding
**✅ Use instead:** `child` for content, `onRefresh` for pull-to-refresh, `safeArea: true` for SafeArea, `padding` for inner spacing

```dart
SmartSingleChildScrollView(
  onRefresh: () async => print('Refreshing...'),
  padding: EdgeInsets.all(16.w),
  child: Column(...),
)
```

## SmartStepper
**Purpose:** A vertical timeline-style stepper with animated states and connecting lines.
**Constructors:** SmartStepper(...)
**Built-in props:** currentStep, steps (SmartStep), activeColor, completedColor, upcomingColor, isDashedLine, completedIcon, upcomingIcon
**❌ DO NOT wrap with:** Column, AnimatedList, SizedBox (for spacing between steps)
**✅ Use instead:** `currentStep` to control progress, `steps` to define content

```dart
SmartStepper(
  currentStep: 1,
  steps: [ SmartStep(title: Text('Step 1'), content: Text('Done')) ],
)
```

## SmartTabBar
**Purpose:** A customizable [TabBar] + views widget that manages its own [TabController].
**Constructors:** SmartTabBar(...)
**Built-in props:** length, tabs, tabBarView, onTabInitialized, isScrollable, onTapTab, physics, tabBetweenView, tabBarColor, indicatorColor, labelColor, unselectedLabelColor, labelPadding, labelStyle, unselectedLabelStyle, indicatorSize, indicatorHeight, dividerColor, tabAlignment, padding, isExpanded
**❌ DO NOT wrap with:** TabBar, TabBarView, Column, Expanded (for views)
**✅ Use instead:** `tabs` for headers, `tabBarView` for content, `isExpanded: true` to expand the view to fill available space

```dart
SmartTabBar(
  length: 2,
  tabs: [ Tab(text: 'Active'), Tab(text: 'History') ],
  tabBarView: [ ActiveList(), HistoryList() ],
)
```

## SmartText
**Purpose:** Enhanced [Text] or [AutoSizeText] with color/weight overrides, padding, tap handling, and wrapping support.
**Constructors:** SmartText(...)
**Built-in props:** text, color, style, fontWeight, optionalPadding, overflow, textAlign, decoration, maxLines, onTap, isAutoSizeText, expanded, flexible, flex
**❌ DO NOT wrap with:** Text, AutoSizeText, Padding (for optionalPadding), GestureDetector, Expanded, Flexible
**✅ Use instead:** `text` (positional), `optionalPadding` for spacing, `onTap` for interaction, `expanded: true` for Expanded, `flexible: true` for Flexible

```dart
SmartText(
  'Welcome Home',
  style: config.textStyle.copyWith(color: Colors.blue),
  expanded: true,
)
```

## SmartTextField
**Purpose:** A customizable [TextFormField] with built-in label, hint, error states, password toggle, focus management, and search variant.
**Constructors:** SmartTextField(...), SmartTextField.search(...)
**Built-in props:** controller, hintText, obscured, readOnly, keyboardType, textInputAction, textCapitalization, autofillHints, fillColor, onValueChanges, onFieldSubmitted, validator, textInputFormatter, contentPadding, errorText, hintStyle, labelText, labelStyle, padding, maxLines, maxLength, expand, height, style, errorStyle, suffixIcon, prefixIcon, focusNode, nextFocusNode, isEnabled, isRequired, enabledBorderRadius, enabledBorderColor, focusedBorderColor, disabledBorderColor, cursorColor, autofocus, onTapUpOutside, onEditingComplete, borderRadius, suffixText, prefixText, onTap, cursorHeight, textAlign, alignLabelWithHint, enableLabeling, enableBorder
**❌ DO NOT wrap with:** TextFormField, Padding (for padding), Column (for error/label), GestureDetector (for focus management), Stack (for password icon)
**✅ Use instead:** `hintText` for hint, `labelText`/`enableLabeling` for labels, `errorText` for errors, `obscured: true` for password fields, `nextFocusNode` to chain inputs

```dart
SmartTextField(
  hintText: 'Enter Email',
  onValueChanges: (val) => print(val),
  isRequired: true,
)
```

---

## Global Config Reference

Configure these globally in `main()` using `SmartDevWidgetsConfig().initialize(...)`.

| Parameter | Type | Default Value |
|---|---|---|
| **SmartColumn** | | |
| `columnMainAxisSize` | `MainAxisSize` | `MainAxisSize.max` |
| `columnMainAxisAlignment` | `MainAxisAlignment` | `MainAxisAlignment.start` |
| `columnCrossAxisAlignment` | `CrossAxisAlignment` | `CrossAxisAlignment.center` |
| `columnVerticalDirection` | `VerticalDirection` | `VerticalDirection.down` |
| `columnTextBaseline` | `TextBaseline?` | `TextBaseline.alphabetic` |
| `columnSpacing` | `double` | `0` |
| `columnPadding` | `EdgeInsetsGeometry?` | `null` |
| `columnMargin` | `EdgeInsetsGeometry?` | `null` |
| `columnIsInkwell` | `bool` | `false` |
| `columnIsSafeArea` | `bool` | `false` |
| `columnDecoration` | `BoxDecoration?` | `null` |
| `columnAlignment` | `AlignmentGeometry?` | `null` |
| `columnClipBehavior` | `Clip` | `Clip.none` |
| **SmartRow** | | |
| `rowMainAxisSize` | `MainAxisSize` | `MainAxisSize.max` |
| `rowMainAxisAlignment` | `MainAxisAlignment` | `MainAxisAlignment.start` |
| `rowCrossAxisAlignment` | `CrossAxisAlignment` | `CrossAxisAlignment.center` |
| `rowVerticalDirection` | `VerticalDirection` | `VerticalDirection.down` |
| `rowTextBaseline` | `TextBaseline?` | `null` |
| `rowPadding` | `EdgeInsetsGeometry?` | `null` |
| `rowMargin` | `EdgeInsetsGeometry?` | `null` |
| `rowIsInkwell` | `bool` | `false` |
| `rowDecoration` | `Decoration?` | `null` |
| `rowSpacing` | `double` | `0` |
| **SmartText** | | |
| `textStyle` | `TextStyle` | `fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black` |
| `textColor` | `Color?` | `null` |
| `textFontWeight` | `FontWeight?` | `null` |
| `textOptionalPadding` | `EdgeInsetsGeometry?` | `null` |
| `textOverflow` | `TextOverflow?` | `null` |
| `textAlign` | `TextAlign?` | `null` |
| `textDecoration` | `TextDecoration?` | `null` |
| `textMaxLines` | `int?` | `null` |
| `textIsAutoSizeText` | `bool` | `false` |
| **SmartButton** | | |
| `buttonIsLoading` | `bool` | `false` |
| `buttonIsEnabled` | `bool` | `true` |
| `buttonIsShadow` | `bool` | `false` |
| `buttonHeight` | `double` | `48.0` |
| `buttonWidth` | `double?` | `null` |
| `buttonActiveBackgroundColor` | `Color` | `Colors.blue` |
| `buttonDisableBackgroundColor` | `Color` | `Colors.grey` |
| `buttonBorderRadius` | `BorderRadiusGeometry` | `BorderRadius.circular(8)` |
| `buttonTitleStyle` | `TextStyle` | `fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white` |
| `buttonDisableTitleStyle` | `TextStyle` | `fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white70` |
| `buttonBorderColor` | `Color?` | `null` |
| `buttonPadding` | `EdgeInsetsDirectional` | `horizontal: 12` |
| `buttonMargin` | `EdgeInsetsDirectional?` | `null` |
| `buttonActiveImageColor` | `Color` | `Colors.white` |
| `buttonDisableImageColor` | `Color` | `Colors.white70` |
| `buttonImageSize` | `double` | `24.0` |
| `buttonBoxShadow` | `BoxShadow?` | `null` |
| `buttonIsWhite` | `bool` | `false` |
| **SmartSingleChildScrollView** | | |
| `scrollViewScrollDirection` | `Axis` | `Axis.vertical` |
| `scrollViewReverse` | `bool` | `false` |
| `scrollViewPadding` | `EdgeInsetsGeometry?` | `null` |
| `scrollViewPrimary` | `bool?` | `null` |
| `scrollViewDragStartBehavior` | `DragStartBehavior` | `DragStartBehavior.start` |
| `scrollViewClipBehavior` | `Clip` | `Clip.hardEdge` |
| `scrollViewKeyboardDismissBehavior` | `ScrollViewKeyboardDismissBehavior` | `manual` |
| `scrollViewSafeArea` | `bool` | `false` |
| **SmartImage** | | |
| `imageFit` | `BoxFit` | `BoxFit.cover` |
| `imageBorderRadius` | `BorderRadiusGeometry?` | `null` |
| `imageBackgroundColor` | `Color?` | `null` |
| `imagePadding` | `EdgeInsetsGeometry?` | `null` |
| `imageMargin` | `EdgeInsetsGeometry?` | `null` |
| `imageInkwellBorderRadius` | `BorderRadius?` | `null` |
| `imageBorder` | `BoxBorder?` | `null` |
| `imageIsMemCacheEnabled` | `bool` | `true` |
| `imageMatchTextDirection` | `bool` | `false` |
| `imageShape` | `BoxShape` | `BoxShape.rectangle` |
| `imagePlaceholderPath` | `String?` | `'assets/images/placeholder.png'` |
| `imageLoadingColor` | `Color` | `Colors.blue` |
| `imageHeight` | `double` | `100.0` |
| `imageWidth` | `double` | `100.0` |
| `imageLoadingAnimationType` | `LoadingAnimationType` | `shimmer` |
| `imageShowLoadingAnimation` | `bool` | `true` |
| **SmartExpansionTile** | | |
| `expansionTilePadding` | `EdgeInsetsGeometry?` | `null` |
| `expansionTileMargin` | `EdgeInsetsGeometry?` | `null` |
| `expansionTileBackgroundColor` | `Color?` | `null` |
| `expansionTileTrailingExpandedIconPath` | `String` | `'assets/images/arrow_up.svg'` |
| `expansionTileTrailingCollapsedIconPath`| `String` | `'assets/images/arrow_down.svg'` |
| `expansionTileTrailingCollapsedIconVisible`| `bool` | `true` |
| `expansionTileUsePageStorage` | `bool` | `true` |
| `expansionTileAnimationDuration` | `Duration` | `200ms` |
| `expansionTileAnimationCurve` | `Curve` | `Curves.easeInOut` |
| **SmartTextField** | | |
| `textFieldStyle` | `TextStyle` | `fontSize: 14, color: Colors.black87` |
| `textFieldHintStyle` | `TextStyle` | `fontSize: 14, color: Colors.grey` |
| `textFieldLabelStyle` | `TextStyle` | `fontSize: 12, color: Colors.grey` |
| `textFieldErrorStyle` | `TextStyle` | `fontSize: 12, color: Colors.red` |
| `textFieldFillColor` | `Color` | `Color(0xFFF5F5F5)` |
| `textFieldEnabledBorderColor` | `Color` | `Color(0xFFDDDDDD)` |
| `textFieldFocusedBorderColor` | `Color` | `Colors.blue` |
| `textFieldDisabledBorderColor` | `Color` | `Color(0xFFEEEEEE)` |
| `textFieldErrorBorderColor` | `Color` | `Colors.red` |
| `textFieldCursorColor` | `Color` | `Colors.black87` |
| **SmartCheckbox** | | |
| `checkboxActiveColor` | `Color` | `Colors.blue` |
| `checkboxCheckColor` | `Color` | `Colors.white` |
| `checkboxBorderColor` | `Color` | `Colors.grey` |
| `checkboxLabelStyle` | `TextStyle` | `fontSize: 14, color: Colors.black87` |
| **SmartRadioButton** | | |
| `radioButtonActiveColor` | `Color` | `Colors.blue` |
| `radioButtonInactiveColor` | `Color` | `Colors.grey` |
| `radioButtonTextStyle` | `TextStyle` | `fontSize: 14, color: Colors.black87` |
| **SmartDropDown** | | |
| `dropdownBackgroundColor` | `Color` | `Colors.white` |
| **SmartAppBar / CommonAppBar** | | |
| `appBarBackgroundColor` | `Color` | `Colors.white` |
| `appBarTitleStyle` | `TextStyle` | `fontSize: 18, color: Colors.black87` |
| **SmartStepper** | | |
| `stepperActiveColor` | `Color` | `Colors.blue` |
| `stepperCompletedColor` | `Color` | `Colors.green` |
| `stepperUpcomingColor` | `Color` | `Colors.grey` |
| **SmartTabBar** | | |
| `tabBarDividerColor` | `Color?` | `null` |
| `tabBarUnselectedLabelColor` | `Color?` | `null` |
| `tabBarLabelStyle` | `TextStyle?` | `null` |
| `tabBarUnselectedLabelStyle` | `TextStyle?` | `null` |
| **SmartNoDataFound** | | |
| `noDataFoundImagePath` | `String` | `'assets/images/placeholder.png'` |
| `noDataFoundText` | `String` | `'No data found'` |
| `noDataFoundRetryText` | `String` | `'Retry'` |

---

## Top-level Anti-Wrap Rules Summary

| Found a need for... | DO NOT wrap with... | Use this prop instead |
|---|---|---|
| Spacing / Padding | `Padding` | `padding` / `optionalPadding` |
| Outer spacing | `Container(margin:...)` | `margin` |
| Background / Border | `Container` / `DecoratedBox` | `color` / `decoration` / `border` |
| Click / Tap / InkWell | `GestureDetector` / `InkWell` | `onTap` / `isInkwell` |
| Screen safety | `SafeArea` | `isSafeArea: true` / `safeArea: true` |
| Flex / Expansion | `Expanded` / `Flexible` | `expanded: true` / `flexible: true` |
| Sizing | `SizedBox` | `height` / `width` / `size` |
| Vertical gap | `SizedBox(height:...)` | `spacing` (in SmartColumn) |
| Horizontal gap | `SizedBox(width:...)` | `spacing` (in SmartRow) |
| Rounded Corners | `ClipRRect` | `imageBorderRadius` / `borderRadius` |
| Pull-to-refresh | `RefreshIndicator` | `onRefresh` |
| Loading state | `CircularProgressIndicator` | `isLoading: true` (SmartButton) |

---

## Forbidden raw widgets

Avoid using these raw widgets directly when a `Smart` equivalent exists:

- **Layout:** `Column` → `SmartColumn`, `Row` → `SmartRow`
- **Text:** `Text`, `AutoSizeText` → `SmartText`
- **Fields:** `TextField`, `TextFormField` → `SmartTextField`
- **Buttons:** `ElevatedButton`, `TextButton`, `OutlinedButton`, `MaterialButton` → `SmartButton`
- **Images:** `Image.network`, `Image.asset`, `Image.file`, `SvgPicture`, `Lottie.asset`, `CachedNetworkImage` → `SmartImage`
- **Check/Radio:** `Checkbox`, `Radio` → `SmartCheckbox`, `SmartRadioButton`
- **Scroll:** `SingleChildScrollView` → `SmartSingleChildScrollView`
- **Navigation:** `AppBar` → `SmartAppBar`, `SmartCommonAppBar`
- **Tabs:** `TabBar`, `TabBarView` → `SmartTabBar`
- **Empty State:** Manual center/column/image stacks → `SmartNoDataFound`
- **Dividers:** `Divider` → `SmartDashedDivider`, `SmartGradientContainer`
