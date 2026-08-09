import "package:flutter/material.dart";
import "package:vanashree_ngo_application/core/common/constants/app_images.dart";
import "package:vanashree_ngo_application/core/extensions/build_context_extensions.dart";
import "package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/dashboard/presentation/widgets/plant_status_container.dart";
import "../../../../../../../../../../core/common/constants/sizedbox_constants.dart";

class PlantInfoContainer extends StatelessWidget {
  const PlantInfoContainer({
    super.key,
    required this.heading,
    required this.subheading,
    required this.details,
    required this.statusLabel,
    required this.statusIcon,
    required this.isStatusPriority,
  });

  final String heading;
  final String subheading;
  final String details;
  final String statusLabel;
  final IconData statusIcon;
  final bool isStatusPriority;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Removed fixed height of 120 to allow the container to grow if text wraps,
      // or you can keep it if you strictly want uniform card sizes.
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Fixed syntax typo here
        children: [
          // 1. Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(AppImages.seedling, fit: BoxFit.cover),
            ),
          ),
          const Spacing.horizontal(12),

          // 2. Text Section (Wrapped in Expanded)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: context.textTheme.labelLarge!.copyWith(
                    color: context.colorScheme.onSecondary,
                  ),
                  maxLines: 1, // Prevents text from breaking layout
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacing.vertical(4),
                Text(
                  subheading,
                  style: context.textTheme.labelMedium!.copyWith(
                    color: context.colorScheme.primaryFixed,
                  ),
                  maxLines: 2, // Allows long botanical names to wrap cleanly
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacing.vertical(8),
                Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.person_outline_sharp, size: 16),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 4),
                      ), // Added spacing between icon and text
                      TextSpan(
                        text: details,
                        style: context.textTheme.labelMedium!.copyWith(
                          color: context.colorScheme.primaryFixed,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacing.horizontal(8),

          // 3. Status Chip
          PlantStatusContainer(
            label: statusLabel,
            icon: statusIcon,
            priority: isStatusPriority,
          ),
        ],
      ),
    );
  }
}
