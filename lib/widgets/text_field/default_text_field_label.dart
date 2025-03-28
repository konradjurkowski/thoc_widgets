import 'package:flutter/material.dart';
import 'package:thoc_widgets/thoc_widgets.dart';

class DefaultTextFieldLabel extends StatelessWidget {
  const DefaultTextFieldLabel({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodyMedium,
    );
  }
}
