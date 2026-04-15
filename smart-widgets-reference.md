# SmartDevWidgets Reference Guide

This document defines the properties and anti-wrap rules for the `smart_dev_widgets` library. Use this to prevent unnecessary widget nesting and ensure consistent development patterns.

## SmartColumn
**Purpose:** A customizable Column with built-in spacing, padding, margin, tap handling, and SafeArea support.
**Constructors:** SmartColumn(...)
**Built-in props:** mainAxisSize, mainAxisAlignment, crossAxisAlignment, textDirection, verticalDirection, textBaseline, children, padding, margin, width, height, color, onTap, isInkwell, expanded, decoration, alignment, clipBehavior, spacing, isSafeArea
**❌ DO NOT wrap with:** Padding, Container, InkWell, GestureDetector, SafeArea, Expanded, SizedBox (between children)
**✅ Use instead:** `padding` for Padding, `margin`/`decoration`/`width`/`height`/`alignment` for Container, `onTap` for InkWell/GestureDetector, `isSafeArea` for SafeArea, `expanded` for Expanded, `spacing` for manually adding SizedBox between children.
**Example:**
```dart
SmartColumn(
  spacing: 12,
  padding: EdgeInsets.all(16),
  isSafeArea: true,
  children: [ ... ],
)
```

## SmartRow
**Purpose:** A flexible Row with built-in spacing, padding, margin, alignment, tap handling, and optional Expanded wrapping.
**Constructors:** SmartRow(...)
**Built-in props:** children, textBaseline, mainAxisSize, mainAxisAlignment, crossAxisAlignment, textDirection, verticalDirection, padding, margin, width, height, onTap, isInkwell, color, decoration, expanded, spacing, alignment
**❌ DO NOT wrap with:** Padding, Container, InkWell, GestureDetector, Expanded, SizedBox (between children)
**✅ Use instead:** `padding` for Padding, `margin`/`decoration`/`width`/`height`/`alignment` for Container, `onTap` for InkWell/GestureDetector, `expanded` for Expanded, `spacing` for manually adding SizedBox between children.
**Example:**
```dart
SmartRow(
  spacing: 10,
  expanded: true,
  onTap: () => print('Tapped row'),
  children: [ ... ],
)
```

## SmartText
**Purpose:** An enhanced Text or AutoSizeText with color/weight overrides, optional padding, and layout wrapping support.
**Constructors:** SmartText(text, ...)
**Built-in props:** color, style, fontWeight, optionalPadding, overflow, textAlign, decoration, maxLines, onTap, isAutoSizeText, expanded, flexible, flex
**❌ DO NOT wrap with:** Padding, GestureDetector, Expanded, Flexible
**✅ Use instead:** `optionalPadding` for Padding, `onTap` for GestureDetector, `expanded` for Expanded, `flexible` for Flexible.
**Example:**
```dart
SmartText(
  'Hello SmartDev',
  color: Colors.blue,
  optionalPadding: EdgeInsets.only(top: 8),
  expanded: true,
)
```

## SmartTextField
**Purpose:** A customizable TextFormField with built-in labels, search variant, password toggle, and focus management.
**Constructors:** SmartTextField(...), SmartTextField.search(...)
**Built-in props:** controller, style, hintText, hintStyle, padding, labelText, labelStyle, errorText, obscured, readOnly, keyboardType, textInputAction, onValueChanges, validator, height, maxLines, suffixIcon, prefixIcon, focusNode, nextFocusNode, isEnabled, isRequired, enabledBorderRadius, cursorColor, onTapUpOutside, suffixText, prefixText, borderRadius, isSearch, enableLabeling, enableBorder
**❌ DO NOT wrap with:** Padding, TapRegion, SizedBox (for height), GestureDetector (for tap outside)
**✅ Use instead:** `padding` for Padding, `onTapUpOutside` to handle keyboard dismissal/focus, `height` for sizing.
**Example:**
```dart
SmartTextField(
  labelText: 'Email',
  hintText: 'Enter your email',
  onTapUpOutside: (p) => FocusScope.of(context).unfocus(),
)
```

## SmartButton
**Purpose:** A feature-rich button with loading state, bounce animation, prefix/suffix images, and enabled/disabled/white variants.
**Constructors:** SmartButton(...), SmartButton.white(...)
**Built-in props:** onTap, title, isLoading, isEnabled, isShadow, height, width, activeBackgroundColor, disableBackgroundColor, borderRadius, titleStyle, padding, margin, prefixImage, suffixImage, imageSize, boxShadow, isWhite
**❌ DO NOT wrap with:** Padding, Container, SizedBox (for sizing), Manual Loading Indicators
**✅ Use instead:** `padding` for Padding, `margin`/`boxShadow` for Container, `height`/`width` for SizedBox, `isLoading: true` for progress indicator.
**Example:**
```dart
SmartButton(
  title: 'Submit',
  onTap: () {},
  isLoading: isBusy,
  margin: EdgeInsets.symmetric(horizontal: 20),
)
```

