import 'package:flutter/material.dart';
import '../tab_styles.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final IconData? icon;
  final Color backgroundColor;
  final bool showDivider;
  final Widget? floatingActionButton;

  const ScreenWrapper({
    super.key,
    required this.child,
    this.title = '',
    this.icon,
    this.backgroundColor = Colors.white,
    this.showDivider = true,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  if (icon != null)
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: TabStyles.selectedColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        color: TabStyles.selectedColor,
                        size: 24,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (showDivider && title.isNotEmpty)
            Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
          Expanded(
            child: Container(padding: TabStyles.contentPadding, child: child),
          ),
        ],
      ),
    );
  }
}
