import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class EnvironmentalStatsRow extends StatelessWidget {
  const EnvironmentalStatsRow({
    super.key,
    required this.title,
    required this.value,
    required this.isHighlighted,
  });

  final bool isHighlighted;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          // Conditionally apply the left border
          border: isHighlighted
              ? Border(
                  left: BorderSide(
                    color: context.colorScheme.primary,
                    width: 4.0,
                  ),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: context.colorScheme.primaryFixed,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0, // Gives the small caps a breathable look
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: context.colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
