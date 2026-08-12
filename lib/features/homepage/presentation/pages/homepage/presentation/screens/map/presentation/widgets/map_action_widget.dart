import "package:flutter/material.dart";
import "package:vanashree_ngo_application/core/extensions/build_context_extensions.dart";

class MapActionWidget extends StatelessWidget {
  const MapActionWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isHighlighted,
  });

  final VoidCallback onTap;
  final IconData icon;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: isHighlighted == true
            ? context.colorScheme.primary
            : context.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 32,
          color: isHighlighted == true
              ? context.colorScheme.surface
              : context.colorScheme.primary,
        ),
      ),
    );
  }
}
