import 'package:elements/screens/home/widgets/habit_option.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Half-circle icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple, // The primary color of the circle
            ),
          ),
          // + Habits button
          ElevatedButton.icon(
            onPressed: () {
              showHabitOptions(context);
              // Define what happens when button is pressed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            icon: Icon(Icons.add, color: Colors.white, size: 20),
            label: Text(
              "Habits",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void showHabitOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.6,
          minChildSize: 0.4,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: Colors.black),
                        label: Text("Close",
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Habit options
                  HabitOption(
                    icon: Icons.add,
                    color: Colors.orange,
                    title: "Create a habit",
                    description:
                        "Start a new habit that will have remarkable results.",
                    onTap: () {
                      // Navigate to create habit screen
                    },
                  ),
                  SizedBox(height: 10),
                  HabitOption(
                    icon: Icons.change_circle,
                    color: Colors.black,
                    title: "Replace a bad habit",
                    description:
                        "Redirect the time and energy towards a good habit instead.",
                    onTap: () {
                      // Navigate to replace habit screen
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