## SmartImage
**Purpose:** Universal image viewer supporting assets, files, network (cached), SVGs, and Lottie with animated loaders.
**Constructors:** SmartImage(...)
**Built-in props:** path, height, width, size, fit, imageBorderRadius, color, backgroundColor, onTap, padding, margin, inkwellBorderRadius, border, isMemCacheEnabled, shape, clipBehavior, decoration, alignment, animationType, showLoadingAnimation
**❌ DO NOT wrap with:** Padding, Container, InkWell, ClipRRect, Align, Image.network, Image.asset, SvgPicture, Lottie.asset, CachedNetworkImage
**✅ Use instead:** `padding` for Padding, `margin`/`decoration`/`border` for Container, `onTap` for InkWell, `imageBorderRadius` for ClipRRect, `alignment` for Align. Handle all image types via `path`.
**Example:**
```dart
SmartImage(
  path: 'https://example.com/image.png',
  size: 80,
  imageBorderRadius: BorderRadius.circular(40),
  onTap: () {},
)
```

## SmartCheckbox
**Purpose:** Customizable checkbox with optional label and a radio-style variant.
**Constructors:** SmartCheckbox(...), SmartCheckbox.radio(...)
**Built-in props:** label, value, onChanged, labelStyle, height, width, activeColor, checkColor, borderColor, padding, mainAxisSize, spaceBetweenLabelAndCheckbox, isRadio
**❌ DO NOT wrap with:** Padding, Row (for label), InkWell
**✅ Use instead:** `padding` for Padding, `label` for Row/Text combo, `onChanged` (internal InkWell) for tap area.
**Example:**
```dart
SmartCheckbox(
  label: 'Accept Terms',
  value: isAccepted,
  onChanged: (val) => setState(() => isAccepted = val!),
)
```

## SmartRadioButton
**Purpose:** Customizable radio button with toggle support and label styling.
**Constructors:** SmartRadioButton(...)
**Built-in props:** label, value, groupValue, onChanged, textStyle, activeColor, inactiveColor, padding, textLabel, isToggle, size
**❌ DO NOT wrap with:** Padding, Row (for label), GestureDetector
**✅ Use instead:** `padding` for Padding, `label` for Row/Text combo, `onChanged` for tap handling.
**Example:**
```dart
SmartRadioButton<int>(
  label: 'Option 1',
  value: 1,
  groupValue: selected,
  onChanged: (val) => setState(() => selected = val),
)
```

## SmartDropDown
**Purpose:** Modal bottom-sheet dropdown with search filtering, error display, and custom item models.
**Constructors:** SmartDropDown(...)
**Built-in props:** onChanged, items, selectedItem, selectionWindowHeight, buttonHeight, hintText, labelText, borderRadius, border, contentPadding, textStyle, backgroundColor, isIcArrowDropDown, isExpanded, canSearch, errorText, emptyText, itemAlignment, searchHintText
**❌ DO NOT wrap with:** Column (for error text), Container (for styling), GestureDetector
**✅ Use instead:** `errorText` for built-in error display, `backgroundColor`/`border`/`borderRadius` for styling.
**Example:**
```dart
SmartDropDown<String>(
  items: [SmartDropDownItem(title: 'India', value: 'IN')],
  onChanged: (val) {},
  canSearch: true,
)
```

## SmartSingleChildScrollView
**Purpose:** Scroll view with pull-to-refresh, automatic keyboard dismissal, and SafeArea support.
**Constructors:** SmartSingleChildScrollView(...)
**Built-in props:** child, controller, scrollDirection, physics, reverse, padding, primary, dragStartBehavior, clipBehavior, restorationId, keyboardDismissBehavior, onRefresh, safeArea
**❌ DO NOT wrap with:** Padding, SafeArea, RefreshIndicator, GestureDetector (for keyboard dismiss)
**✅ Use instead:** `padding` for Padding, `safeArea` for SafeArea, `onRefresh` for RefreshIndicator.
**Example:**
```dart
SmartSingleChildScrollView(
  padding: EdgeInsets.all(16),
  onRefresh: () async => fetchData(),
  child: Column(...)
)
```

