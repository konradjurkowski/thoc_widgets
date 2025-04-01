import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/utils/helpers.dart';
import 'package:thoc_widgets/utils/widgets_dimens.dart';

class DefaultInputTextField extends StatelessWidget {
  const DefaultInputTextField({
    this.controller,
    this.focusNode,
    this.hintText,
    this.suffixIcon,
    this.onSuffixIconClick,
    this.autofillHints,
    this.obscureText = false,
    this.autofocus = false,
    this.inputType,
    this.validator,
    this.error = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.enabled = true,
    this.autocorrect = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.fillColor,
    this.borderColor,
    this.foregroundColor,
    this.hintColor,
    this.style,
    this.isDense = false,
    this.contentPadding = const EdgeInsets.all(WidgetsDimens.padding16),
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconClick;
  final bool obscureText;
  final bool autofocus;
  final TextInputType? inputType;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;
  final bool error;
  final ValueChanged<String>? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool autocorrect;
  final int maxLines;
  final TextInputAction textInputAction;
  final Color? fillColor;
  final Color? borderColor;
  final Color? foregroundColor;
  final Color? hintColor;
  final TextStyle? style;
  final bool isDense;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(WidgetsDimens.radius4),
      borderSide: BorderSide(color: Colors.transparent),
    );
    
    final focusedInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(WidgetsDimens.radius4),
      borderSide: BorderSide(color: borderColor ?? context.colors.outline),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      autofocus: autofocus,
      keyboardType: inputType,
      validator: validator,
      autofillHints: autofillHints,
      cursorColor: context.colors.primary,
      inputFormatters: inputFormatters,
      enabled: enabled,
      autocorrect: autocorrect,
      maxLines: maxLines,
      textInputAction: textInputAction,
      style: style ?? context.typography.bodyLarge
          ?.copyWith(color: foregroundColor ?? context.colors.onBackground),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.typography.bodyLarge
            ?.copyWith(color: hintColor ?? context.colors.onBackground.withValues(alpha: 0.5)),
        isDense: isDense,
        contentPadding: contentPadding,
        border: inputBorder,
        focusedBorder: focusedInputBorder,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        filled: true,
        fillColor: fillColor ?? context.colors.onBackground.withValues(alpha: 0.2),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: WidgetsDimens.padding16),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    onSuffixIconClick?.call();
                  },
                  child: Icon(
                    suffixIcon!,
                    color: foregroundColor ?? context.colors.onBackground.withValues(alpha: 0.5),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
