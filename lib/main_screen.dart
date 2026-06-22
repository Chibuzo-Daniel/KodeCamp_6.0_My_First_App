import 'package:flutter/material.dart';
import 'profile_screen.dart'; 

class MainScreen extends StatefulWidget {
  //  Declare the variables that will hold user information
  final String userName;
  final String userEmail;
  final bool isFromLogin;

  // the constructor that accepts the parameters
  const MainScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.isFromLogin,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // initialise navigation tab index to track active tab
  int _currentIndex = 0;

  // list of screens corresponding to each bottom navigation tab 
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    
    // populating the list with screen and its corresponding tab
    _screens = [
      // the home tab
      _buildHomeTab(),
      //add to cart tab
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 64, color: Color(0xFF009BBD)),
            Text('Your Cart', style: TextStyle(color: Color(0xFF009BBD))),
            
          ],
        ),
      ),
      // profile screen tab
      ProfileScreen(
        userName: widget.userName,
        userEmail: widget.userEmail,
        isFromLogin: widget.isFromLogin,
      ),
      // Notification tab
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.notifications_outlined, size: 64, color: Color(0xFF009BBD)),
            Text('Notifications', style: TextStyle(color: Color(0xFF009BBD)))
            ])
     ),
      // Settings tab
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.settings_outlined, size: 64, color: Color(0xFF009BBD)),
            Text('Settings', style: TextStyle(color: Color(0xFF009BBD)))
           ])
      ),
    ];
  }

 // widget builder for the home screen with the welcome message
  Widget _buildHomeTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home_outlined, size: 64, color: Color(0xFF009BBD)),
            const SizedBox(height: 16),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF009BBD)),
            ),
            const SizedBox(height: 8),
            // Requirement check: Always show email from login or registration context
            Text(
              widget.userEmail,
              style: TextStyle(fontSize: 20, color: Color(0xFF009BBD)),
            ),
          ],
        ),
      ),
    );
  }
// widget build builder for for 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Displays the widget corresponding to the selected tab index
      body: _screens[_currentIndex],
      
      // Bottom Navigation Bar Implementation matching the UI task image layout
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 10, spreadRadius: 1),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            // Update state dynamically when user selects a different navigation option
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed, // Essential for handling more than 3 tabs cleanly
          selectedItemColor: const Color(0xFF009BBD),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,

          //adding corresponding icons to the screen and its active form too
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), activeIcon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person_outline), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), activeIcon: Icon(Icons.notifications_outlined), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), activeIcon: Icon(Icons.settings_outlined), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}