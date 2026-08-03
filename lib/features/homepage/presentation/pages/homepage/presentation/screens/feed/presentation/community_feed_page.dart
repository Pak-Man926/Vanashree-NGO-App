import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/common/constants/app_images.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

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
                height: 300,
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
                          color: context.colorScheme.error.withOpacity(0.4),
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
                          color: context.colorScheme.secondary,
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
                              style: context.textTheme.bodyLarge,
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
                      color: context.colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
              const Spacing.vertical(20),
              //Nearby activity section items
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      height: 500,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppImages.seedling,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Spacing.vertical(20),
                    Text("Silver Oak Sapling", style: context.textTheme.headlineSmall!.copyWith(color:context.colorScheme.onSecondary)),
                    const Spacing.vertical(10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Planted by ",
                            style: context.textTheme.labelLarge!.copyWith(
                              color: context.colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                            text: "John Doe",
                            style: context.textTheme.labelLarge!.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                          
                          const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.favorite_border_rounded, size: 16),
                      ),
                        ],
                      ),
                    ),
                  ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
