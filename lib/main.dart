import 'package:flutter/material.dart';
import 'app_drawer.dart'; // Import the AppDrawer
import 'bacaan_screen.dart'; // Import the BacaanScreen
import 'tips_khusu_screen.dart'; // Import the TipsKhusuScreen
import 'home_screen.dart'; // Import the HomeScreen
import 'gerakan_screen.dart'; // Import the GerakanScreen
import 'surah_screen.dart'; // Import the SurahScreen
import 'dzikir_screen.dart'; // Import the DzikirScreen
import 'doa_screen.dart'; // Import the new DoaScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NovAI-Sholat Khusu', // Updated title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'NovAI-Sholat Khusu'), // Updated home title
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Home tab content
    TipsKhusuScreen(), // Tips Khusu tab content
    GerakanScreen(), // Gerakan tab content (moved up)
    BacaanScreen(), // Bacaan tab content (moved down)
    SurahScreen(), // Surah tab content
    DzikirScreen(), // Dzikir tab content
    DoaScreen(), // Doa tab content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const AppDrawer(), // Use the refactored AppDrawer
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all labels are visible
        backgroundColor: Colors.white, // Set a clean background color
        elevation: 10.0, // Add elevation for a modern look
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Home tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Tips Khusu', // Tips Khusu tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Gerakan Sholat', // Gerakan tab (moved up)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Bacaan Sholat', // Bacaan tab (moved down)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Surah', // Surah tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Dzikir', // Dzikir tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Doa', // Doa tab
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple, // Highlight selected tab
        unselectedItemColor: Colors.grey, // Dim unselected tabs
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ), // Bold selected labels
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ), // Normal unselected labels
        showUnselectedLabels: true, // Ensure unselected labels are visible
        onTap: _onItemTapped,
        iconSize: 28.0, // Adjust icon size for better visibility
        selectedFontSize: 14.0, // Adjust font size for selected labels
        unselectedFontSize: 12.0, // Adjust font size for unselected labels
      ),
    );
  }
}
