import 'package:flutter/material.dart';

import 'app_back_button.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.centerTitle = true,
    this.actions = const [],
  });
  final String title;
  final bool showBackButton, centerTitle;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      leading: showBackButton ? const AppBackButton() : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
