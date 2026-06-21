import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
  });
  final String title;
  final VoidCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Icon(icon, size: 24),
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
