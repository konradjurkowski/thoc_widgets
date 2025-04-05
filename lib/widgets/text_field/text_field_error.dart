import 'package:flutter/material.dart';
import 'package:thoc_widgets/utils/helpers.dart';
import 'package:thoc_widgets/utils/widgets_dimens.dart';

class TextFieldError extends StatelessWidget {
  const TextFieldError({this.errorMessage, super.key});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: errorMessage == null
          ? const SizedBox.shrink()
          : Padding(
              key: ValueKey(errorMessage),
              padding: const EdgeInsets.only(top: WidgetsDimens.padding8),
              child: Text(
                errorMessage!,
                style: context.typography.bodySmall
                    ?.copyWith(color: context.colors.error),
              ),
            ),
    );
  }
}
