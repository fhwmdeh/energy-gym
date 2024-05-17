class Exercises {
  final String name;
  final String? weight;
  final String? reps;
  final String? sets;
  bool isCompleted;

  Exercises({
    required this.name,
    required this.weight,
    required this.reps,
    required this.sets,
    this.isCompleted = false,
  });
}
