import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/presentation/pages/pages.dart';
import 'package:restaurant_app/provider/pages_provider.dart';

class MainPages extends StatelessWidget {
  const MainPages({super.key});

  static const routeName = "/home_page";

  static const _pageTitle = [
    "Explore",
    "Favorites",
    "Settings",
  ];

  static const _pages = [
    ExplorePage(),
    FavoritePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<PagesProvider>(
          builder: (_, value, __) => Text(
            _pageTitle[value.page],
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Consumer<PagesProvider>(
            builder: (_, value, __) {
              return _pages[value.page];
            },
          ),
        ),
      ),
      bottomNavigationBar: Consumer<PagesProvider>(
        builder: (_, value, __) {
          return NavigationBar(
            onDestinationSelected: (int index) {
              value.setPage(index);
            },
            selectedIndex: value.page,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.explore),
                icon: Icon(Icons.explore_outlined),
                tooltip: 'Explore restaurants',
                label: 'Explore',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.favorite),
                icon: Icon(Icons.favorite_border),
                label: 'Favorites',
                tooltip: 'Your favorite restaurants',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
