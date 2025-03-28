import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thoc_widgets/utils/widgets_dimens.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.iconPath,
    this.size = WidgetsDimens.icon24,
    this.boxFit = BoxFit.contain,
    this.tint,
    super.key,
  });

  final String iconPath;
  final double size;
  final BoxFit boxFit;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.asset(
        iconPath,
        height: size,
        width: size,
        fit: boxFit,
        colorFilter: tint != null ? ColorFilter.mode(tint!, BlendMode.srcIn) : null,
      ),
      // child: SvgPicture.asset(),
    );
  }
}
