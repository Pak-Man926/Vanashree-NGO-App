import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/profile/presentation/widgets/profile_divider.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/profile/presentation/widgets/profile_list_tile.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/profile/presentation/widgets/profile_settings_card.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/profile/presentation/widgets/profile_settings_sections.dart';

import '../../../../../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../../../../../core/locator.dart';

class ProfileAboutAppSettingsSection extends StatelessWidget {
  const ProfileAboutAppSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    final aboutAppItems = [
      AccountItemModel(icon: Icons.info_outline, title: "About Vanasree"),
      AccountItemModel(
        icon: Icons.help_center_outlined,
        title: "Help & Support",
      ),
      AccountItemModel(icon: Icons.phone_iphone_outlined, title: "App Version"),
    ];

    return ProfileSettingsCard(
      children: List.generate(aboutAppItems.length, (index) {
        final item = aboutAppItems[index];
        if (item.title == 'App Version') {
          return Column(
            children: [
              ProfileListTile(
                icon: item.icon,
                title: item.title,
                trailing: FutureBuilder<String>(
                  future: appInfo.getVersion(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    }
                    if (snapshot.hasError) return const Text('----');
                    return Text(
                      snapshot.data ?? '-',
                      style: textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
              ),
              if (index < aboutAppItems.length - 1) const ProfileDivider(),
            ],
          );
        }
        return Column(
          children: [
            ProfileListTile(
              icon: item.icon,
              title: item.title,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            if (index < aboutAppItems.length - 1) const ProfileDivider(),
          ],
        );
      }),
    );
  }
}
