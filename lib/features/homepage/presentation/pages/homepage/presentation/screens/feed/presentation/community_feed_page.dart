import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:vanashree_ngo_application/core/common/constants/app_images.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/feed/presentation/widgets/distance_estimate_widget.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/feed/presentation/widgets/stacked_avatars_widget.dart';

import '../../../../../../../../../core/common/constants/sizedbox_constants.dart';

class CommunityFeed extends StatelessWidget {
  const CommunityFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              //Welcome guest section
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 30,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "THE MOVEMENT",
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onPrimaryFixedVariant,
                          fontSize: 18,
                        ),
                      ),
                      const Spacing.vertical(10),
                      Text(
                        "Roots Of Change Start With You.",
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: context.colorScheme.inverseSurface,
                        ),
                      ),
                      const Spacing.vertical(10),
                      Text(
                        "Join 2,400+ neighbours restoring the local canopy.\nEvery seedling tracked helps us secure more native habitat.",
                        style: context.textTheme.labelLarge!.copyWith(
                          color: context.colorScheme.inverseSurface.withValues(
                            alpha: 0.4,
                          ),
                        ),
                        maxLines: 4,
                      ),
                      const Spacing.vertical(20),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          color: context.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              "Join the movement",
                              style: context.textTheme.labelLarge!.copyWith(
                                color: context.colorScheme.primary,
                                fontFamily: "Sans-Serif",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacing.vertical(20),
              //Nearby activity section header
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Nearby Activity",
                    style: context.textTheme.headlineSmall,
                  ),
                  Text(
                    "Live Updates",
                    style: context.textTheme.labelLarge!.copyWith(
                      color: context.colorScheme.error,
                    ),
                  ),
                ],
              ),
              const Spacing.vertical(20),
              //Nearby activity section items
              Container(
                width: double.infinity,
                // Removed fixed height of 600 to allow the container to shrink-wrap its content
                decoration: BoxDecoration(
                  color: Colors
                      .transparent, // Let the scaffold background show through
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    // 1. Image Stack
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // Slightly softer radius matching design
                      child: Stack(
                        children: [
                          Image.asset(
                            AppImages.seedling,
                            width: double.infinity,
                            height:
                                400, // Adjust height as needed for your screen proportions
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 16,
                            top: 16,
                            child: DistanceEstimate(
                              distance: 0.8,
                              icon: PhosphorIcons.mapPinArea(
                                PhosphorIconsStyle.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacing.vertical(16),

                    // 2. Title and Action Row
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .start,
                      children: [
                        // Text Column (Wrapped in Expanded so it doesn't push the icon off-screen)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Silver Oak Sapling",
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context
                                      .colorScheme
                                      .onSecondary, // Or your dark text color
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacing.vertical(6),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Planted by ",
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                            color:
                                                context.colorScheme.secondary,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Arjun V.", // Updated to match your screenshot
                                      style: context.textTheme.bodyMedium!.copyWith(
                                        color: context
                                            .colorScheme
                                            .onSecondary, // Darker text for the name
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 3. Heart Icon Button
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context
                                .colorScheme
                                .surface, // The light cream/grey background
                          ),
                          child: Icon(
                            Icons.favorite_border_rounded,
                            size: 22,
                            color: context
                                .colorScheme
                                .onSecondary, // Dark icon color
                          ),
                        ),
                      ],
                    ),
                    const Spacing.vertical(16),
                    // Another plant item
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.colorScheme.outline.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              AppImages.tree,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Spacing.horizontal(16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Location Row
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: context.colorScheme.onSurface
                                          .withValues(alpha: 0.7),
                                      size: 16,
                                    ),
                                    const Spacing.horizontal(4),
                                    Text(
                                      "2.1KM AWAY", // Fixed typo and leading space
                                      style: context.textTheme.labelMedium!
                                          .copyWith(
                                            color: context.colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                            letterSpacing: 0.5,
                                          ),
                                    ),
                                  ],
                                ),
                                const Spacing.vertical(8),
                                // Title
                                Text(
                                  '"The Guardian"',
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: context.colorScheme.onSurface,
                                      ),
                                ),
                                const Spacing.vertical(4),
                                // Subtitle
                                Text(
                                  "Community Orchard Project", // Fixed typo
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                                const Spacing.vertical(12),
                                // Team Row
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Perfect Circle Avatar
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        color: Color(
                                          0xFFD7E6A3,
                                        ), // Light green matching the image
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "S",
                                        style: context.textTheme.labelSmall!
                                            .copyWith(
                                              color: Colors
                                                  .black, // Dark text for contrast
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    const Spacing.horizontal(8),
                                    Text(
                                      "Sylvan Grove Team",
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                            color: context.colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacing.vertical(30),
                    //Third Plant Item
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImages.flower,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 10,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: context.colorScheme.outline,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 4.0,
                                  bottom: 4.0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    PhosphorIcon(
                                      PhosphorIcons.leaf(),
                                      size: 28,
                                      color: context.colorScheme.primary,
                                    ),
                                    const Spacing.horizontal(8),
                                    Text(
                                      "Western Ghats Native",
                                      style: context.textTheme.headlineMedium!
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Calibri",
                                          ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "4.5km away",
                                      style: context.textTheme.titleSmall!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: context.colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacing.vertical(15),
                    //Plant Item info
                    Text(
                      "Wild Cinnamon Seedling",
                      style: context.textTheme.headlineSmall!.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    const Spacing.vertical(5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Planted by ",
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onSecondary
                                  .withOpacity(0.5),
                            ),
                          ),
                          TextSpan(
                            text: "Priya Nair",
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacing.vertical(30),
                    //Final feed item
                    Container(
                      // Let height dynamically wrap the content instead of hardcoding 250
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.colorScheme.onPrimary,
                        border: Border(
                          left: BorderSide(
                            color: context.colorScheme.primary,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 10.0,
                          bottom:
                              16.0, // Increased bottom padding slightly for breathing room
                          right: 5.0,
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          mainAxisSize: .min,
                          mainAxisAlignment: .start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.stars_rounded,
                                  size: 12,
                                  color:
                                      context.colorScheme.onPrimaryFixedVariant,
                                ),
                                const Spacing.horizontal(5),
                                Text(
                                  "MILESTONE",
                                  style: context.textTheme.bodySmall!.copyWith(
                                    color:
                                        context.colorScheme.tertiaryContainer,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Spacing.vertical(16),
                            Text(
                              "15 Seedlings planted this morning in Cubban Sector 4",
                              style: context.textTheme.titleLarge!.copyWith(
                                color: context.colorScheme.primary,
                                fontSize: 26,
                              ),
                            ),
                            const Spacing.vertical(12),
                            Text(
                              "\"Joining the movement was the best way to spend my Saturday. Highly recommend the 7 am slot!\" \- Rahul K. ",
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.primaryFixed,
                                fontFamily: "Sans-Serif",
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                            const Spacing.vertical(16), // Adjusted spacing
                            // The stacked avatars row
                            const StackedAvatars(
                              imageUrls: [
                                AppImages
                                    .avatar1, // Replace with proper user avatar paths
                                AppImages.avatar2,
                              ],
                              remainingCount: 12,
                              radius: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacing.vertical(50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
