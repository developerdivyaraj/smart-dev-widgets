# SmartDevWidgets

A collection of reusable, customizable Flutter widgets designed to simplify and accelerate UI development. Built by SmartDev, this package provides widgets for common UI components with consistent styling, responsive design, and global configuration support.

## Features

- **SmartColumn**: A customizable `Column` with spacing, padding, tap handling, and SafeArea support.
- **SmartRow**: A flexible `Row` with padding, margin, and tap handling.
- **SmartText**: A versatile `Text` or `AutoSizeText` with styling, padding, and layout options.
- **SmartButton**: A feature-rich button with loading states, prefix/suffix images, and customizable styles.
- **SmartSingleChildScrollView**: An enhanced `SingleChildScrollView` with pull-to-refresh, SafeArea, and keyboard dismissal.
- **SmartImage**: A robust image viewer supporting assets, files, network images, and SVGs with caching and error handling.
- **SmartExpansionTile**: A customizable `ExpansionTile` with animated expansion, trailing icons, and theme integration.
- **Global Configuration**: Use `SmartDevWidgetsConfig` to set default styles and behaviors across all widgets.
- **Responsive Design**: Integrates with `flutter_screenutil` for consistent sizing across devices.

## Installation

Add `smart_dev_widgets` to your `pubspec.yaml`:

```yaml
dependencies:
  smart_dev_widgets: ^0.0.1
```

Run the following command to install the package:

```bash
flutter pub get
```

### Dependencies

Ensure the following dependencies are included in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_screenutil: ^5.9.0
  auto_size_text: ^3.0.0
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.7
```

For the test app or your application, include assets:

```yaml
flutter:
  assets:
    - assets/images/
```

## Setup

Initialize `SmartDevWidgetsConfig` at app startup to set default values for all widgets. Wrap your app with `ScreenUtilInit` for responsive sizing.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

void main() {
  SmartDevWidgetsConfig().initialize(
    // SmartColumn defaults
    columnMainAxisAlignment: MainAxisAlignment.center,
    columnCrossAxisAlignment: CrossAxisAlignment.start,
    columnSpacing: 8.0,
    columnPadding: EdgeInsets.all(10.w),
    columnIsInkwell: true,
    // SmartRow defaults
    rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
    rowPadding: EdgeInsets.symmetric(horizontal: 8.w),
    rowIsInkwell: true,
    // SmartText defaults
    textStyle: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.blue,
    ),
    textPadding: EdgeInsets.all(4.w),
    textOverflow: TextOverflow.ellipsis,
    textMaxLines: 2,
    // SmartButton defaults
    buttonActiveBackgroundColor: Colors.blue,
    buttonHeight: 48.w,
    buttonPadding: EdgeInsets.symmetric(horizontal: 12.w),
    // SmartSingleChildScrollView defaults
    scrollViewPadding: EdgeInsets.all(16.w),
    scrollViewSafeArea: true,
    // SmartImage defaults
    imagePlaceholderPath: 'assets/placeholder.png',
    imageLoadingColor: Colors.blue,
    imagePadding: EdgeInsets.all(4.w),
    imageHeight: 100.w,
    imageWidth: 100.w,
    // SmartExpansionTile defaults
    expansionTileTrailingExpandedIconPath: 'assets/arrow_up.png',
    expansionTileTrailingCollapsedIconPath: 'assets/arrow_down.png',
    expansionTilePadding: EdgeInsets.all(8.w),
    expansionTileMargin: EdgeInsets.symmetric(horizontal: 16.w),
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
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
```

## Usage

### SmartColumn

A customizable `Column` with spacing, padding, and tap handling.

```dart
SmartColumn(
  spacing: 8.0,
  padding: EdgeInsets.all(16.w),
  onTap: () {
    print('Column tapped!');
  },
  isInkwell: true,
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)
```

### SmartRow

A flexible `Row` with alignment, padding, and tap handling.

```dart
SmartRow(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  padding: EdgeInsets.symmetric(horizontal: 8.w),
  onTap: () {
    print('Row tapped!');
  },
  isInkwell: true,
  children: [
    Text('Left'),
    Text('Right'),
  ],
)
```

