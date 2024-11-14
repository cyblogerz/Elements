import 'package:elements/screens/home/widgets/habit_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elements/models/database_model.dart';
import 'package:elements/providers/habit_provider.dart';

class HabitDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitProvider);

    return Expanded(
      child: Center(
        child: habits.isEmpty
            ? NoHabitsMessage() // Show message if no habits
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return HabitTile(
                    habit: habit,
                    onIncrement: () async {
                      habit.isCompleted = !habit.isCompleted;
                      await ref
                          .read(habitProvider.notifier)
                          .toggleHabitCompletion(index);
                    },
                  );
                },
              ),
      ),
    );
  }
}

// Widget to show if there are no habits scheduled for today
class NoHabitsMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(Icons.bolt, color: Colors.orange, size: 40),
          SizedBox(height: 10),
          Text(
            "You don’t have any scheduled habits today",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
