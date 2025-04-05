import 'package:flutter/material.dart';
import 'package:thoc_widgets/utils/helpers.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.typography.bodyMedium,
    );
  }
}
