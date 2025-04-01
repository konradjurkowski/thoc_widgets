import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/thoc_widgets.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    required this.firstPart,
    required this.secondPart,
    required this.onClick,
    super.key,
  });

  final String firstPart;
  final String secondPart;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(WidgetsDimens.padding16),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: firstPart,
            style: TextStyle(color: context.colors.onBackground),
            children: [
              TextSpan(
                text: secondPart,
                style: TextStyle(color: context.colors.primary),
                recognizer: TapGestureRecognizer()..onTap = () {
                  HapticFeedback.mediumImpact();
                  onClick();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
