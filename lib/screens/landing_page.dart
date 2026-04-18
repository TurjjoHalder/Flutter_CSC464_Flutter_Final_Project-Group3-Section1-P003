
import 'package:flutter/material.dart';

import 'screens.dart'; 

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  int _currentIndex = 0;

  // The list of screens to show based on the index
  final List<Widget> pages = [
    ProductsScreen(),           // Index 0: 
    const OrderHistoryScreen(), // Index 1: 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        currentIndex: _currentIndex, // Highlights the active tab
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Triggers a rebuild to show the new page!
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home), 
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt), 
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}

