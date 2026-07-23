import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/dashboard/presentation/screens/homepage/presentation/home_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/dashboard/presentation/screens/map/presentation/map_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/dashboard/presentation/screens/profile/presentation/profile_page.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/dashboard/presentation/screens/feed/presentation/search_page.dart';

import '../../../../../../core/extensions/build_context_extensions.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    MapPage(),
    SearchPage(),
    ProfilePage(),
  ];

  //final List<BottomNavigationBarItem> _tabs = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vanashree",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.primary,
          ),
        ),
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            selectedIcon: Icon(Icons.location_on),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
