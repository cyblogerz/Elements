import 'package:elements/models/database_model.dart';
import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final VoidCallback onIncrement;

  HabitTile({
    required this.habit,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: habit.isCompleted ? Colors.orange.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon and completion count
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color:
                  habit.isCompleted ? Colors.orange : Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(
                  20), // Higher radius for squircle effect
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bolt, color: Colors.white),
                Text(
                  habit.isCompleted ? '1' : '0',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          // Habit name
          Expanded(
            child: Text(
              habit.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                decoration:
                    habit.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          // Increment button
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: onIncrement,
          ),
          // Menu button
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Show options or a menu for additional actions
            },
          ),
        ],
      ),
    );
  }
}
