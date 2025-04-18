import 'package:flutter/material.dart';

class TabStyles {
  // Tab styling
  static const TextStyle selectedLabelStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
    letterSpacing: 0.5,
  );

  static const TextStyle unselectedLabelStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );

  static const double iconSize = 24.0;

  // Colors for tabs
  static const Color selectedColor = Colors.deepPurple;
  static const Color unselectedColor = Colors.grey;
  static const Color backgroundColor = Colors.white;

  // Animation durations
  static const Duration tabAnimationDuration = Duration(milliseconds: 300);
  static const Curve tabAnimationCurve = Curves.easeInOut;

  // Tab indicator decoration
  static BoxDecoration tabIndicator() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.deepPurple.withOpacity(0.2),
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurple.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // Main category tabs decoration
  static BoxDecoration mainCategoryTabDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? selectedColor.withOpacity(0.1) : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: isSelected ? selectedColor : Colors.transparent,
        width: 1.5,
      ),
    );
  }

  // Sub tabs decoration
  static BoxDecoration subTabDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? selectedColor.withOpacity(0.1) : Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: isSelected ? selectedColor : Colors.transparent,
        width: 1,
      ),
    );
  }

  // Tab content container decoration
  static BoxDecoration contentContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  // Tab bar decoration
  static BoxDecoration tabBarDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // Tab layout padding
  static const EdgeInsets tabPadding = EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 16.0,
  );

  static const EdgeInsets contentPadding = EdgeInsets.all(16.0);

  // Material states for interactive elements
  static MaterialStateProperty<Color?> tabBackgroundColor() {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return selectedColor.withOpacity(0.12);
      }
      return Colors.transparent;
    });
  }

  // Tab transition builder
  static Widget tabTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.02, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
