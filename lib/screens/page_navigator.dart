import 'package:flutter/material.dart';
import 'package:sanal_lira/core/constant.dart';
import 'package:sanal_lira/screens/home_screen.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({Key? key}) : super(key: key);

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          // SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        unselectedItemColor: kPrimaryColor,
        selectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
            currentIndex = index;
          });
        },
      ),
    );
  }
}
