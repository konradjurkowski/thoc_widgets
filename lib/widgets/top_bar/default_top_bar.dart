import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thoc_widgets/thoc_widgets.dart';

class DefaultTopBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultTopBar({
    required this.title,
    this.leadingIcon = Icons.arrow_back,
    this.onLeadingClick,
    this.actions,
    super.key,
  });

  final String title;
  final IconData leadingIcon;
  final VoidCallback? onLeadingClick;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(72.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: context.colors.background,
      leading: onLeadingClick != null
          ? _NavigateBackArrow(onClick: onLeadingClick!, icon: leadingIcon)
          : null,
      title: Text(
        title,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }
}

class _NavigateBackArrow extends StatelessWidget {
  const _NavigateBackArrow({
    this.icon = Icons.arrow_back,
    required this.onClick,
  });

  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        FocusManager.instance.primaryFocus?.unfocus();
        onClick();
      },
      child: Icon(icon, color: context.colors.onBackground),
    );
  }
}
