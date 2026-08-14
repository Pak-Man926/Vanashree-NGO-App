import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class PersonalImpactModel {
  final String icon;
  final String title;
  final int value;

  PersonalImpactModel({
    required this.icon,
    required this.title,
    required this.value,
  });
}

class PersonalImpactCard extends StatelessWidget {
  const PersonalImpactCard({super.key, required this.personalImpact});
  final PersonalImpactModel personalImpact;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(personalImpact.icon, height: 20, width: 20),
          ),
          const Spacer(),
          Text(
            '${personalImpact.value}',
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            personalImpact.title,
            style: textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
