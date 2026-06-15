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
  smart_dev_widgets: ^0.0.4
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
  flutter_svg: ^2.1.0
  shimmer: ^3.0.0
  lottie: ^3.1.0
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

## 🧩 Widget Reference

Each widget is designed to be self-contained and fall back to global [SmartDevWidgetsConfig] defaults.

### SmartColumn
A `Column` with built-in native spacing, padding, margin, tap handling, and `SafeArea`.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `children` | `List<Widget>` | **Required** | List of widgets to display vertically |
| `spacing` | `double` | `config` | Spacing between children (native `Column.spacing`) |
| `padding` | `EdgeInsetsGeometry?` | `config` | Inner padding of the column container |
| `margin` | `EdgeInsetsGeometry?` | `config` | Outer margin of the column container |
| `onTap` | `VoidCallback?` | `null` | Tap callback for the entire column |
| `isInkwell` | `bool` | `config` | Whether to show ripple effect on tap |
| `isSafeArea` | `bool` | `config` | Wraps the column in a `SafeArea` |
| `expanded` | `bool` | `false` | Wraps the entire column in an `Expanded` widget |
| `decoration` | `BoxDecoration?` | `config` | Decoration for the column container |
| `alignment` | `AlignmentGeometry?` | `config` | Alignment of the column within its parent |
| `color` | `Color?` | `null` | Background color for the column |
| `width` / `height` | `double?` | `null` | Explicit dimensions for the column |

---

### SmartRow
A `Row` with native spacing, alignment, decoration, and tap handling.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `children` | `List<Widget>` | **Required** | List of widgets to display horizontally |
| `spacing` | `double` | `config` | Spacing between children (native `Row.spacing`) |
| `mainAxisAlignment` | `MainAxisAlignment` | `config` | Horizontal alignment of children |
| `crossAxisAlignment` | `CrossAxisAlignment` | `config` | Vertical alignment of children |
| `padding` | `EdgeInsetsGeometry?` | `config` | Inner padding |
| `margin` | `EdgeInsetsGeometry?` | `config` | Outer margin |
| `onTap` | `VoidCallback?` | `null` | Tap callback |
| `isInkwell` | `bool` | `config` | Use `InkWell` vs `GestureDetector` |
| `decoration` | `Decoration?` | `config` | Row container decoration |
| `expanded` | `bool` | `false` | Wraps row in `Expanded` |

---

### SmartText
Enhanced `Text` or `AutoSizeText` with layout helpers and tap handling.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `text` | `String` | **Positional** | The string to display |
| `style` | `TextStyle?` | `config` | Base text style |
| `color` | `Color?` | `config` | Color override for the style |
| `fontWeight` | `FontWeight?` | `config` | Font weight override |
| `optionalPadding` | `EdgeInsetsGeometry?` | `config` | Padding around the text |
| `onTap` | `VoidCallback?` | `null` | Tap callback |
| `isAutoSizeText` | `bool` | `config` | Use `AutoSizeText` for responsive sizing |
| `expanded` | `bool` | `false` | Wraps text in `Expanded` |
| `flexible` | `bool` | `false` | Wraps text in `Flexible` |
| `flex` | `int` | `1` | Flex factor for expanded/flexible |

---

### SmartTextField
Fully customizable `TextFormField` with label, hint, and validation support.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `controller` | `TextEditingController?` | `null` | Controller for the field |
| `hintText` | `String?` | `null` | Placeholder text |
| `labelText` | `String?` | `null` | Floating label text |
| `obscured` | `bool` | `false` | Hides text (for passwords) |
| `onValueChanges` | `ValueChanged<String>?` | `null` | Callback on every change |
| `validator` | `FormFieldValidator?` | `null` | Form validation logic |
| `prefixIcon` | `Widget?` | `null` | Icon at the start |
| `suffixIcon` | `Widget?` | `null` | Icon at the end (auto password toggle if obscured) |
| `keyboardType`| `TextInputType?` | `null` | Input type (email, phone, etc.) |
| `isSearch` | `bool` | `false` | Use `.search` constructor for search styling |
| `isRequired` | `bool` | `false` | Adds '*' to label and enables validation markers |

---

### SmartButton
Premium button with bounce animation and loading state.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | `String` | **Required** | Button text label |
| `onTap` | `VoidCallback` | **Required** | Tap callback |
| `isLoading` | `bool` | `false` | Replaces title with a loader |
| `isEnabled` | `bool` | `true` | Enables/disables the button |
| `prefixImage` | `String?` | `null` | Icon path for start of button |
| `suffixImage` | `String?` | `null` | Icon path for end of button |
| `isWhite` | `bool` | `false` | Use `.white` variant for outlined style |
| `activeBackgroundColor`| `Color?` | `config` | Background color |
| `height` / `width` | `double?` | `config` | Dimensions |

---

### SmartImage
Universal image loader for all types.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `path` | `String` | **Required** | Image URI (Asset, URL, Local File, SVG, Lottie) |
| `size` | `double?` | `null` | Shortcut for both width and height |
| `fit` | `BoxFit` | `config` | How to fit the image |
| `imageBorderRadius` | `BorderRadius?` | `config` | Corner rounding |
| `animationType` | `LoadingAnimationType`| `shimmer` | `shimmer`, `pulse`, `skeleton`, `wave` |
| `onTap` | `VoidCallback?` | `null` | Interaction callback |

---

