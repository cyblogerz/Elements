import 'package:elements/models/database_model.dart';
import 'package:elements/providers/habit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddHabitPage extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Habit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Habit Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final habit = Habit(
                  name: nameController.text,
                  description: descriptionController.text,
                );
                ref.read(habitProvider.notifier).addHabit(habit);
                Navigator.pop(context);
              },
              child: Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }
}
