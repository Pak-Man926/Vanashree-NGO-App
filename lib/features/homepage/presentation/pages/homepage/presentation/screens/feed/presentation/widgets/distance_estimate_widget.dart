import "package:flutter/material.dart";
import "../../../../../../../../../../core/extensions/build_context_extensions.dart";

class DistanceEstimate extends StatelessWidget {
  const DistanceEstimate({
    super.key,
    required this.distance,
    required this.icon,
  });

  final double distance;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Replaced fixed height/width with padding for a shrink-wrapped fit
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: context.colorScheme.surface, // The white/cream background
      ),
      child: Row(
        mainAxisSize:
            .min, // Ensures the row only takes as much space as the text/icon
        mainAxisAlignment: .center,
        children: [
          Icon(
            icon,
            size: 14,
            color: context
                .colorScheme
                .onSecondary, // Darker color to match screenshot
          ),
          const SizedBox(width: 4),
          Text(
            "${distance.toStringAsFixed(1)}km away", // Removed space before 'km' to match screenshot
            style: context.textTheme.labelMedium!.copyWith(
              color: context.colorScheme.onSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
