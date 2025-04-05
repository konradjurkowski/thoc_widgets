import 'package:thoc_widgets/utils/widgets_dimens.dart';

enum ButtonSize {
  SMALL(
    height: 34,
    fontSize: 14,
    verticalPadding: WidgetsDimens.padding8,
    horizontalPadding: WidgetsDimens.padding12,
  ),
  MEDIUM(
    height: 44,
    fontSize: 16,
    verticalPadding: WidgetsDimens.padding12,
    horizontalPadding: WidgetsDimens.padding16,
  ),
  LARGE(
    height: 60,
    fontSize: 18,
    verticalPadding: WidgetsDimens.padding18,
    horizontalPadding: WidgetsDimens.padding22,
  );

  const ButtonSize({
    required this.height,
    required this.fontSize,
    required this.horizontalPadding,
    required this.verticalPadding,
  });
  final double height;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
}
