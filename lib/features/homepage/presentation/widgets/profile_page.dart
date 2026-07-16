import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vanashree_ngo_application/core/common/components/app_bar_widget.dart';
import 'package:vanashree_ngo_application/core/common/components/app_profile_widget.dart';
import 'package:vanashree_ngo_application/core/common/components/primary_button.dart';
import 'package:vanashree_ngo_application/core/common/constants/app_icons.dart';
import 'package:vanashree_ngo_application/core/common/constants/sizedbox_constants.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';
import 'package:vanashree_ngo_application/core/locator.dart';
import 'package:vanashree_ngo_application/features/homepage/di/notifier_di.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/state/profile_state.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/utils/account_items.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/widgets/personal_impact_card.dart';

import '../../domain/entity/personal_impact_entity.dart';

/// Basic demo UI for Profile CRUD operations.
/// This is intentionally simple and self-contained for development/demo purposes.
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);
    final notifier = ref.read(profileNotifierProvider.notifier);
    final textTheme = context.textTheme;
    final theme = context.theme;

    Widget bodyChild;
    if (state.status == ProfileStatus.loading) {
      bodyChild = const Center(child: CircularProgressIndicator());
    } else if (state.status == ProfileStatus.error) {
      bodyChild = Center(
        child: Text(
          state.message ?? 'Unknown error',
          style: textTheme.bodyMedium?.copyWith(color: Colors.red),
        ),
      );
    } else if (state.status == ProfileStatus.success && state.profile != null) {
      final profile = state.profile!;
      final personalImpact = <PersonalImpactEntity>[
        PersonalImpactEntity(
          icon: AppIcons.treesPlanted,
          title: "Trees Planted",
          value: profile.treesPlanted,
        ),
        PersonalImpactEntity(
          icon: AppIcons.treesActive,
          title: "Trees Active",
          value: profile.treesActive,
        ),
        PersonalImpactEntity(
          icon: AppIcons.careUpdates,
          title: "Care Update Logged",
          value: profile.careUpdateLogged,
        ),
        PersonalImpactEntity(
          icon: AppIcons.badgesEarned,
          title: "Badges Earned",
          value: profile.badgesEarned,
        ),
        PersonalImpactEntity(
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
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
              ),
            ),
            const Spacing.vertical(16),
            Align(
              alignment: AlignmentGeometry.center,
              child: CircularProfileImage(
                boxBorder: Border.all(
                  width: 4,
                  color: theme.colorScheme.secondary,
                ),
                size: 100,
                imageUrl: profile.profileImageUrl,
                errorIcon: Icons.error,
              ),
            ),
            const Spacing.vertical(8),
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                profile.name,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacing.vertical(32),
            const Text('Village'),
            const Spacing.vertical(4),
            Text(profile.village),
            const Spacing.vertical(24),
            const Text('Member Since'),
            const Spacing.vertical(4),
            Text(profile.memberSince),
            const Spacing.vertical(32),
            const Text("Personal Impact Summary"),
            const Spacing.vertical(16),
            SizedBox(
              height: 140,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: personalImpact.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) => SizedBox(
                  // width: 160,
                  child: PersonalImpactCard(
                    personalImpact: personalImpact[index],
                  ),
                ),
              ),
            ),
            const Spacing.vertical(16),
            PrimaryButton(
              shouldElevate: false,
              backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.2),
              textColor: theme.primaryColor,
              title: 'Badges & Achievements',
              suffixIcon: Icons.arrow_forward_ios,
              onPressed: () {},
            ),

            const Spacing.vertical(40),
            Text("Settings", style: textTheme.titleLarge),
            const Spacing.vertical(24),
            Text("General", style: textTheme.titleMedium),
            const Spacing.vertical(20),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text("Language"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [Text("English"), Icon(Icons.arrow_forward_ios)],
              ),
            ),
            const Spacing.vertical(8),
            ListTile(
              leading: const Icon(Icons.notifications_none),
              title: const Text("Notifications"),
              subtitle: const Text(
                "Toggle for push, SMS fallback, reminder notifications.",
              ),
              trailing: Switch.adaptive(value: true, onChanged: (value) {}),
            ),
            const Spacing.vertical(8),
            const ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Care Reminders & Notifications"),
            ),
            const Spacing.vertical(8),
            ListTile(
              leading: const Icon(Icons.wifi_off_outlined),
              title: const Text("Offline Mode"),
              subtitle: const Text("Toggle offline map download."),
              trailing: Switch.adaptive(value: true, onChanged: (value) {}),
            ),
            const Spacing.vertical(32),
            Text("Account", style: textTheme.titleMedium),
            const Spacing.vertical(24),
            Column(
              children: List.generate(
                3,
                (index) => ListTile(
                  leading: Icon(accountItems[index].icon),
                  title: Text(accountItems[index].title),
                ),
              ),
            ),
            const Spacing.vertical(40),
            Column(
              children: List.generate(aboutAppItems.length, (index) {
                final item = aboutAppItems[index];
                if (item.title == 'App Version') {
                  return ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    trailing: FutureBuilder<String>(
                      future: appInfo.getVersion(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        }
                        if (snapshot.hasError) return const Text('----');
                        return Text(
                          snapshot.data ?? '-',
                          style: textTheme.bodyLarge,
                        );
                      },
                    ),
                  );
                }
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.title),
                );
              }),
            ),
          ],
        ),
      );
    } else {
      bodyChild = const Center(child: Text('No profile loaded'));
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Profile', centerTitle: false),
      body: Padding(padding: const EdgeInsets.all(12.0), child: bodyChild),
    );
  }
}
