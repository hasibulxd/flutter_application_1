import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FullScreenImages(),
    );
  }
}

class FullScreenImages extends StatefulWidget {
  @override
  _FullScreenImagesState createState() => _FullScreenImagesState();
}

class _FullScreenImagesState extends State<FullScreenImages> {
  int _selectedIndex = 0; // To track the selected index of the navigation bar

  final List<String> imageUrls = [];

  // List of screens for navigation
  final List<Widget> _screens = [
    FullScreenImagesPage(), // Image screen
    SettingsPage(), // Settings screen (placeholder)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full Screen Images')),
      drawer: Drawer(
        elevation:
            16, // Add elevation to make the drawer feel like it's "popping"
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://www.w3schools.com/w3images/avatar2.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hey, Kazol 👋',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            _buildDrawerItem('Image 1', () {
              _onItemClick('Image 1');
            }),
            _buildDrawerItem('Image 2', () {
              _onItemClick('Image 2');
            }),
            _buildDrawerItem('Image 3', () {
              _onItemClick('Image 3');
            }),
          ],
        ),
      ),
      body: _screens[
          _selectedIndex], // Show the selected screen (Image or Settings)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavigationItemTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Images'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // Method to build a clickable ListTile with InkWell for ripple effect
  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  // Method to handle item click in the drawer
  void _onItemClick(String item) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('You clicked $item')));
  }

  // Method to handle bottom navigation bar taps
  void _onNavigationItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// Image screen widget
class FullScreenImagesPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://plus.unsplash.com/premium_photo-1726034848668-a198809902b6?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1725504225885-8ae372fa5cba?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1679329103267-624f9775f317?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1664304457330-734f625ff6e5?q=80&w=2067&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: imageUrls.map((url) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(url, fit: BoxFit.cover),
          );
        }).toList(),
      ),
    );
  }
}

// Settings screen widget (placeholder)
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Page', style: TextStyle(fontSize: 24)));
  }
}
