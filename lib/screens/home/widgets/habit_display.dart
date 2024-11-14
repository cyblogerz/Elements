import 'package:flutter/material.dart';

class HabitDisplay extends StatelessWidget {
  final bool hasHabitsToday = false; // Update this based on your habit data

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!hasHabitsToday) ...[
                Icon(Icons.bolt, color: Colors.orange, size: 40),
                SizedBox(height: 10),
                Text(
                  "You don’t have any scheduled habits today",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
              // Add habit items here if `hasHabitsToday` is true
            ],
          ),
        ),
      ),
    );
  }
}
