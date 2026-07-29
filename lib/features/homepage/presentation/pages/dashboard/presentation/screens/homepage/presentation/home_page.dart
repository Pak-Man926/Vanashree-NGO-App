import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/dashboard/presentation/screens/homepage/presentation/widgets/plant_info_container.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/dashboard/presentation/screens/homepage/presentation/widgets/request_button.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/dashboard/presentation/screens/homepage/presentation/widgets/status_info_container.dart';


import '../../../../../../../../../core/common/constants/sizedbox_constants.dart';
import '../../../../../../../../../core/extensions/build_context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 15.0, top: 10.0),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text(
                "THE LIVING ARCHIVE",
                //textAlign: TextAlign.left,
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.theme.colorScheme.tertiaryContainer,
                ),
              ),
              const Spacing.vertical(5),
              Text("My Plants", style: context.textTheme.displayMedium),
              const Spacing.vertical(5),
              Text(
                "Monitoring your curated collection of native seedlings and their ecological progress.",
                style: context.textTheme.bodyLarge,
              ),
              const Spacing.vertical(15),
              const Row(
                children: [
                  // Left Card
                  Expanded(
                    child: EnvironmentalStatsRow(
                      title: 'ACTIVE GROWTH',
                      value: '12',
                      isHighlighted: false,
                    ),
                  ),

                  Spacing.horizontal(12), // Gap between cards
                  // Right Card
                  Expanded(
                    child: EnvironmentalStatsRow(
                      title: 'CARBON OFFSET',
                      value: '4.2kg',
                      isHighlighted: true, // Turns on the left border
                    ),
                  ),
                ],
              ),
              const Spacing.vertical(30),
              const PlantInfoContainer(
                heading: "Green Sentinel",
                subheading: "Neem(Azadirachta indica)",
                details: "Planted by Ananya Rao",
                statusLabel: "WATERING",
                statusIcon: Icons.water_drop_rounded,
                isStatusPriority: true,
              ),
              const Spacing.vertical(10),
              const PlantInfoContainer(
                heading: "River Guardian",
                subheading: "Bamboo (Bambusoideae)",
                details: "Planted by Rahul Mahra",
                statusLabel: "HEALTHY",
                statusIcon: Icons.check_circle_rounded,
                isStatusPriority: false,
              ),
              const Spacing.vertical(10),
              const PlantInfoContainer(
                heading: "Shadow Bloom",
                subheading: "Peepal(Ficus religiosa)",
                details: "Planted by You",
                statusLabel: "PESTICIDE",
                statusIcon: Icons.bug_report_rounded,
                isStatusPriority: true,
              ),
              const Spacing.vertical(10),
              const PlantInfoContainer(
                heading: "Silent Oak",
                subheading: 'Indian Oak (Barringtonia acutangula)',
                details: "Planted by Surash K.",
                statusLabel: "GROWING",
                statusIcon: Icons.energy_savings_leaf_rounded,
                isStatusPriority: false,
              ),
              const Spacing.vertical(20),
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      PhosphorIcon(PhosphorIcons.pottedPlant(), size: 48),
                      const Spacing.vertical(5),
                      Text(
                        "Expand Your Archive",
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      const Spacing.vertical(5),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, right: 20),
                        child: Text(
                          "Adding new native species increases local biodiversity. Request a new seedling today.",
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                      const Spacing.vertical(10),
                      // PrimaryButton(
                      //   padding: Paddings.kVerticalPadding24,
                      //   borderRadius: 32,
                      //   shouldElevate: false,
                      //   backgroundColor: context.colorScheme.primary,
                      //   textColor: context.colorScheme.onPrimary,
                      //   title: "Request Seedling",
                      //   onPressed: () {},
                      // ),
                      RequestButton(
                        onPressed: () {},
                        label: "Request Seedlings",
                      ),
                    ],
                  ),
                ),
              ),
              const Spacing.vertical(90),
            ],
          ),
        ),
      ),
    );
  }
}
