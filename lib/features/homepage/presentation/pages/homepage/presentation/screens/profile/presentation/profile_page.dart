// Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Core component imports

import 'package:vanashree_ngo_application/core/common/components/primary_button.dart';
import 'package:vanashree_ngo_application/core/common/constants/app_icons.dart';
import 'package:vanashree_ngo_application/core/common/constants/sizedbox_constants.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

// Feature/State imports
import 'package:vanashree_ngo_application/features/homepage/di/notifier_di.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/profile/presentation/widgets/profile_about_sections.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/state/profile_state.dart';

// Widget imports
import 'widgets/personal_impact_card.dart';
import 'widgets/profile_header_card.dart';
import 'widgets/profile_section_title.dart';
import 'widgets/profile_settings_card.dart';
import 'widgets/profile_list_tile.dart';
import 'widgets/profile_divider.dart';
import 'widgets/profile_settings_sections.dart';

/// Basic demo UI for Profile CRUD operations.
/// This is intentionally simple and self-contained for development/demo purposes.
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);
    final textTheme = context.textTheme;
    final theme = context.theme;

    Widget bodyChild;
    if (state.status == ProfileStatus.loading) {
      bodyChild = const Center(child: CircularProgressIndicator());
    } else if (state.status == ProfileStatus.error) {
      bodyChild = Center(
        child: Text(
          state.message ?? 'Unknown error',
          style: textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
        ),
      );
    } else if (state.status == ProfileStatus.success && state.profile != null) {
      final profile = state.profile!;
      final personalImpact = <PersonalImpactModel>[
        PersonalImpactModel(
          icon: AppIcons.treesPlanted,
          title: "Trees Planted",
          value: profile.treesPlanted,
        ),
        PersonalImpactModel(
          icon: AppIcons.treesActive,
          title: "Trees Active",
          value: profile.treesActive,
        ),
        PersonalImpactModel(
          icon: AppIcons.careUpdates,
          title: "Care Update Logged",
          value: profile.careUpdateLogged,
        ),
        PersonalImpactModel(
          icon: AppIcons.badgesEarned,
          title: "Badges Earned",
          value: profile.badgesEarned,
        ),
        PersonalImpactModel(
          icon: AppIcons.daysStreak,
          title: "Days Streak",
          value: profile.daysStreak,
        ),
      ];

      bodyChild = SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Card
            ProfileHeaderCard(profile: profile),
            const Spacing.vertical(32),

            // Personal Impact Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.auto_graph, color: theme.colorScheme.primary),
                  const Spacing.horizontal(8),
                  Text(
                    "Personal Impact Summary",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const Spacing.vertical(16),
            SizedBox(
              height: 150,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: personalImpact.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) => SizedBox(
                  width: 140, // Increased width for better card proportions
                  child: PersonalImpactCard(
                    personalImpact: personalImpact[index],
                  ),
                ),
              ),
            ),
            const Spacing.vertical(24),

            // Badges Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PrimaryButton(
                shouldElevate: false,
                backgroundColor: theme.colorScheme.primaryContainer,
                textColor: theme.colorScheme.onPrimaryContainer,
                title: 'Badges & Achievements',
                suffixIcon: Icons.arrow_forward_ios,
                onPressed: () {},
              ),
            ),

            const Spacing.vertical(40),

            // Settings Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Settings",
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacing.vertical(16),

            // General Settings
            const ProfileSectionTitle(title: "General"),
            const Spacing.vertical(8),
            ProfileSettingsCard(
              children: [
                ProfileListTile(
                  icon: Icons.language,
                  title: "Language",
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("English", style: textTheme.bodyMedium),
                      const Spacing.horizontal(4),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
                const ProfileDivider(),
                ProfileListTile(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  subtitle:
                      "Toggle for push, SMS fallback, reminder notifications.",
                  trailing: Switch.adaptive(value: true, onChanged: (value) {}),
                ),
                const ProfileDivider(),
                const ProfileListTile(
                  icon: Icons.date_range,
                  title: "Care Reminders & Notifications",
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const ProfileDivider(),
                ProfileListTile(
                  icon: Icons.wifi_off_outlined,
                  title: "Offline Mode",
                  subtitle: "Toggle offline map download.",
                  trailing: Switch.adaptive(value: true, onChanged: (value) {}),
                ),
              ],
            ),
            const Spacing.vertical(24),

            // Account Settings
            const ProfileSectionTitle(title: "Account"),
            const Spacing.vertical(8),
            const ProfileAccountSettingsSection(),
            const Spacing.vertical(24),

            // About App Settings
            const ProfileSectionTitle(title: "About App"),
            const Spacing.vertical(8),
            const ProfileAboutAppSettingsSection(),
            const Spacing.vertical(32),
          ],
        ),
      );
    } else {
      bodyChild = const Center(child: Text('No profile loaded'));
    }

    return Scaffold(
      //appBar: const AppBarWidget(title: 'Profile', centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: bodyChild,
      ),
    );
  }
}
