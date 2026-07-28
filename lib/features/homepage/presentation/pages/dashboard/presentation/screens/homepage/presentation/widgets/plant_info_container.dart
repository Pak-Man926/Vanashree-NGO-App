import "package:flutter/material.dart";
import "package:vanashree_ngo_application/core/common/constants/app_images.dart";
import "package:vanashree_ngo_application/core/extensions/build_context_extensions.dart";

import "../../../../../../../../../../core/common/constants/sizedbox_constants.dart";

class PlantInfoContainer extends StatelessWidget {
  const PlantInfoContainer({
    super.key,
    required this.heading,
    required this.subheading,
    required this.details,
  });

  final String heading;
  final String subheading;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: context.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 80,
                width: 80,
                child: Image.asset(AppImages.seedling),
              ),
            ),
            const Spacing.horizontal(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    heading,
                    style: context.textTheme.labelLarge!.copyWith(
                      color: context.colorScheme.onSecondary,
                    ),
                  ),
                  const Spacing.vertical(5),
                  Text(
                    subheading,
                    style: context.textTheme.labelMedium!.copyWith(
                      color: context.colorScheme.primaryFixed,
                    ),
                  ),
                  const Spacing.vertical(10),
                  // TextButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.person, size: 11),
                  //   label: Text(
                  //     details,
                  //     style: context.textTheme.labelSmall!.copyWith(
                  //       color: context.colorScheme.primaryFixed,
                  //     ),
                  //   ),
                  // ),
                  Text.rich(
                    TextSpan(children:[
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.person_outline_sharp, size: 16,)),
                        TextSpan(text: details, style: context.textTheme.labelMedium!.copyWith(
                      color: context.colorScheme.primaryFixed,
                    ),)
                    ] ),
                    
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
