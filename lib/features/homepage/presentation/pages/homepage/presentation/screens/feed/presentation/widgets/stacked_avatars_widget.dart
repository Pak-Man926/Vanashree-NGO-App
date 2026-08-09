import "package:flutter/material.dart";
import "package:vanashree_ngo_application/core/extensions/build_context_extensions.dart";

class StackedAvatars extends StatelessWidget {
  final List<String> imageUrls;
  final int remainingCount;
  final double radius;

  const StackedAvatars({
    super.key,
    required this.imageUrls,
    required this.remainingCount,
    this.radius = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...imageUrls.map((url) {
          return Align(
            widthFactor: 0.7,
            child: _buildAvatarBorder(
              context: context,
              child: CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage(url),
              ),
            ),
          );
        }),
        if (remainingCount > 0)
          Align(
            widthFactor: 0.7,
            child: _buildAvatarBorder(
              context: context,
              child: CircleAvatar(
                radius: radius,
                backgroundColor: const Color(0xFF2E4636), // Deep green color
                child: Text(
                  '+$remainingCount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: radius * 0.75, // Dynamically scales with radius
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAvatarBorder({
    required BuildContext context,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // Automatically reads the background color of the parent container
        // to render a clean, seamless overlapping cutoff.
        border: Border.all(color: context.colorScheme.onPrimary, width: 2.5),
      ),
      child: child,
    );
  }
}
