import 'package:flutter/material.dart';
import '../widgets/organized_tab_view.dart';

class TabOrganizationExample extends StatelessWidget {
  const TabOrganizationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define your tab groups and their tabs
    final List<TabGroup> tabGroups = [
      TabGroup(
        title: 'Prayers',
        icon: Icons.access_time,
        tabs: [
          TabItem(
            title: 'Prayer Times',
            icon: Icons.schedule,
            content: const Center(child: Text('Prayer Times Content')),
          ),
          TabItem(
            title: 'Qibla',
            icon: Icons.explore,
            content: const Center(child: Text('Qibla Direction Content')),
          ),
          TabItem(
            title: 'Calendar',
            icon: Icons.calendar_today,
            content: const Center(child: Text('Islamic Calendar Content')),
          ),
        ],
      ),
      TabGroup(
        title: 'Learn',
        icon: Icons.book,
        tabs: [
          TabItem(
            title: 'Quran',
            icon: Icons.menu_book,
            content: const Center(child: Text('Quran Content')),
          ),
          TabItem(
            title: 'Hadith',
            icon: Icons.history_edu,
            content: const Center(child: Text('Hadith Content')),
          ),
        ],
      ),
      TabGroup(
        title: 'Tools',
        icon: Icons.handyman,
        tabs: [
          TabItem(
            title: 'Tasbih',
            icon: Icons.control_point,
            content: const Center(child: Text('Tasbih Counter Content')),
          ),
          TabItem(
            title: 'Settings',
            icon: Icons.settings,
            content: const Center(child: Text('Settings Content')),
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Islamic App'),
        backgroundColor: Colors.deepPurple,
      ),
      body: OrganizedTabView(
        tabGroups: tabGroups,
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}
