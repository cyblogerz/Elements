import 'package:elements/screens/habit/widgets/editable_habit_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elements/models/database_model.dart';
import 'package:elements/providers/habit_provider.dart';

class HabitDefinitionScreen extends StatefulWidget {
  @override
  _HabitDefinitionScreenState createState() => _HabitDefinitionScreenState();
}

class _HabitDefinitionScreenState extends State<HabitDefinitionScreen> {
  final TextEditingController habitController = TextEditingController();
  final TextEditingController timeLocationController = TextEditingController();
  final TextEditingController identityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("New Habit", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sentence with editable fields
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "I will ",
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade700),
                ),
                EditableField(
                  controller: habitController,
                  hint: "habit",
                  textColor: Colors.orange,
                ),
                Text(
                  ", ",
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade700),
                ),
                EditableField(
                  controller: timeLocationController,
                  hint: "time/location",
                  textColor: Colors.blue,
                ),
                Text(
                  " so that I can become ",
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade700),
                ),
                EditableField(
                  controller: identityController,
                  hint: "type of person I want to be",
                  textColor: Colors.purple,
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "What's the two-minute version of what you want to do?",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(height: 12),
            // Suggestions for two-minute habits
            Wrap(
              spacing: 8.0,
              children: [
                ChoiceChip(
                  label: Text("put on my running shoes"),
                  onSelected: (_) {
                    habitController.text = "put on my running shoes";
                  },
                  selected: false,
                ),
                ChoiceChip(
                  label: Text("take a deep breath"),
                  onSelected: (_) {
                    habitController.text = "take a deep breath";
                  },
                  selected: false,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Consumer(
          builder: (context, ref, _) {
            return ElevatedButton(
              onPressed: () async {
                final habit = Habit(
                  name: habitController.text,
                  description:
                      '${timeLocationController.text}, ${identityController.text}',
                  isCompleted: false,
                );

                // Save the habit using the provider
                await ref.read(habitProvider.notifier).addHabit(habit);

                // Close the screen after saving
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Define your habit",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
