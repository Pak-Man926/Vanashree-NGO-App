import "package:flutter/material.dart";
import "package:vanashree_ngo_application/core/extensions/build_context_extensions.dart";

class PlantStatusContainer extends StatelessWidget {
  const PlantStatusContainer({
    super.key,
    required this.label,
    required this.icon,
    required this.priority,
  });

  final String label;
  final IconData icon;
  final bool priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Replaced fixed height/width with dynamic padding
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: priority
            ? context.colorScheme.error.withOpacity(0.4)
            : context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize:
            MainAxisSize.min, // Ensures it only takes as much space as needed
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 12),
          const SizedBox(width: 4), // Spacing between icon and text
          Text(
            label.toUpperCase(), // Match the screenshot's all-caps style
            style: context.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
