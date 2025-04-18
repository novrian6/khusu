import 'package:flutter/material.dart';

class TabGroup {
  final String title;
  final IconData icon;
  final List<TabItem> tabs;

  TabGroup({required this.title, required this.icon, required this.tabs});
}

class TabItem {
  final String title;
  final IconData icon;
  final Widget content;

  TabItem({required this.title, required this.icon, required this.content});
}

class OrganizedTabView extends StatefulWidget {
  final List<TabGroup> tabGroups;
  final Color primaryColor;
  final Color backgroundColor;

  const OrganizedTabView({
    Key? key,
    required this.tabGroups,
    this.primaryColor = Colors.deepPurple,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  State<OrganizedTabView> createState() => _OrganizedTabViewState();
}

class _OrganizedTabViewState extends State<OrganizedTabView>
    with SingleTickerProviderStateMixin {
  late TabController _groupController;
  late List<TabController> _tabControllers;
  int _currentGroupIndex = 0;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _groupController = TabController(
      length: widget.tabGroups.length,
      vsync: this,
    );

    _tabControllers = List.generate(
      widget.tabGroups.length,
      (index) => TabController(
        length: widget.tabGroups[index].tabs.length,
        vsync: this,
      ),
    );

    _groupController.addListener(() {
      if (!_groupController.indexIsChanging) {
        setState(() {
          _currentGroupIndex = _groupController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _groupController.dispose();
    for (var controller in _tabControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Group tabs at top
        Container(
          color: widget.primaryColor,
          child: TabBar(
            controller: _groupController,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs:
                widget.tabGroups.map((group) {
                  return Tab(text: group.title, icon: Icon(group.icon));
                }).toList(),
          ),
        ),

        // Subtabs for the current group
        Container(
          color: widget.primaryColor.withOpacity(0.8),
          child: TabBar(
            controller: _tabControllers[_currentGroupIndex],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs:
                widget.tabGroups[_currentGroupIndex].tabs.map((tab) {
                  return Tab(text: tab.title, icon: Icon(tab.icon, size: 18));
                }).toList(),
          ),
        ),

        // Content area
        Expanded(
          child: TabBarView(
            controller: _tabControllers[_currentGroupIndex],
            children:
                widget.tabGroups[_currentGroupIndex].tabs.map((tab) {
                  return tab.content;
                }).toList(),
          ),
        ),
      ],
    );
  }
}
