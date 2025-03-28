import 'package:flutter/material.dart';
import 'package:thoc_widgets/utils/helpers.dart';
import 'package:thoc_widgets/utils/widgets_dimens.dart';

class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    this.size = WidgetsDimens.progressBarSize,
    this.color,
    super.key,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: color ?? context.colors.primary,
        ),
      ),
    );
  }
}
