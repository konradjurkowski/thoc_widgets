import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/utils/helpers.dart';
import 'package:thoc_widgets/utils/widgets_dimens.dart';
import 'package:thoc_widgets/widgets/loading/app_progress_bar.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.text,
    this.enabled = true,
    this.loading = false,
    this.verticalPadding = WidgetsDimens.padding8,
    this.horizontalPadding = WidgetsDimens.padding16,
    this.foregroundColor,
    this.backgroundColor,
    required this.onClick,
    super.key,
  });

  final String text;
  final bool enabled;
  final bool loading;
  final double verticalPadding;
  final double horizontalPadding;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetsDimens.defaultButtonHeight,
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: enabled ? () {
          HapticFeedback.mediumImpact();
          onClick();
        } : null,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          backgroundColor: backgroundColor ?? context.colors.primary,
          foregroundColor: foregroundColor ?? context.colors.onPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(WidgetsDimens.radius12),
            ),
          ),
        ),
        child:
            loading
                ? AppProgressBar(
                  size: WidgetsDimens.buttonProgressBarSize,
                  color: foregroundColor ?? context.colors.primary,
                )
                : Text(
                  text,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: foregroundColor ?? context.colors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
      ),
    );
  }
}
