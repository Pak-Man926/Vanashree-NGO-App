import "package:flutter/material.dart";
import "package:vanashree_ngo_application/core/common/components/primary_button.dart";
import "package:vanashree_ngo_application/core/common/constants/sizedbox_constants.dart";
import "package:vanashree_ngo_application/core/extensions/build_context_extensions.dart";
import "package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/feed/presentation/widgets/stacked_avatars_widget.dart";

import "../../../../../../../../../../core/common/constants/app_images.dart";

class DetailsContainerWidget extends StatelessWidget {
  const DetailsContainerWidget({
    super.key,
    required this.headLine,
    required this.distance,
  });

  final String headLine;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .start,
              children: [
                Text(
                  "SELECTED SITE",
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.tertiaryContainer,
                    fontSize: 12,
                    fontWeight: .bold,
                    letterSpacing: 2.0,
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  //padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      "$distance km away",
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.primary.withOpacity(0.9),
                        fontSize: 12,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //const Spacing.vertical(2),
            Text(
              headLine,
              style: context.textTheme.labelMedium!.copyWith(
                color: context.colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const Spacing.vertical(8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined, // Or PhosphorIcons.mapPin()
                  size: 16,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                const Spacing.horizontal(6),
                Text(
                  "12.9716° N, 77.5946° E",
                  style: context.textTheme.labelMedium!.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                    letterSpacing:
                        1.5, // Gives it that spaced-out, technical look
                    fontFamily:
                        'Courier', // Or 'Roboto Mono' / any monospace font you have
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacing.vertical(10),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                //Container on the left
                Container(
                  height: 80,
                  width: 160,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.outline.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Planted on",
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.secondary,
                          fontSize: 12,
                        ),
                      ),
                      const Spacing.vertical(5),
                      Text(
                        "Oct 12, 2023",
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.primary,
                          fontSize: 16,
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                ),
                //Container on the right
                Container(
                  height: 80,
                  width: 160,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.outline.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Community Care",
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.secondary,
                          fontSize: 12,
                        ),
                      ),
                      const Spacing.vertical(5),
                      // Text("Oct 12, 2023", style: context.textTheme.bodyMedium!.copyWith(
                      //   color: context.colorScheme.primary.withOpacity(0.8),
                      //   fontSize: 12,
                      // ))
                      const StackedAvatars(
                        imageUrls: [
                          AppImages
                              .avatar1, // Replace with proper user avatar paths
                          AppImages.avatar2,
                        ],
                        remainingCount: 4,
                        radius: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacing.vertical(14),
            PrimaryButton(
              backgroundColor: context.colorScheme.primary,
              borderRadius: 12.0,
              textColor: context.colorScheme.surface,
              title: "View Seedling Timeline",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
