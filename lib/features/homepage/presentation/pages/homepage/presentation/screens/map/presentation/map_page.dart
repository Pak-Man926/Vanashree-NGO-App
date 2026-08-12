import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:vanashree_ngo_application/core/common/constants/sizedbox_constants.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/map/presentation/widgets/details_container_widget.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/map/presentation/widgets/map_action_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Base layer/map

          //Overlay of gradients

          //Positioned Search bar widget
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .center,
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: context.colorScheme.secondary,
                    size: 24,
                  ),
                  Text(
                    "Search local paintings...",
                    style: context.textTheme.headlineSmall!.copyWith(
                      color: context.colorScheme.tertiary,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.tune, size: 30),
                    color: context.colorScheme.secondary,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          //Map action buttons(Placed on the right side)
          Positioned(
            right: 20,
            bottom: 320,
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                MapActionWidget(
                  onTap: () {},
                  icon: PhosphorIcons.stack(),
                  isHighlighted: false,
                ),
                const Spacing.vertical(10),
                MapActionWidget(
                  onTap: () {},
                  icon: PhosphorIcons.crosshair(),
                  isHighlighted: true,
                ),
              ],
            ),
          ),
          //Details Container 
          const Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: DetailsContainerWidget(
              headLine: "Vata Vriksha (Banyan)",
              distance: "2.4",
            ),
          ),
        ],
      ),
    );
  }
}
