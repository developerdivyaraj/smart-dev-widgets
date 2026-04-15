# SmartDevWidgets

A collection of **reusable, customizable Flutter widgets** designed to simplify and accelerate UI development. Built by SmartDev, this package provides battle-tested widgets for common UI components with consistent styling, responsive design, and global configuration support.

[![pub version](https://img.shields.io/pub/v/smart_dev_widgets)](https://pub.dev/packages/smart_dev_widgets)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## ✨ Features

| Widget | Description |
|---|---|
| `SmartColumn` | `Column` with native spacing, padding, tap handling, SafeArea, and `Expanded` support |
| `SmartRow` | `Row` with native spacing, alignment, decoration, and tap handling |
| `SmartText` | `Text` / `AutoSizeText` with color, weight, padding, and `Expanded`/`Flexible` support |
| `SmartTextField` | Fully customizable text field with password toggle, search variant, and built-in error states |
| `SmartButton` | Full-featured button with bounce animation, loading state, prefix/suffix icons, white variant |
| `SmartCheckbox` | Checkbox and radial variants with custom color and label styling |
| `SmartRadioButton` | Customizable radio button with toggling support |
| `SmartDropDown` | Modal bottom sheet dropdown with search filtering and custom items |
| `SmartSingleChildScrollView` | Scroll view with pull-to-refresh, keyboard dismiss, and `ClampingScrollPhysics` default |
| `SmartImage` | Universal image viewer (asset, file, SVG, network, Lottie) with 4 animated loading styles |
| `SmartExpansionTile` | Animated expansion tile with custom icons and PageStorage control |
| `SmartTabBar` | Self-contained TabBar with views, page control, and custom indicators |
| `SmartAppBar` | Highly customizable AppBar with leading/action icons and skip mode |
| `SmartCommonAppBar` | Streamlined AppBar with profile headers and simplified back/close states |
| `SmartStepper` | Animated vertical stepper with dashed lines and state-based icons |
| `SmartCircularProgressIndicator` | Configurable circular progress indicator |
| `SmartNoDataFound` | Unified empty state widget with image, messaging, and retry actions |
| `SmartImagePickDialogSheet` | Elegant custom bottom sheet for Camera / Gallery source selection |
| `SmartDashedDivider` & `Gradient` | Decorative dashed dividers and gradient fade lines |
| `SmartDevWidgetsConfig` | Singleton for setting global defaults across all widgets |

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  smart_dev_widgets: ^0.0.6
```

Run:

```bash
flutter pub get
```

### Peer dependencies

These are included automatically but listed here for reference:

```yaml
dependencies:
  flutter_screenutil: ^5.9.3
  auto_size_text: ^3.0.0
  cached_network_image: ^3.4.1
  flutter_svg: ^2.2.4
  shimmer: ^3.0.0
  lottie: ^3.3.3
```

> **Requires Flutter ≥ 3.27.0** for native `Column.spacing` / `Row.spacing` support.

---

## ⚙️ Setup

Initialize `SmartDevWidgetsConfig` once in `main()` and wrap your app with `ScreenUtilInit`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

void main() {
  SmartDevWidgetsConfig().initialize(
    // SmartColumn defaults
    columnSpacing: 8.0,
    columnCrossAxisAlignment: CrossAxisAlignment.start,
    // SmartText defaults
    textStyle: TextStyle(fontSize: 14, color: Colors.black87),
    // SmartButton defaults
    buttonActiveBackgroundColor: Colors.blue,
    buttonHeight: 48.0,
    // SmartImage defaults
    imageHeight: 100.0,
    imageWidth: 100.0,
    imageLoadingAnimationType: LoadingAnimationType.shimmer,
    // ... (see full Config Reference below)
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(home: child),
      child: const HomePage(),
    );
  }
}
```

---

## 🧩 Widget Usage

### SmartColumn

A `Column` with built-in **native spacing**, padding, margin, tap handling, and SafeArea.

```dart
SmartColumn(
  spacing: 12.0,           // native Column.spacing (no manual SizedBox needed)
  padding: EdgeInsets.all(16),
  crossAxisAlignment: CrossAxisAlignment.start,
  isSafeArea: true,
  onTap: () => print('tapped'),
  isInkwell: true,
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

---

### SmartRow

A `Row` with **native spacing**, alignment, decoration, and tap handling.

```dart
SmartRow(
  spacing: 8.0,            // native Row.spacing (Flutter 3.27+)
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  alignment: Alignment.center,
  padding: EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  ),
  children: [
    Icon(Icons.star),
    Text('Rating'),
    Text('4.5'),
  ],
)
```

---

### SmartText

Enhanced `Text` or `AutoSizeText` with color/weight overrides, optional padding, and layout helpers.

```dart
SmartText(
  'Hello World',
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  color: Colors.blue,
  overflow: TextOverflow.ellipsis,
  maxLines: 2,
  optionalPadding: EdgeInsets.symmetric(vertical: 4),
  isAutoSizeText: true,
  onTap: () => print('text tapped'),
)

// Inside a Row — use expanded or flexible
SmartText('Label', expanded: true)
SmartText('Value', flexible: true, flex: 2)
```

---

### SmartButton

Full-featured button with **bounce animation**, loading state, prefix/suffix image support.

```dart
// Default button
SmartButton(
  title: 'Submit',
  onTap: () => print('submitted'),
  isLoading: false,
  isEnabled: true,
  activeBackgroundColor: Colors.blue,
  prefixImage: 'assets/icons/send.svg',
  height: 52.0,
  borderRadius: BorderRadius.circular(12),
)

// White outlined variant
SmartButton.white(
  title: 'Cancel',
  onTap: () {},
  borderColor: Colors.blue,
)
```

**Parameters:**

| Parameter | Type | Description |
|---|---|---|
| `title` | `String` | Button label |
| `onTap` | `VoidCallback` | Tap callback |
| `isLoading` | `bool` | Shows `SmartCircularProgressIndicator` |
| `isEnabled` | `bool` | Disables tap and applies disable style |
| `isShadow` | `bool` | Adds colored drop shadow |
| `isWhite` | `bool` | White background with colored border |
| `prefixImage` | `String?` | Path to prefix icon (any `SmartImage` type) |
| `suffixImage` | `String?` | Path to suffix icon |
| `height` / `width` | `double?` | Button dimensions |
| `activeBackgroundColor` | `Color?` | Active state background |
| `disableBackgroundColor` | `Color?` | Disabled state background |
| `borderRadius` | `BorderRadiusGeometry?` | Corner radius |
| `titleStyle` | `TextStyle?` | Active title style (merged with config) |
| `boxShadow` | `BoxShadow?` | Custom shadow |

---

### SmartSingleChildScrollView

Scroll view with **pull-to-refresh**, automatic keyboard dismiss, and `SafeArea` support.

```dart
SmartSingleChildScrollView(
  safeArea: true,
  padding: EdgeInsets.all(16),
  onRefresh: () async {
    await loadData();
  },
  child: Column(
    children: [...],
  ),
)
```

---

### SmartImage

Universal image loader — supports **assets, files, network, SVG, and Lottie** with 4 animated loading styles.

```dart
// Asset image
SmartImage(path: 'assets/images/banner.png', width: 200, height: 120)

// Network image with shimmer loading
SmartImage(
  path: 'https://example.com/photo.jpg',
  size: 80,                     // sets both height & width
  imageBorderRadius: BorderRadius.circular(40),
  animationType: LoadingAnimationType.shimmer,
  showLoadingAnimation: true,
  onTap: () => openPhoto(),
)

// SVG (auto-detected by .svg extension)
SmartImage(path: 'assets/icons/logo.svg', color: Colors.white)

// Network SVG
SmartImage(path: 'https://example.com/icon.svg', size: 32)

// Lottie animation (auto-detected by .json extension)
SmartImage(path: 'assets/animations/success.json', size: 120)

// Custom decoration
SmartImage(
  path: 'https://example.com/cover.jpg',
  height: 200,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
  ),
  fit: BoxFit.cover,
)
```

**New parameters in v0.0.4:**

| Parameter | Type | Default | Description |
|---|---|---|---|
| `size` | `double?` | – | Shortcut: sets both `height` and `width` |
| `clipBehavior` | `Clip` | `Clip.none` | Container clip behavior |
| `decoration` | `Decoration?` | – | Overrides default `BoxDecoration` |
| `alignment` | `AlignmentGeometry?` | – | Child alignment within container |
| `animationType` | `LoadingAnimationType` | `shimmer` | Shimmer / pulse / skeleton / wave |
| `showLoadingAnimation` | `bool` | `true` | Toggle animated vs. static placeholder |

**Loading animation types:**

| Type | Description |
|---|---|
| `shimmer` | Horizontal shimmer sweep (default) |
| `pulse` | Fade in/out pulsing effect |
| `skeleton` | Card-shaped skeleton blocks |
| `wave` | Diagonal gradient wave |

---

### SmartExpansionTile

Animated expand/collapse tile with configurable trailing icons and PageStorage control.

```dart
SmartExpansionTile(
  title: SmartText('FAQ Item', style: TextStyle(fontWeight: FontWeight.w600)),
  initiallyExpanded: false,
  isDisablePageStorage: true,   // always starts collapsed (no state persistence)
  trailingCollapsedIconVisible: true,
  onExpansionChanged: (expanded) => print('expanded: $expanded'),
  children: [
    Padding(
      padding: EdgeInsets.all(12),
      child: SmartText('Answer content here...'),
    ),
  ],
)
```

**New in v0.0.4:**

| Parameter | Type | Default | Description |
|---|---|---|---|
| `isDisablePageStorage` | `bool` | `false` | Disables PageStorage — tile always uses `initiallyExpanded` |

---

### SmartCircularProgressIndicator

Configurable circular progress indicator — used internally by `SmartButton`.

```dart
SmartCircularProgressIndicator(
  size: 32,
  color: Colors.white,
  strokeWidth: 3,
  padding: EdgeInsets.all(8),
)
```

---

## 🛠 Global Configuration

`SmartDevWidgetsConfig` is a **singleton** — call `initialize()` once at startup.

### Full Config Reference

```dart
SmartDevWidgetsConfig().initialize(
  // ── SmartColumn ─────────────────────────────────────────────
  columnMainAxisAlignment: MainAxisAlignment.start,
  columnCrossAxisAlignment: CrossAxisAlignment.center,
  columnSpacing: 0,
  columnPadding: null,
  columnMargin: null,
  columnIsInkwell: false,
  columnIsSafeArea: false,
  columnDecoration: null,

  // ── SmartRow ─────────────────────────────────────────────────
  rowMainAxisAlignment: MainAxisAlignment.start,
  rowCrossAxisAlignment: CrossAxisAlignment.center,
  rowSpacing: 0,                    // new in 0.0.4
  rowPadding: null,
  rowMargin: null,
  rowDecoration: null,

  // ── SmartText ────────────────────────────────────────────────
  textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  textColor: null,
  textFontWeight: null,
  textOptionalPadding: null,        // renamed from textOptionalPaddings
  textOverflow: null,
  textAlign: null,
  textMaxLines: null,
  textIsAutoSizeText: false,

  // ── SmartButton ──────────────────────────────────────────────
  buttonHeight: 48.0,
  buttonActiveBackgroundColor: Colors.blue,
  buttonDisableBackgroundColor: Colors.grey,
  buttonBorderRadius: BorderRadius.circular(8),
  buttonTitleStyle: TextStyle(fontSize: 16, color: Colors.white),
  buttonIsShadow: false,
  buttonIsWhite: false,
  buttonImageSize: 24.0,

  // ── SmartSingleChildScrollView ───────────────────────────────
  scrollViewSafeArea: false,
  scrollViewPadding: null,
  scrollViewKeyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,

  // ── SmartImage ───────────────────────────────────────────────
  imageHeight: 100.0,
  imageWidth: 100.0,
  imageFit: BoxFit.cover,
  imagePlaceholderPath: 'assets/images/placeholder.png',
  imageLoadingColor: Colors.blue,
  imageLoadingAnimationType: LoadingAnimationType.shimmer,  // new in 0.0.4
  imageShowLoadingAnimation: true,                          // new in 0.0.4
  imageShape: BoxShape.rectangle,
  imageIsMemCacheEnabled: true,

  // ── SmartExpansionTile ───────────────────────────────────────
  expansionTileAnimationDuration: Duration(milliseconds: 200),
  expansionTileAnimationCurve: Curves.easeInOut,
  expansionTileTrailingExpandedIconPath: 'assets/images/arrow_up.svg',
  expansionTileTrailingCollapsedIconPath: 'assets/images/arrow_down.svg',
  expansionTileTrailingCollapsedIconVisible: true,
  expansionTileUsePageStorage: true,

  // ── SmartTextField ──────────────────────────────────────────
  textFieldStyle: TextStyle(fontSize: 14, color: Colors.black87),
  textFieldHintStyle: TextStyle(fontSize: 14, color: Colors.grey),
  textFieldLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
  textFieldErrorStyle: TextStyle(fontSize: 12, color: Colors.red),
  textFieldFillColor: Color(0xFFF5F5F5),
  textFieldEnabledBorderColor: Color(0xFFDDDDDD),
  textFieldFocusedBorderColor: Colors.blue,
  textFieldDisabledBorderColor: Color(0xFFEEEEEE),
  textFieldErrorBorderColor: Colors.red,
  textFieldCursorColor: Colors.black87,

  // ── SmartCheckbox ───────────────────────────────────────────
  checkboxActiveColor: Colors.blue,
  checkboxCheckColor: Colors.white,
  checkboxBorderColor: Colors.grey,
  checkboxLabelStyle: TextStyle(fontSize: 14, color: Colors.black87),

  // ── SmartRadioButton ────────────────────────────────────────
  radioButtonActiveColor: Colors.blue,
  radioButtonInactiveColor: Colors.grey,
  radioButtonTextStyle: TextStyle(fontSize: 14, color: Colors.black87),

  // ── SmartDropDown ───────────────────────────────────────────
  dropdownBackgroundColor: Colors.white,

  // ── SmartAppBar / SmartCommonAppBar ─────────────────────────
  appBarBackgroundColor: Colors.white,
  appBarTitleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),

  // ── SmartStepper ────────────────────────────────────────────
  stepperActiveColor: Colors.blue,
  stepperCompletedColor: Colors.green,
  stepperUpcomingColor: Colors.grey,

  // ── SmartTabBar ─────────────────────────────────────────────
  tabBarDividerColor: null,
  tabBarUnselectedLabelColor: null,
  tabBarLabelStyle: null,
  tabBarUnselectedLabelStyle: null,

  // ── SmartNoDataFound ────────────────────────────────────────
  noDataFoundImagePath: 'assets/images/placeholder.png',
  noDataFoundText: 'No data found',
  noDataFoundRetryText: 'Retry',
);
```

---

## 🗂 Asset Setup

Add image assets to your app's `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/animations/   # for Lottie .json files
```

---

## 🧪 Testing

```bash
cd smart_dev_widgets
flutter test
```

---

## 📋 Changelog

See [CHANGELOG.md](CHANGELOG.md) for full version history.

---

## 🐛 Issues

Report bugs or request features on the [GitHub Issues page](https://github.com/developerdivyaraj/smart-dev-widgets/issues).

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

## 📬 Contact

For support: [developerdivyaraj@gmail.com](mailto:developerdivyaraj@gmail.com)

---

Built with ❤️ by [SmartDev](https://jadejadivyaraj04.github.io/my_protfolio/#/)
