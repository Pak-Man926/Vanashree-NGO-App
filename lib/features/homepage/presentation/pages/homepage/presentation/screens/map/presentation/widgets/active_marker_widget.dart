import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/common/constants/sizedbox_constants.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/map/presentation/widgets/custom_map_dot_widget.dart';

class ActiveMarkerWithToolTip extends StatelessWidget {
  const ActiveMarkerWithToolTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        //White info bubble
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: .min,
            children: [
              Icon(Icons.eco, size: 16, color: context.colorScheme.primary),
              const Spacing.horizontal(8),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Vata Vriksha",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: .bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Status: Thriving",
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.colorScheme.tertiary,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacing.vertical(5),
        //Map point indicator
        const SizedBox(width: 24, height: 24, child: CustomMapDot()),
      ],
    );
  }
}
