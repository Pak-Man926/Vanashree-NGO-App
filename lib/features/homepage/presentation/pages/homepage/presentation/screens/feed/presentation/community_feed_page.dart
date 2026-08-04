import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/common/constants/app_images.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/feed/presentation/widgets/distance_estimate_widget.dart';

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
                  color: context.colorScheme.primary.withOpacity(0.9),
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
                          color: context.colorScheme.inverseSurface.withOpacity(
                            0.4,
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
                          const Positioned(
                            left: 16,
                            top: 16,
                            child: DistanceEstimate(
                              distance: 0.8,
                              icon: Icons
                                  .location_on_outlined, // Outlined icon matches screenshot
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