### SmartDropDown
Modal bottom sheet selection widget.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `items` | `List<SmartDropDownItem>` | **Required** | List of items to select from |
| `selectedItem` | `T?` | `null` | Currently selected item |
| `onChanged` | `ValueChanged<T?>` | **Required** | Selection callback |
| `canSearch` | `bool` | `false` | Enables search filtering in the bottom sheet |
| `hintText` | `String?` | `null` | Button placeholder |
| `errorText` | `String?` | `null` | Validation error message |

---

### SmartSingleChildScrollView
Enhanced `SingleChildScrollView` with pull-to-refresh.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `child` | `Widget` | **Required** | Scrollable content |
| `onRefresh` | `RefreshCallback?` | `null` | Enables pull-to-refresh |
| `safeArea` | `bool` | `config` | Wraps view in `SafeArea` |
| `padding` | `EdgeInsetsGeometry?` | `config` | Inner padding |

---

### SmartExpansionTile
Animated expand/collapse tile.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | `Widget` | **Required** | Header content |
| `children` | `List<Widget>` | `[]` | Expandable content |
| `initiallyExpanded` | `bool`| `false` | Starting state |
| `isDisablePageStorage`| `bool` | `false` | Don't persist state on scroll |

---

### SmartTabBar
Self-contained `TabBar` + `TabBarView` manager.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `length` | `int` | **Required** | Number of tabs |
| `tabs` | `List<Widget>` | **Required** | Tab header widgets |
| `tabBarView`| `List<Widget>` | **Required** | Tab content widgets |
| `isExpanded`| `bool` | `true` | Whether views should expand to fill space |

---

### SmartStepper
Animated vertical timeline/stepper.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `currentStep`| `int` | **Required** | Current active index |
| `steps` | `List<SmartStep>` | **Required** | Step titles and content |
| `isDashedLine`| `bool` | `true` | Style of the connecting line |

---

### SmartNoDataFound
Standard empty state display.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `text` | `String?` | `config` | Main message |
| `subText` | `String?` | `null` | Detailed description |
| `imagePath` | `String?` | `config` | Path to empty-state illustration |
| `onRetry` | `VoidCallback?` | `null` | Optional retry button callback |

---

### SmartAppBar / SmartCommonAppBar
Highly configurable navigation headers.

| Parameter | Type | Description |
|---|---|---|
| `title` | `String?` | AppBar title |
| `isBack` | `bool` | Show back button (Navigator.pop default) |
| `leadingImage` | `String?` | Custom leading icon/logo |
| `onSearch`/`onFavorite` | `VoidCallback?` | Common action triggers |
| `profileImageUrl` | `String?` | Shows circular avatar (CommonAppBar) |

---

### SmartCheckbox & SmartRadioButton
Custom selection controls.

| Parameter | Type | Description |
|---|---|---|
| `label` | `String?` | Text label next to control |
| `value` | `T` / `bool` | Current selection state |
| `onChanged` | `ValueChanged` | Toggle callback |
| `isToggle` | `bool` | Allows deselecting currently active radio |

---

### SmartDashedDivider & SmartGradientContainer
Decorative line widgets.

| Parameter | Type | Description |
|---|---|---|
| `axis` | `Axis` | Horizontal or Vertical (Divider) |
| `dashWidth` / `dashSpace` | `double` | Dashing configuration |
| `color` / `colors` | `Color/List` | Line colors (GradientContainer defaults to fade) |
| `height` / `width` | `double?` | Explicit dimensions |

---

## 🛠 Global Configuration

Initialize `SmartDevWidgetsConfig` once in `main()` to set default styles across the entire app.

```dart
SmartDevWidgetsConfig().initialize(
  // SmartColumn
  columnMainAxisSize: MainAxisSize.max,
  columnMainAxisAlignment: MainAxisAlignment.start,
  columnSpacing: 0,
  columnPadding: null,
  columnIsInkwell: false,
  columnIsSafeArea: false,

  // SmartRow
  rowMainAxisSize: MainAxisSize.max,
  rowSpacing: 0,

  // SmartText
  textStyle: TextStyle(fontSize: 14, color: Colors.black),
  textIsAutoSizeText: false,

  // SmartButton
  buttonHeight: 48.0,
  buttonActiveBackgroundColor: Colors.blue,
  buttonBorderRadius: BorderRadius.circular(8),
  buttonTitleStyle: TextStyle(fontSize: 16, color: Colors.white),

  // SmartTextField
  textFieldStyle: TextStyle(fontSize: 14, color: Colors.black87),
  textFieldFillColor: Color(0xFFF5F5F5),
  textFieldEnabledBorderColor: Color(0xFFDDDDDD),
  textFieldFocusedBorderColor: Colors.blue,

  // SmartImage
  imageFit: BoxFit.cover,
  imageHeight: 100.0,
  imageWidth: 100.0,
  imageLoadingAnimationType: LoadingAnimationType.shimmer,

  // SmartExpansionTile
  expansionTileAnimationDuration: Duration(milliseconds: 200),
  expansionTileTrailingExpandedIconPath: 'assets/images/arrow_up.svg',
  expansionTileTrailingCollapsedIconPath: 'assets/images/arrow_down.svg',

  // SmartCheckbox / Radio
  checkboxActiveColor: Colors.blue,
  checkboxBorderColor: Colors.grey,
  radioButtonActiveColor: Colors.blue,

  // SmartStepper
  stepperActiveColor: Colors.blue,
  stepperCompletedColor: Colors.green,

  // SmartNoDataFound
  noDataFoundImagePath: 'assets/images/placeholder.png',
  noDataFoundText: 'No data found',
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
