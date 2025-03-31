import 'package:flutter/material.dart';
import 'package:thoc_widgets/utils/widgets_dimens.dart';

class TinySpacer extends StatelessWidget {
  const TinySpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: WidgetsDimens.padding4,
      width: WidgetsDimens.padding4,
    );
  }
}

class SmallSpacer extends StatelessWidget {
  const SmallSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: WidgetsDimens.padding8,
      width: WidgetsDimens.padding8,
    );
  }
}

class RegularSpacer extends StatelessWidget {
  const RegularSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: WidgetsDimens.padding16,
      width: WidgetsDimens.padding16,
    );
  }
}

class MediumSpacer extends StatelessWidget {
  const MediumSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: WidgetsDimens.padding24,
      width: WidgetsDimens.padding24,
    );
  }
}

class LargeSpacer extends StatelessWidget {
  const LargeSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: WidgetsDimens.padding32,
      width: WidgetsDimens.padding32,
    );
  }
}
