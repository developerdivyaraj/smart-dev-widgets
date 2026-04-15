## 0.0.4
- **SmartColumn**: Use native `Column.spacing` (Flutter 3.27+) instead of manual `SizedBox` injection.
- **SmartRow**: Add `spacing` (native `Row.spacing`), `alignment` params; widen `decoration` type to `Decoration?`.
- **SmartText**: Rename `optionalPaddings` → `optionalPadding`, `isExpanded` → `expanded`, `isFlexible` → `flexible`, `textDecoration` → `decoration`.
- **SmartButton**: Replace `CircularProgressIndicator` with `SmartCircularProgressIndicator`; add bounce tap animation; use `SmartImage` for prefix/suffix icons.
- **SmartSingleChildScrollView**: Default `physics` to `ClampingScrollPhysics`; make `scrollDirection` nullable.
- **SmartImage**: Add `size`, `clipBehavior`, `decoration`, `alignment` params; add `Lottie` animation support; add 4 animated loading types (shimmer, pulse, skeleton, wave); add `showLoadingAnimation` toggle; smarter empty-path detection.
- **SmartExpansionTile**: Add `isDisablePageStorage` flag; nullable `AnimationController` for safety; fix deprecated `unselectedWidgetColor`; guard `ListTile.onTap` behind `onExpansionChanged` null check.
- **SmartDevWidgetsConfig**: Add `rowSpacing`, `imageLoadingAnimationType`, `imageShowLoadingAnimation`; rename `textOptionalPaddings` → `textOptionalPadding`; remove `.w`/`.r` from default values to prevent `ScreenUtil` init order issues.
- **New**: `SmartTextField` — fully customizable text field with password toggle, search variant, and built-in error states.
- **New**: `SmartCheckbox` & `SmartRadioButton` — customizable toggles.
- **New**: `SmartDropDown` — modal bottom sheet dropdown with search filtering.
- **New**: `SmartTabBar` — self-contained TabBar with integrated views.
- **New**: `SmartAppBar` & `SmartCommonAppBar` — highly customizable app bars with profile and standard modes.
- **New**: `SmartStepper` — animated vertical stepper with dashed lines.
- **New**: `SmartCircularProgressIndicator` widget.
- **New**: `SmartNoDataFound` — unified empty state widget.
- **New**: `SmartImagePickDialogSheet` — Camera / Gallery selector sheet.
- **New**: `SmartDashedDivider` & `SmartGradientContainer` layout helpers.
- **New**: `SmartEnums` — shared `ImageType`, `LoadingAnimationType` enums.
- **New deps**: `shimmer: ^3.0.0`, `lottie: ^3.1.0`.
- **Flutter min**: bumped to `>=3.27.0` for native `spacing` support.

## 0.0.3
- Added `SmartImage` widget for assets, files, network images, and SVGs with caching.
- Added `SmartExpansionTile` with animated expansion and trailing icons.
- Added `SmartSingleChildScrollView` with pull-to-refresh and keyboard dismissal.

## 0.0.2
- Added `SmartButton` with loading states, prefix/suffix images, and white variant.

## 0.0.1
- Initial release with `SmartColumn`, `SmartRow`, and `SmartText` widgets.
- Added `SmartDevWidgetsConfig` for global default initialization.