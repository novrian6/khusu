import 'package:flutter/material.dart';
import 'app_drawer.dart'; // Import the AppDrawer
import 'gerakan_screen.dart'; // Import the GerakanScreen

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
    Text('Bacaan Page'), // Bacaan tab content
    GerakanScreen(), // Gerakan tab content
    Text('Surah Page'), // Surah tab content
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bacaan..',
          ), // Bacaan tab
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Gerakan..',
          ), // Gerakan tab
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Surah..',
          ), // Surah tab
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
