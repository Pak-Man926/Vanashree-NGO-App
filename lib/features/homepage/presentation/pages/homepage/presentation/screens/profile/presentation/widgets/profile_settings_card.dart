import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class ProfileSettingsCard extends StatelessWidget {
  final List<Widget> children;

  const ProfileSettingsCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: context.theme.colorScheme.outlineVariant.withValues(
            alpha: 0.3,
          ),
          width: 1,
        ),
      ),
      child: Column(children: children),
    );
  }
}