## SmartExpansionTile
**Purpose:** Animated expansion tile with custom trailing icons and PageStorage persistence.
**Constructors:** SmartExpansionTile(...)
**Built-in props:** leading, title, backgroundColor, onExpansionChanged, children, trailing, initiallyExpanded, trailingCollapsedIconVisible, isDisablePageStorage, padding, margin
**❌ DO NOT wrap with:** Padding, Container (for margin/bg)
**✅ Use instead:** `padding` for Padding, `margin`/`backgroundColor` for Container.
**Example:**
```dart
SmartExpansionTile(
  title: SmartText('Details'),
  children: [ SmartText('Expanded content') ],
)
```

## SmartTabBar
**Purpose:** Compound TabBar + TabBarView widget that manages its own TabController.
**Constructors:** SmartTabBar(...)
**Built-in props:** length, tabs, tabBarView, onTabInitialized, isScrollable, onTapTab, physics, tabBetweenView, tabBarColor, indicatorColor, labelColor, unselectedLabelColor, labelPadding, labelStyle, indicatorSize, dividerColor, padding, isExpanded
**❌ DO NOT wrap with:** Column (to stack tabs/view), DefaultTabController, Expanded
**✅ Use instead:** `isExpanded: true` for Expanded view, `tabBetweenView` for intermediate widgets.
**Example:**
```dart
SmartTabBar(
  length: 2,
  tabs: [ Tab(text: 'Home'), Tab(text: 'Settings') ],
  tabBarView: [ HomeView(), SettingsView() ],
)
```

## SmartAppBar
**Purpose:** Customizable AppBar with profile actions, back button, and skip mode logic.
**Constructors:** SmartAppBar(...)
**Built-in props:** title, leadingImage, actions, backgroundColor, appBarHeight, onBack, onSearch, onFavorite, onThreeDotAction, child, titleStyle, isCenter, isBack, isSkip, isBorder, optionalEndSpacing, padding, backIconPath
**❌ DO NOT wrap with:** PreferredSize (for height), Padding
**✅ Use instead:** `appBarHeight` for height, `padding` for internal spacing.
**Example:**
```dart
appBar: SmartAppBar(title: 'Profile', onSearch: () {})
```

## SmartCommonAppBar
**Purpose:** Streamlined AppBar for common headers with profile avatar and subtitle support.
**Constructors:** SmartCommonAppBar(...)
**Built-in props:** title, subtitle, showBackButton, showCloseButton, showNotificationIcon, profileImageUrl, onBackPressed, onClosePressed, onNotificationPressed, onProfilePressed, backgroundColor, customLogo, textStyle, toolbarHeight
**❌ DO NOT wrap with:** PreferredSize
**✅ Use instead:** `toolbarHeight` for height.
**Example:**
```dart
appBar: SmartCommonAppBar(title: 'Dashboard', profileImageUrl: '...')
```

## SmartStepper
**Purpose:** Animated vertical timeline-style stepper with state-based icons and dashed/solid lines.
**Constructors:** SmartStepper(...)
**Built-in props:** currentStep, steps, activeColor, completedColor, upcomingColor, isDashedLine, completedIcon, upcomingIcon
**❌ DO NOT wrap with:** AnimatedList, ListView, SingleChildScrollView
**✅ Use instead:** `SmartStepper` handles internal animation and scrolling via `shrinkWrap: true`.
**Example:**
```dart
SmartStepper(
  currentStep: 1,
  steps: [ SmartStep(title: Text('Step 1'), content: Text('Done')) ],
)
```

## SmartCircularProgressIndicator
**Purpose:** Customizable progress indicator with padding and size controls.
**Constructors:** SmartCircularProgressIndicator(...)
**Built-in props:** size, color, strokeWidth, padding
**❌ DO NOT wrap with:** Padding, SizedBox (for size)
**✅ Use instead:** `padding` for Padding, `size` for SizedBox.
**Example:**
```dart
SmartCircularProgressIndicator(size: 40, padding: EdgeInsets.all(20))
```

## SmartNoDataFound
**Purpose:** Centered empty-state widget with image, text, and retry button.
**Constructors:** SmartNoDataFound(...)
**Built-in props:** text, subText, imagePath, textStyle, imageWidth, imageHeight, onRetry, retryText, isImageShow
**❌ DO NOT wrap with:** Center, Column
**✅ Use instead:** `SmartNoDataFound` is internally centered and uses a Column layout.
**Example:**
```dart
SmartNoDataFound(text: 'Empty Cart', onRetry: () => fetchData())
```

## SmartImagePickDialogSheet
**Purpose:** Modal bottom sheet for choosing between Camera and Gallery sources.
**Constructors:** SmartImagePickDialogSheet(...)
**Built-in props:** onTapSource, title, cameraLabel, galleryLabel, cameraIconPath, galleryIconPath, closeIconPath, primaryColor
**❌ DO NOT wrap with:** showModalBottomSheet (call `SmartImagePickDialogSheet.show` instead)
**✅ Use instead:** `SmartImagePickDialogSheet.show(context, ...)` static method.
**Example:**
```dart
SmartImagePickDialogSheet.show(context, onTapSource: (source) => pick(source))
```

