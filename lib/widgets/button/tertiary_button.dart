import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/utils/helpers.dart';
import 'package:thoc_widgets/widgets/button/button_size.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    required this.text,
    this.enabled = true,
    this.loading = false,
    this.width,
    this.buttonSize = ButtonSize.LARGE,
    required this.onClick,
    super.key,
  });

  final String text;
  final bool enabled;
  final bool loading;
  final double? width;
  final ButtonSize buttonSize;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonSize.height,
      width: width,
      child: OutlinedButton(
        onPressed: enabled ? () {
          FocusManager.instance.primaryFocus?.unfocus();
          HapticFeedback.mediumImpact();
          onClick();
        } : null,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: buttonSize.horizontalPadding,
            vertical: buttonSize.verticalPadding,
          ),
          backgroundColor: context.colors.background,
          foregroundColor: context.colors.onBackground,
          disabledForegroundColor: context.colors.onBackground.withValues(alpha: 0.3),
          side: BorderSide(
            color: enabled
                ? context.colors.onBackground.withValues(alpha: 0.3)
                : context.colors.onBackground.withOpacity(0.2),
          ),
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
