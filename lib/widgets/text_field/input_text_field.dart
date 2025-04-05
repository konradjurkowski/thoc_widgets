import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/utils/helpers.dart';
import 'package:thoc_widgets/utils/widgets_dimens.dart';
import 'package:thoc_widgets/widgets/other/spacers.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    this.controller,
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
    this.style,
    this.isDense = false,
    this.contentPadding = const EdgeInsets.all(WidgetsDimens.padding16),
    super.key,
  });

  final TextEditingController? controller;
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
  final TextStyle? style;
  final bool isDense;
  final EdgeInsetsGeometry contentPadding;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  final _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _hasText;

  @override
  void initState() {
    super.initState();
    _hasText = widget.controller?.text.isNotEmpty == true;
    widget.controller?.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTextChanged);
    _focusNode.dispose();
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  void _onTextChanged() {
    setState(() => _hasText = widget.controller?.text.isNotEmpty == true);
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(WidgetsDimens.radius12),
      borderSide: BorderSide(color: Colors.transparent),
    );

    final focusedInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(WidgetsDimens.radius12),
      borderSide: BorderSide(
        width: 3,
        color: context.colors.onBackground,
      ),
    );

    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: widget.obscureText,
      autofocus: widget.autofocus,
      keyboardType: widget.inputType,
      validator: widget.validator,
      autofillHints: widget.autofillHints,
      cursorColor: context.colors.onBackground,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      autocorrect: widget.autocorrect,
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      style: widget.style ?? context.typography.bodyLarge
          ?.copyWith(color: context.colors.onBackground),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.typography.bodyLarge
            ?.copyWith(color: context.colors.onBackground.withValues(alpha: 0.5)),
        isDense: widget.isDense,
        contentPadding: widget.contentPadding,
        border: inputBorder,
        focusedBorder: focusedInputBorder,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        filled: true,
        fillColor: _isFocused
            ? context.colors.background
            : context.colors.onBackground.withValues(alpha: 0.1),
        suffixIcon: _buildSuffixIconSection(),
      ),
    );
  }

  Widget? _buildSuffixIconSection() {
    if (!_hasText && widget.suffixIcon == null) return null;

    return Padding(
      padding: const EdgeInsets.only(
        left: WidgetsDimens.padding8,
        right: WidgetsDimens.padding16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_hasText)TextFieldIcon(
            icon: Icons.cancel,
            onClick: () => widget.controller?.text = "",
          ),
          if (_hasText && widget.suffixIcon != null) const SmallSpacer(),
          if (widget.suffixIcon != null)TextFieldIcon(
            icon: widget.suffixIcon!,
            onClick: () => widget.onSuffixIconClick?.call(),
          ),
        ],
      ),
    );
  }
}

class TextFieldIcon extends StatelessWidget {
  const TextFieldIcon({
    required this.icon,
    required this.onClick,
    super.key,
  });

  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onClick.call();
      },
      child: Icon(
        icon,
        color: context.colors.onBackground,
      ),
    );
  }
}
