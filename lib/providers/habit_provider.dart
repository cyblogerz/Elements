import 'package:elements/database_helper.dart';
import 'package:elements/models/database_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]) {
    loadHabits();
  }

  Future<void> loadHabits() async {
    final habits = await DatabaseHelper().getHabits();
    state = habits;
  }

  Future<void> addHabit(Habit habit) async {
    await DatabaseHelper().insertHabit(habit);
    state = [...state, habit];
  }

  Future<void> toggleHabitCompletion(int index) async {
    final habit = state[index];
    habit.isCompleted = !habit.isCompleted;
    await DatabaseHelper().updateHabit(habit);
    state = List.from(state)..[index] = habit;
  }

  Future<void> deleteHabit(int id) async {
    await DatabaseHelper().deleteHabit(id);
    state = state.where((habit) => habit.id != id).toList();
  }
}
