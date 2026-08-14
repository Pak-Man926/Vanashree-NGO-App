import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vanashree_ngo_application/config/router/route_names/route_names.dart';

import 'profile_list_tile.dart';
import 'profile_divider.dart';
import 'profile_settings_card.dart';

class AccountItemModel {
  final IconData icon;
  final String title;

  AccountItemModel({required this.icon, required this.title});
}

class ProfileAccountSettingsSection extends StatelessWidget {
  const ProfileAccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final accountItems = [
      AccountItemModel(icon: Icons.person_outline, title: "Edit Profile"),
      AccountItemModel(
        icon: Icons.phone_android_outlined,
        title: "Change Mobile Number",
      ),
      AccountItemModel(icon: Icons.logout, title: "Log out"),
    ];

    return ProfileSettingsCard(
      children: List.generate(
        accountItems.length,
        (index) => Column(
          children: [
            ProfileListTile(
              icon: accountItems[index].icon,
              title: accountItems[index].title,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                if (accountItems[index].title == "Log out") {
                  context.go(RouteNames.auth.login);
                }
              },
            ),
            if (index < accountItems.length - 1) const ProfileDivider(),
          ],
        ),
      ),
    );
  }
}
