import 'package:elements/screens/home/widgets/bottom_navbar.dart';
import 'package:elements/screens/home/widgets/compact_view.dart';
import 'package:elements/screens/home/widgets/date_navigator.dart';
import 'package:elements/screens/home/widgets/habit_display.dart';
import 'package:elements/screens/home/widgets/progress_circle.dart';
import 'package:elements/screens/home/widgets/topbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            // ProgressCircle(),
            DateNavigator(),
            CompactViewToggle(),
            HabitDisplay(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
