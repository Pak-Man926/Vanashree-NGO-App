import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import 'app_back_button.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.centerTitle = true,
    this.actions = const [],
    this.backgroundColor,
  });
  final String title;
  final bool showBackButton, centerTitle;
  final List<Widget> actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: context.theme.colorScheme.primary),
      ),
      centerTitle: centerTitle,
      leading: showBackButton ? const AppBackButton() : null,
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