## SmartDashedDivider
**Purpose:** Horizontal or vertical dashed line divider.
**Constructors:** SmartDashedDivider(...)
**Built-in props:** axis, color, dashSpace, dashWidth, strokeWidth, length
**❌ DO NOT wrap with:** SizedBox (for length)
**✅ Use instead:** `length` prop.
**Example:**
```dart
SmartDashedDivider(axis: Axis.vertical, length: 100, color: Colors.blue)
```

## SmartGradientContainer
**Purpose:** Decorative gradient line divider that fades in/out.
**Constructors:** SmartGradientContainer(...)
**Built-in props:** height, width, color, begin, end, colors, margin
**❌ DO NOT wrap with:** Container (for margin)
**✅ Use instead:** `margin` prop.
**Example:**
```dart
SmartGradientContainer(color: Colors.red, height: 4)
```

---

## Global Config Reference
**SmartDevWidgetsConfig().initialize(...)**
- `columnMainAxisSize`: MainAxisSize.max
- `columnMainAxisAlignment`: MainAxisAlignment.start
- `columnCrossAxisAlignment`: CrossAxisAlignment.center
- `columnSpacing`: 0 (double)
- `columnIsInkwell`: false
- `columnIsSafeArea`: false
- `rowMainAxisSize`: MainAxisSize.max
- `rowMainAxisAlignment`: MainAxisAlignment.start
- `rowCrossAxisAlignment`: CrossAxisAlignment.center
- `rowSpacing`: 0 (double)
- `rowIsInkwell`: false
- `textStyle`: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)
- `textIsAutoSizeText`: false
- `buttonHeight`: 48.0
- `buttonActiveBackgroundColor`: Colors.blue
- `buttonBorderRadius`: BorderRadius.circular(8)
- `buttonTitleStyle`: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)
- `imageHeight`: 100.0
- `imageWidth`: 100.0
- `imageFit`: BoxFit.cover
- `imagePlaceholderPath`: 'assets/images/placeholder.png'
- `imageLoadingAnimationType`: LoadingAnimationType.shimmer
- `imageShowLoadingAnimation`: true
- `expansionTileAnimationDuration`: 200ms
- `textFieldFillColor`: Color(0xFFF5F5F5)
- `textFieldEnabledBorderColor`: Color(0xFFDDDDDD)
- `textFieldFocusedBorderColor`: Colors.blue
- `checkboxActiveColor`: Colors.blue
- `appBarBackgroundColor`: Colors.white
- `appBarTitleStyle`: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)
- `stepperActiveColor`: Colors.blue
- `noDataFoundText`: 'No data found'

## Top-level Anti-Wrap Rules
| Wrapping Widget | Use Smart Prop |
| :--- | :--- |
| `Padding` | `padding` (or `optionalPadding` for SmartText) |
| `Container` / `SizedBox` | `margin`, `decoration`, `width`, `height`, `alignment` |
| `InkWell` / `GestureDetector` | `onTap`, `isInkwell` |
| `SafeArea` | `isSafeArea` (or `safeArea`) |
| `Expanded` / `Flexible` | `expanded`, `flexible` |
| `SizedBox` (spacing) | `spacing` (native property) |
| `ClipRRect` | `borderRadius` / `imageBorderRadius` |
| `RefreshIndicator` | `onRefresh` |

## Forbidden Raw Widgets
When a `Smart` equivalent exists, **NEVER** use these raw widgets without a valid structural reason:
- `Column` → use `SmartColumn`
- `Row` → use `SmartRow`
- `Text` / `AutoSizeText` → use `SmartText`
- `TextField` / `TextFormField` → use `SmartTextField`
- `ElevatedButton` / `TextButton` → use `SmartButton`
- `Image.network` / `asset` / `file` → use `SmartImage`
- `SvgPicture` → use `SmartImage`
- `Lottie` → use `SmartImage`
- `CachedNetworkImage` → use `SmartImage`
- `SingleChildScrollView` → use `SmartSingleChildScrollView`
- `ExpansionTile` → use `SmartExpansionTile`
- `TabBar` / `TabBarView` → use `SmartTabBar`
- `AppBar` → use `SmartAppBar` / `SmartCommonAppBar`
- `CircularProgressIndicator` → use `SmartCircularProgressIndicator`
- `Divider` → use `SmartDashedDivider` / `SmartGradientContainer`
