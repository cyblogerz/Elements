import 'package:flutter/material.dart';

class DateNavigator extends StatelessWidget {
  final days = ["Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Today"];
  final dates = ["08", "09", "10", "11", "12", "13", "14"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(days.length, (index) {
          return Column(
            children: [
              Text(days[index],
                  style: TextStyle(
                      color: index == 6 ? Colors.black : Colors.grey)),
              Text(dates[index],
                  style: TextStyle(
                      color: index == 6 ? Colors.black : Colors.grey)),
            ],
          );
        }),
      ),
    );
  }
}
