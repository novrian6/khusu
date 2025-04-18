import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'app_drawer.dart';
import 'bacaan_screen.dart';
import 'tips_khusu_screen.dart';
import 'home_screen.dart';
import 'gerakan_screen.dart';
import 'surah_screen.dart';
import 'dzikir_screen.dart';
import 'doa_screen.dart';
import 'waktu_sholat_screen.dart'; // Import the new screen

// Ensure plugins are initialized properly before app starts
void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations (optional)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Remove pre-check permissions code since we're removing GPS functionality

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? _mainTabController;
  String _currentTime = '';
  late Timer _timer;

  // Define our main categories
  final List<TabCategory> _categories = [
    TabCategory(title: 'Home', icon: Icons.home, screens: [HomeScreen()]),
    TabCategory(
      title: 'Sholat',
      icon: Icons.mosque,
      screens: [TipsKhusuScreen(), GerakanScreen(), BacaanScreen()],
      tabLabels: ['Tips Khusu', 'Gerakan', 'Bacaan'],
      tabIcons: [Icons.book, Icons.accessibility_new, Icons.directions_run],
    ),
    TabCategory(
      title: 'Waktu',
      icon: Icons.access_time,
      screens: [WaktuSholatScreen()],
    ),
    TabCategory(
      title: 'Lainnya',
      icon: Icons.menu_book,
      screens: [SurahScreen(), DzikirScreen(), DoaScreen()],
      tabLabels: ['Surah', 'Dzikir', 'Doa'],
      tabIcons: [Icons.menu_book, Icons.self_improvement, Icons.favorite],
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the controller after super.initState()
    _mainTabController = TabController(length: _categories.length, vsync: this);
    _mainTabController!.addListener(_handleTabSelection);

    // Initialize time and set up timer for real-time updates
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    final timeString =
        '${_formatTimeUnit(now.hour)}:${_formatTimeUnit(now.minute)}:${_formatTimeUnit(now.second)}';
    setState(() {
      _currentTime = timeString;
    });
  }

  String _formatTimeUnit(int unit) {
    return unit < 10 ? '0$unit' : '$unit';
  }

  @override
  void dispose() {
    // Safely remove listener and dispose
    _mainTabController?.removeListener(_handleTabSelection);
    _mainTabController?.dispose();
    _timer.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  void _handleTabSelection() {
    if (_mainTabController!.indexIsChanging) {
      setState(() {
        _selectedIndex = _mainTabController!.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure controller is initialized before building UI
    if (_mainTabController == null) {
      _mainTabController = TabController(
        length: _categories.length,
        vsync: this,
      );
      _mainTabController!.addListener(_handleTabSelection);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Text(widget.title),
            const Spacer(),
            // Current time display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  Text(_currentTime, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // Main category selector at the top
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: _mainTabController!,
              tabs:
                  _categories
                      .map(
                        (category) => Tab(
                          icon: Icon(category.icon),
                          text: category.title,
                        ),
                      )
                      .toList(),
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.deepPurple,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              isScrollable: true,
            ),
          ),

          // Content area with bottom sub-tabs
          Expanded(
            child: TabBarView(
              controller: _mainTabController!,
              children:
                  _categories.map((category) {
                    // If this category has subtabs
                    if (category.screens.length > 1) {
                      return DefaultTabController(
                        length: category.screens.length,
                        child: Stack(
                          children: [
                            // Content area
                            Positioned.fill(
                              bottom: 50, // Space for the bottom tabs
                              child: TabBarView(children: category.screens),
                            ),

                            // Sub-tabs at the bottom
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              height: 50,
                              child: Container(
                                color: Colors.white,
                                child: TabBar(
                                  isScrollable: true,
                                  tabs: List.generate(
                                    category.tabLabels.length,
                                    (index) => Tab(
                                      icon: Icon(category.tabIcons[index]),
                                      text: category.tabLabels[index],
                                    ),
                                  ),
                                  labelColor: Colors.deepPurple,
                                  unselectedLabelColor: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Single screen category (like Home)
                      return category.screens[0];
                    }
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper class to organize tabs
class TabCategory {
  final String title;
  final IconData icon;
  final List<Widget> screens;
  final List<String> tabLabels;
  final List<IconData> tabIcons;

  TabCategory({
    required this.title,
    required this.icon,
    required this.screens,
    this.tabLabels = const [],
    this.tabIcons = const [],
  });
}
