import 'package:flutter/material.dart';
import '../tab_styles.dart';

class StyledMainTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  const StyledMainTabBar({
    Key? key,
    required this.controller,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: TabStyles.tabBarDecoration(),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: TabBar(
        controller: controller,
        tabs: tabs,
        labelColor: TabStyles.selectedColor,
        unselectedLabelColor: TabStyles.unselectedColor,
        labelStyle: TabStyles.selectedLabelStyle,
        unselectedLabelStyle: TabStyles.unselectedLabelStyle,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: TabStyles.tabIndicator(),
        splashBorderRadius: BorderRadius.circular(30),
        overlayColor: MaterialStateProperty.all(
          Colors.deepPurple.withOpacity(0.1),
        ),
        dividerColor: Colors.transparent,
        automaticIndicatorColorAdjustment: true,
      ),
    );
  }
}

class StyledSubTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final bool isScrollable;

  const StyledSubTabBar({
    Key? key,
    required this.tabs,
    this.isScrollable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TabBar(
        isScrollable: isScrollable,
        tabs: tabs,
        labelColor: TabStyles.selectedColor,
        unselectedLabelColor: TabStyles.unselectedColor,
        labelStyle: TabStyles.selectedLabelStyle,
        unselectedLabelStyle: TabStyles.unselectedLabelStyle,
        indicator: TabStyles.tabIndicator(),
        indicatorSize: TabBarIndicatorSize.label,
        splashBorderRadius: BorderRadius.circular(30),
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      ),
    );
  }
}

class StyledTabView extends StatelessWidget {
  final TabController? controller;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  const StyledTabView({
    Key? key,
    this.controller,
    required this.children,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: TabStyles.contentContainerDecoration(),
        clipBehavior: Clip.antiAlias,
        child:
            controller == null
                ? TabBarView(children: children)
                : TabBarView(
                  controller: controller,
                  children: children,
                  physics: const BouncingScrollPhysics(),
                ),
      ),
    );
  }
}
