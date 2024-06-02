import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'home_page.dart';
import 'user_page.dart';
import 'adoption_page.dart';
import 'add_adoption_page.dart';
import '../configs/constant.dart';

class BottomPage extends StatefulWidget {
  final int initialTabIndex;

  const BottomPage({super.key, required this.initialTabIndex});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    AddAdoptionPage(),
    AdoptionPage(),
    UserPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.money_send),
            label: 'Donasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.menu_board),
            label: 'Adopsi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.security_user4),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Constant.colorSecondary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
