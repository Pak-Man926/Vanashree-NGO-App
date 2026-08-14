import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:vanashree_ngo_application/core/common/components/app_bar_widget.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/dashboard/presentation/plants_dashboard_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/map/presentation/map_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/profile/presentation/profile_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/feed/presentation/community_feed_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/providers/bottom_nav_provider.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/widgets/navigation_items.dart';

import '../../../../../../core/extensions/build_context_extensions.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    const List<Widget> pages = [
      PlantsDashboard(),
      MapPage(),
      CommunityFeed(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBarWidget(
        title: "Vanashree",
        centerTitle: false,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        actions: [const Icon(Icons.notifications_outlined)],
      ),
      body: DoubleTapToExit(
        snackBar: SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height - 240,
            left: 24,
            right: 24,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: context.colorScheme.secondary,
          content: Row(
            children: [
              Icon(Icons.info_outline, color: context.colorScheme.onSurface),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Press back again to exit the app",
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        child: IndexedStack(index: currentIndex, children: pages),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavItemWidget(
                index: 0,
                icon: PhosphorIcons.pottedPlant(),
                activeIcon: PhosphorIcons.pottedPlant(PhosphorIconsStyle.fill),
                label: 'Dashboard',
              ),
              NavItemWidget(
                index: 1,
                icon: PhosphorIcons.mapPinArea(),
                activeIcon: PhosphorIcons.mapPinArea(PhosphorIconsStyle.fill),
                label: 'Map',
              ),
              NavItemWidget(
                index: 2,
                icon: PhosphorIcons.pottedPlant(),
                activeIcon: PhosphorIcons.pottedPlant(PhosphorIconsStyle.fill),
                label: 'Feed',
              ),
              NavItemWidget(
                index: 3,
                icon: PhosphorIcons.user(),
                activeIcon: PhosphorIcons.user(PhosphorIconsStyle.fill),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
