import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/utils/helpers.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    required this.text,
    required this.onClick,
    super.key,
  });

  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        HapticFeedback.mediumImpact();
        onClick();
      },
      child: Text(
        text,
        style: context.typography.bodySmall?.copyWith(
          color: context.colors.primary,
        ),
      ),
    );
  }
}