### SmartText

A customizable `Text` or `AutoSizeText` with styling and layout options.

```dart
SmartText(
  'Hello World',
  style: TextStyle(fontSize: 18.sp, color: Colors.blue),
  padding: EdgeInsets.all(4.w),
  onTap: () {
    print('Text tapped!');
  },
  isAutoSizeText: true,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

### SmartButton

A versatile button with loading states and image support.

```dart
SmartButton(
  title: 'Click Me',
  onTap: () {
    print('Button tapped!');
  },
  prefixImage: 'assets/icon.png',
  isLoading: false,
  activeBackgroundColor: Colors.blue,
  height: 48.w,
)
```

### SmartSingleChildScrollView

An enhanced `SingleChildScrollView` with refresh and keyboard dismissal.

```dart
SmartSingleChildScrollView(
  padding: EdgeInsets.all(16.w),
  safeArea: true,
  onRefresh: () async {
    await Future.delayed(Duration(seconds: 1));
    print('Refreshed!');
  },
  child: Column(
    children: [
      Text('Scrollable Content'),
    ],
  ),
)
```

### SmartImage

A robust image viewer supporting multiple image types.

```dart
SmartImage(
  path: 'assets/icon.png',
  height: 100.w,
  width: 100.w,
  fit: BoxFit.cover,
  onTap: () {
    print('Image tapped!');
  },
)
```

### SmartExpansionTile

A customizable `ExpansionTile` with animated expansion and trailing icons.

```dart
SmartExpansionTile(
  title: SmartText('Expand Me'),
  padding: EdgeInsets.all(8.w),
  onExpansionChanged: (expanded) {
    print('Expanded: $expanded');
  },
  children: [
    SmartText('Child Content 1'),
    SmartText('Child Content 2'),
  ],
)
```

## Widgets

| Widget                     | Description                                                                 |
|----------------------------|-----------------------------------------------------------------------------|
| `SmartColumn`              | Customizable `Column` with spacing, padding, margin, and tap handling.       |
| `SmartRow`                 | Flexible `Row` with padding, margin, and tap handling.                      |
| `SmartText`                | Enhanced `Text` or `AutoSizeText` with styling and layout options.           |
| `SmartButton`              | Feature-rich button with loading, images, and styling.                      |
| `SmartSingleChildScrollView` | `SingleChildScrollView` with refresh, SafeArea, and keyboard dismissal.      |
| `SmartImage`               | Image viewer for assets, files, network images, and SVGs with caching.       |
| `SmartExpansionTile`       | Customizable `ExpansionTile` with animated expansion and trailing icons.     |

## Configuration

Use `SmartDevWidgetsConfig` to set global defaults. Example properties:

- **SmartColumn**: `columnSpacing`, `columnPadding`, `columnIsInkwell`
- **SmartRow**: `rowMainAxisAlignment`, `rowPadding`, `rowIsInkwell`
- **SmartText**: `textStyle`, `textPadding`, `textMaxLines`
- **SmartButton**: `buttonHeight`, `buttonActiveBackgroundColor`, `buttonImageSize`
- **SmartSingleChildScrollView**: `scrollViewPadding`, `scrollViewSafeArea`
- **SmartImage**: `imagePlaceholderPath`, `imageLoadingColor`, `imageHeight`, `imageWidth`
- **SmartExpansionTile**: `expansionTilePadding`, `expansionTileTrailingExpandedIconPath`, `expansionTileAnimationDuration`

See the [Setup](#setup) section for a full example.

## Testing

The package includes comprehensive unit tests. Run tests with:

```bash
cd smart_dev_widgets
flutter test
```

## Issues

Report bugs or request features on the [GitHub Issues page](https://github.com/developerdivyaraj/smart-dev-widgets/issues).

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For support, contact us at [developerdivyaraj@gmail.com](mailto:developerdivyaraj@gmail.com).

---

Built with ❤️ by [SmartDev](https://jadejadivyaraj04.github.io/my_protfolio/#/)
