import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 60, // Align with text
      endIndent: 16,
      color: context.theme.colorScheme.outlineVariant.withValues(alpha: 0.2),
    );
  }
}
