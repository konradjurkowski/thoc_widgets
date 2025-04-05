import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/utils/helpers.dart';
import 'package:thoc_widgets/widgets/button/button_size.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.text,
    this.enabled = true,
    this.loading = false,
    this.width,
    this.foregroundColor,
    this.backgroundColor,
    this.buttonSize = ButtonSize.LARGE,
    required this.onClick,
    super.key,
  });

  final String text;
  final bool enabled;
  final bool loading;
  final double? width;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final ButtonSize buttonSize;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonSize.height,
      width: width,
      child: ElevatedButton(
        onPressed: enabled ? () {
          FocusManager.instance.primaryFocus?.unfocus();
          HapticFeedback.mediumImpact();
          onClick();
        } : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: buttonSize.horizontalPadding,
            vertical: buttonSize.verticalPadding,
          ),
          backgroundColor: backgroundColor ?? context.colors.primary,
          foregroundColor: foregroundColor ?? context.colors.onPrimary,
          disabledForegroundColor: context.colors.onBackground.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonSize.height / 2),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: buttonSize.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
