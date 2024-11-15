// elements/models/database_model.dart
class Habit {
  final int? id;
  final String name; // habit
  final String description; // time/location and identity
  bool isCompleted;

  Habit({
    this.id,
    required this.name,
    required this.description,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
