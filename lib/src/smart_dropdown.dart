import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

/// Data model for a single dropdown item.
class SmartDropDownItem<T> {
  final String title;
  final T? value;
  final bool enabled;

  const SmartDropDownItem({
    required this.title,
    this.value,
    this.enabled = true,
  });
}

/// A customizable dropdown that opens a modal bottom sheet with an optional
/// search field, scrollable selection list, and error state display.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartDropDown<T> extends StatelessWidget {
  final ValueChanged<T?> onChanged;
  final List<SmartDropDownItem<T>> items;
  final T? selectedItem;
  final double? selectionWindowHeight;
  final double? buttonHeight;
  final String? hintText;
  final String? labelText;
  final Axis scrollDirection;
  final FocusNode? focusNode;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool isIcArrowDropDown;
  final bool isExpanded;
  final bool isChangeableValue;
  final ValueChanged<String>? onSearchEvent;
  final bool canSearch;
  final String? errorText;
  final String? emptyText;
  final AlignmentDirectional? itemAlignment;
  final String? searchHintText;

  /// Colors for selected / unselected items in the bottom sheet.
  final Color? selectedItemColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;

  const SmartDropDown({
    super.key,
    required this.onChanged,
    required this.items,
    this.selectedItem,
    this.selectionWindowHeight,
    this.buttonHeight,
    this.hintText,
    this.labelText,
    this.scrollDirection = Axis.vertical,
    this.focusNode,
    this.borderRadius,
    this.border,
    this.contentPadding,
    this.textStyle,
    this.backgroundColor,
    this.isIcArrowDropDown = true,
    this.isExpanded = true,
    this.isChangeableValue = true,
    this.onSearchEvent,
    this.canSearch = false,
    this.errorText,
    this.emptyText,
    this.itemAlignment,
    this.searchHintText,
    this.selectedItemColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    final hasError = errorText != null && errorText!.isNotEmpty;
    String? title = items
        .cast<SmartDropDownItem<T>?>()
        .firstWhere((e) => e?.value == selectedItem, orElse: () => null)
        ?.title;

    return Column(
      crossAxisAlignment:
          isExpanded ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
      children: [
        InkWell(
          focusNode: focusNode,
          onTap: () {
            if (!isChangeableValue) return;
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.0.r)),
              ),
              builder: (ctx) {
                return _SmartDropDownView<T>(
                  scrollDirection: scrollDirection,
                  hintText: hintText,
                  itemAlignment: itemAlignment,
                  onTap: (value) {
                    onChanged(value);
                  },
                  items: items,
                  selectedItem: selectedItem,
                  height: selectionWindowHeight,
                  onSearchEvent: onSearchEvent,
                  canSearch: canSearch,
                  noDataFoundText: emptyText ?? 'No data found',
                  searchHintText: searchHintText,
                  selectedItemColor: selectedItemColor,
                  selectedBorderColor: selectedBorderColor,
                  unselectedBorderColor: unselectedBorderColor,
                  selectedTextStyle: selectedTextStyle,
                  unselectedTextStyle: unselectedTextStyle,
                );
              },
            );
          },
          child: Container(
            height: !isExpanded ? null : buttonHeight,
            padding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: backgroundColor ?? config.dropdownBackgroundColor,
              borderRadius: borderRadius ?? BorderRadius.circular(50.r),
              border: border ??
                  Border.all(
                    color: hasError
                        ? config.textFieldErrorBorderColor
                        : config.textFieldEnabledBorderColor,
                  ),
            ),
            child: _buildTitleRow(title, config),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: SmartColumn(
            padding: EdgeInsets.only(left: 16.w),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: hasError
                ? [
                    SizedBox(height: 8.h),
                    SmartText(errorText!, style: config.textFieldErrorStyle),
                  ]
                : [],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleRow(String? title, SmartDevWidgetsConfig config) {
    final hasTitle = title != null && title.isNotEmpty;
    if (isExpanded) {
      return Row(
        children: [
          Expanded(
            child: SmartText(
              title ?? hintText ?? 'Select',
              style: hasTitle
                  ? config.textFieldStyle.merge(textStyle)
                  : config.textFieldHintStyle,
            ),
          ),
          if (isIcArrowDropDown) Icon(Icons.keyboard_arrow_down, size: 24.w),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SmartText(
          title ?? hintText ?? 'Select',
          style: hasTitle
              ? config.textFieldStyle.merge(textStyle)
              : config.textFieldHintStyle,
        ),
        SizedBox(width: 2.w),
        if (isIcArrowDropDown) Icon(Icons.keyboard_arrow_down, size: 24.w),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Internal bottom-sheet view
// ---------------------------------------------------------------------------

class _SmartDropDownView<T> extends StatelessWidget {
  final ValueChanged<T?> onTap;
  final List<SmartDropDownItem<T>> items;
  final T? selectedItem;
  final double? height;
  final String? hintText;
  final Axis scrollDirection;
  final ValueChanged<String>? onSearchEvent;
  final bool canSearch;
  final ValueNotifier<String> searchNotifier;
  final String noDataFoundText;
  final AlignmentDirectional? itemAlignment;
  final String? searchHintText;
  final Color? selectedItemColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;

  _SmartDropDownView({
    required this.onTap,
    required this.items,
    this.selectedItem,
    this.height,
    this.hintText,
    this.scrollDirection = Axis.vertical,
    this.onSearchEvent,
    this.canSearch = false,
    this.noDataFoundText = '',
    this.itemAlignment,
    this.searchHintText,
    this.selectedItemColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
  }) : searchNotifier = ValueNotifier<String>('');

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        decoration: BoxDecoration(
          color: config.dropdownBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r),
            topRight: Radius.circular(6.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (hintText != null && hintText!.isNotEmpty) ...[
                SmartText(hintText!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.sp)),
                SizedBox(height: 16.h),
              ],
              if (canSearch) ...[
                SmartTextField.search(
                  hintText: searchHintText ?? 'Search ${hintText ?? ''}',
                  onValueChanges: (value) {
                    searchNotifier.value = value;
                    onSearchEvent?.call(value);
                  },
                ),
                SizedBox(height: 8.h),
              ],
              ValueListenableBuilder<String>(
                valueListenable: searchNotifier,
                builder: (context, query, child) {
                  final filtered = items
                      .where((item) => item.title
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();
                  return filtered.isNotEmpty
                      ? Flexible(
                          child: _buildItemList(filtered, config, context))
                      : SizedBox(
                          height: 200.h,
                          child: SmartNoDataFound(
                            text: noDataFoundText.isNotEmpty
                                ? noDataFoundText
                                : 'No data found',
                            isImageShow: false,
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemList(List<SmartDropDownItem<T>> filteredList,
      SmartDevWidgetsConfig config, BuildContext context) {
    Widget child = ListView.separated(
      controller: _scrollController,
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final item = filteredList[index];
        final bool isSelected =
            selectedItem != null && item.value == selectedItem;
        Widget tile = GestureDetector(
          onTap: () {
            if (item.enabled) {
              onTap(item.value);
              Navigator.of(context).pop();
            }
          },
          child: Container(
            alignment: itemAlignment ?? AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? (selectedItemColor ??
                      Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.1))
                  : config.dropdownBackgroundColor,
              border: Border.all(
                color: isSelected
                    ? (selectedBorderColor ??
                        Theme.of(context).colorScheme.primary)
                    : (unselectedBorderColor ?? Colors.grey[300]!),
              ),
            ),
            padding: EdgeInsets.all(12.w),
            child: SmartText(
              item.title,
              style: isSelected
                  ? (selectedTextStyle ??
                      TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary))
                  : (unselectedTextStyle ??
                      const TextStyle(fontWeight: FontWeight.w400)),
              textAlign: TextAlign.start,
            ),
          ),
        );

        if (scrollDirection == Axis.horizontal) {
          tile = ConstrainedBox(
            constraints: BoxConstraints(minWidth: 50.w, maxHeight: 50.h),
            child: tile,
          );
        }
        return tile;
      },
      separatorBuilder: (context, index) => SizedBox(
        height: scrollDirection == Axis.vertical ? 8.h : 0,
        width: scrollDirection == Axis.horizontal ? 8.w : 0,
      ),
    );

    return Scrollbar(
      thumbVisibility: true,
      controller: _scrollController,
      scrollbarOrientation: scrollDirection == Axis.horizontal
          ? ScrollbarOrientation.bottom
          : ScrollbarOrientation.right,
      child: scrollDirection == Axis.horizontal
          ? Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: SizedBox(height: 50.w, child: child),
            )
          : Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: child,
            ),
    );
  }
}
