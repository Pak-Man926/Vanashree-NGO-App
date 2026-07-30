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
      body: IndexedStack(index: _currentIndex, children: _pages),
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
