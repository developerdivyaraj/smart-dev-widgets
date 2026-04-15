import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'smart_dev_widgets_config.dart';

/// A customizable [TextFormField] with built-in label, hint, error states,
/// password toggle, search variant, border customization, and focus management.
///
/// Defaults are sourced from [SmartDevWidgetsConfig].
class SmartTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsets? padding;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? errorText;
  final bool obscured;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final ValueChanged<String>? onValueChanges;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final double? height;
  final int? maxLines;
  final int? maxLength;
  final bool? expand;
  final TextStyle? errorStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool? isEnabled;
  final bool? isRequired;
  final double? enabledBorderRadius;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final Color? cursorColor;
  final bool autofocus;
  final TapRegionUpCallback? onTapUpOutside;
  final VoidCallback? onEditingComplete;
  final String? suffixText;
  final String? prefixText;
  final BorderRadius? borderRadius;
  final InputBorder? customEnabledBorder;
  final InputBorder? customDisabledBorder;
  final InputBorder? customFocusedBorder;
  final InputBorder? customErrorBorder;
  final InputBorder? customFocusedErrorBorder;
  final GestureTapCallback? onTap;
  final double? cursorHeight;
  final TextAlign? textAlign;
  final BoxConstraints? prefixIconConstraints;
  final bool isSearch;
  final bool alignLabelWithHint;
  final bool enableLabeling;
  final bool enableBorder;
  final String? obscureToggleShowText;
  final String? obscureToggleHideText;

  SmartTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscured = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.fillColor,
    this.onValueChanges,
    this.onFieldSubmitted,
    this.validator,
    this.textInputFormatter,
    this.contentPadding,
    this.errorText,
    this.hintStyle,
    String? labelText,
    this.labelStyle,
    this.padding,
    this.maxLines,
    this.maxLength,
    this.expand,
    this.height,
    this.style,
    this.errorStyle,
    this.suffixIcon,
    this.focusNode,
    this.nextFocusNode,
    this.isEnabled,
    this.isRequired,
    this.prefixIcon,
    this.enabledBorderRadius,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.cursorColor,
    this.autofocus = false,
    this.onTapUpOutside,
    this.onEditingComplete,
    this.borderRadius,
    this.customEnabledBorder,
    this.customDisabledBorder,
    this.customFocusedBorder,
    this.customErrorBorder,
    this.customFocusedErrorBorder,
    this.suffixText,
    this.prefixText,
    this.onTap,
    this.cursorHeight,
    this.textAlign,
    this.alignLabelWithHint = true,
    this.enableLabeling = false,
    this.enableBorder = true,
    this.prefixIconConstraints,
    this.obscureToggleShowText,
    this.obscureToggleHideText,
  })  : labelText = labelText != null
            ? '$labelText${isRequired == true ? ' *' : ''}'
            : null,
        isSearch = false;

  SmartTextField.search({
    super.key,
    this.controller,
    this.hintText,
    this.obscured = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.fillColor,
    this.onValueChanges,
    this.onFieldSubmitted,
    this.validator,
    this.textInputFormatter,
    this.contentPadding,
    this.errorText,
    this.hintStyle,
    String? labelText,
    this.labelStyle,
    this.padding,
    this.maxLines,
    this.maxLength,
    this.expand,
    this.height,
    this.style,
    this.errorStyle,
    this.suffixIcon,
    this.focusNode,
    this.nextFocusNode,
    this.isEnabled,
    this.isRequired,
    this.enabledBorderRadius,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.cursorColor,
    this.autofocus = false,
    this.onTapUpOutside,
    this.onEditingComplete,
    this.prefixIcon,
    this.borderRadius,
    this.customEnabledBorder,
    this.customDisabledBorder,
    this.customFocusedBorder,
    this.customErrorBorder,
    this.customFocusedErrorBorder,
    this.suffixText,
    this.prefixText,
    this.onTap,
    this.cursorHeight,
    this.textAlign,
    this.alignLabelWithHint = true,
    this.enableLabeling = true,
    this.enableBorder = true,
    this.prefixIconConstraints,
    this.obscureToggleShowText,
    this.obscureToggleHideText,
  })  : labelText = labelText != null
            ? '$labelText${isRequired == true ? ' *' : ''}'
            : null,
        isSearch = true;

  final ValueNotifier<bool> _passwordVisible = ValueNotifier(false);

  void _toggle() {
    _passwordVisible.value = !_passwordVisible.value;
  }

  @override
  Widget build(BuildContext context) {
    final config = SmartDevWidgetsConfig();

    final effectiveBorderRadius = borderRadius ??
        BorderRadius.all(Radius.circular(enabledBorderRadius ?? 50.r));

    OutlineInputBorder enabledBorder({bool isFocused = false}) {
      return OutlineInputBorder(
        borderRadius: effectiveBorderRadius,
        borderSide: BorderSide(
          color: isFocused
              ? (focusedBorderColor ?? config.textFieldFocusedBorderColor)
              : (enabledBorderColor ?? config.textFieldEnabledBorderColor),
        ),
      );
    }

    OutlineInputBorder disabledBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: BorderSide(
        color: disabledBorderColor ?? config.textFieldDisabledBorderColor,
      ),
    );

    OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: config.textFieldErrorBorderColor),
      borderRadius: effectiveBorderRadius,
    );

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ValueListenableBuilder<bool>(
        valueListenable: _passwordVisible,
        builder: (context, value, child) {
          return TextFormField(
            onTap: onTap,
            autofocus: autofocus,
            style: config.textFieldStyle.merge(style),
            onTapUpOutside: (p) {
              if (onTapUpOutside != null) {
                FocusScope.of(context).unfocus();
                onTapUpOutside!(p);
              }
            },
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            textAlign: textAlign ?? TextAlign.start,
            expands: expand ?? false,
            readOnly: readOnly,
            maxLines: maxLines ?? 1,
            focusNode: focusNode,
            enabled: isEnabled ?? true,
            cursorColor: cursorColor ?? config.textFieldCursorColor,
            controller: controller,
            cursorHeight: cursorHeight,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              suffixText: suffixText,
              prefixText: prefixText,
              prefixStyle: config.textFieldStyle.merge(style),
              suffixStyle: config.textFieldStyle.merge(style),
              errorMaxLines: 6,
              counterText: '',
              filled: true,
              alignLabelWithHint: alignLabelWithHint,
              errorStyle: config.textFieldErrorStyle.merge(errorStyle),
              fillColor: fillColor ?? config.textFieldFillColor,
              contentPadding: contentPadding ??
                  (isSearch
                      ? EdgeInsets.all(10.w)
                      : EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h)),
              disabledBorder:
                  enableBorder ? customDisabledBorder ?? disabledBorder : null,
              enabledBorder:
                  enableBorder ? customEnabledBorder ?? enabledBorder() : null,
              focusedBorder: enableBorder
                  ? customFocusedBorder ?? enabledBorder(isFocused: true)
                  : null,
              errorBorder:
                  enableBorder ? customErrorBorder ?? errorBorder : null,
              focusedErrorBorder:
                  enableBorder ? customFocusedErrorBorder ?? errorBorder : null,
              hintText: hintText ?? (isSearch ? 'Search' : ''),
              labelText: enableLabeling
                  ? hintText ?? (isSearch ? 'Search' : '')
                  : null,
              errorText: errorText,
              hintStyle: config.textFieldHintStyle.merge(hintStyle),
              labelStyle: config.textFieldHintStyle.merge(hintStyle),
              floatingLabelStyle: config.textFieldLabelStyle.merge(labelStyle),
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixIconConstraints,
              suffixIcon: suffixIcon ??
                  (obscured
                      ? TextButton(
                          onPressed: _toggle,
                          child: Text(
                            value
                                ? (obscureToggleHideText ?? 'Hide')
                                : (obscureToggleShowText ?? 'Show'),
                            style: config.textFieldLabelStyle
                                .copyWith(fontSize: 16.sp),
                          ),
                        )
                      : isSearch
                          ? Padding(
                              padding: EdgeInsets.all(12.w),
                              child: Icon(Icons.search, size: 20.w),
                            )
                          : null),
            ),
            obscureText: obscured && _passwordVisible.value ? false : obscured,
            obscuringCharacter: '●',
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autocorrect: false,
            autofillHints: autofillHints,
            inputFormatters: textInputFormatter ?? [],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            onChanged: (value) {
              if (onValueChanges != null) {
                onValueChanges!(value);
              }
            },
            onFieldSubmitted: (value) {
              if (nextFocusNode != null) {
                FocusScope.of(context).requestFocus(nextFocusNode);
              } else {
                FocusScope.of(context).unfocus();
              }
              if (onFieldSubmitted != null) {
                onFieldSubmitted!(value);
              }
            },
            onEditingComplete: () {
              if (nextFocusNode != null) {
                FocusScope.of(context).requestFocus(nextFocusNode);
              } else {
                FocusScope.of(context).unfocus();
              }
              onEditingComplete?.call();
            },
          );
        },
      ),
    );
  }
}
