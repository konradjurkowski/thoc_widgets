import 'package:flutter/material.dart';
import 'package:thoc_widgets/widgets/button/base_button.dart';
import 'package:thoc_widgets/widgets/button/button_size.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    return BaseButton(
      text: text,
      enabled: enabled,
      loading: loading,
      width: width,
      buttonSize: buttonSize,
      onClick: onClick,
    );
  }
}
