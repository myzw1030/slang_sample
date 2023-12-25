import 'package:flutter/material.dart';
import 'package:slang_sample/i18n/strings.g.dart';
import 'package:slang_sample/pages/list_page.dart';
import 'package:slang_sample/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _pageWidgets = [
    const ListPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context);
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: translations.navigationBar.home.title,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: translations.navigationBar.settings.title,
          ),
        ],
      ),
    );
  }
}
