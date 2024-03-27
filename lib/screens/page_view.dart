import 'package:flutter/material.dart';

enum HomeTab {
  search,
  cart,
  settings,
}

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  HomeTab currentTab = HomeTab.search;
  late final pageController = PageController(
    initialPage: currentTab.index,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      body: PageView(
        onPageChanged: _onTabChanged,
        controller: pageController,
        children: [
          for (final tab in HomeTab.values)
            Container(
              color: tabColor(tab),
              child: Center(
                child: Text(tab.name),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab.index,
        onTap: (i) {
          _onTabChanged(i);
          pageController.jumpToPage(
            i,
          );
        },
        items: HomeTab.values.map(
          (tab) {
            return BottomNavigationBarItem(
              icon: Icon(
                tabIcon(tab),
              ),
              label: tab.name,
            );
          },
        ).toList(),
      ),
    );
  }

  void _onTabChanged(int i) {
    setState(() {
      currentTab = HomeTab.values[i];
    });
  }

  IconData tabIcon(HomeTab tab) {
    switch (tab) {
      case HomeTab.search:
        return Icons.search;
      case HomeTab.cart:
        return Icons.shopping_cart;
      case HomeTab.settings:
        return Icons.settings;
    }
  }

  Color tabColor(HomeTab tab) {
    switch (tab) {
      case HomeTab.search:
        return Colors.blueAccent;
      case HomeTab.cart:
        return Colors.redAccent;
      case HomeTab.settings:
        return Colors.yellowAccent;
    }
  }
}
