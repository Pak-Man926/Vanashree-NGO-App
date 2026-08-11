import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:vanashree_ngo_application/core/common/components/app_bar_widget.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/dashboard/presentation/plants_dashboard_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/map/presentation/map_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/profile/presentation/profile_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/feed/presentation/community_feed_page.dart';

import '../../../../../../core/extensions/build_context_extensions.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    PlantsDashboard(),
    MapPage(),
    CommunityFeed(),
    ProfilePage(),
  ];

  //final List<BottomNavigationBarItem> _tabs = const [];

  @override
  Widget build(BuildContext context) {
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
            bottom: MediaQuery.sizeOf(context).height - 160,
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
        child: IndexedStack(index: _currentIndex, children: _pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            //TODO: Change the state manager to riverpod
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: PhosphorIcon(PhosphorIcons.pottedPlant()),
            selectedIcon: PhosphorIcon(
              PhosphorIcons.pottedPlant(PhosphorIconsStyle.fill),
            ),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: PhosphorIcon(PhosphorIcons.mapPinArea()),
            selectedIcon: PhosphorIcon(
              PhosphorIcons.mapPinArea(PhosphorIconsStyle.fill),
            ),
            label: 'Map',
          ),
          NavigationDestination(
            icon: PhosphorIcon(PhosphorIcons.pottedPlant()),
            selectedIcon: PhosphorIcon(
              PhosphorIcons.pottedPlant(PhosphorIconsStyle.fill),
            ),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: PhosphorIcon(PhosphorIcons.user()),
            selectedIcon: PhosphorIcon(
              PhosphorIcons.user(PhosphorIconsStyle.fill),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
