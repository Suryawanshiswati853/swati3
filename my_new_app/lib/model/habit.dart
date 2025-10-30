class Habit {
  String name;
  int streak;
  int bestStreak;
  Map<String, bool> completion;

  Habit({
    required this.name,
    this.streak = 0,
    this.bestStreak = 0,
    Map<String, bool>? completion,
  }) : completion = completion ?? {};

  bool isDoneToday() {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    return completion[today] ?? false;
  }

  void toggleDone() {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (isDoneToday()) {
      completion[today] = false;
      streak = 0;
    } else {
      completion[today] = true;
      _updateStreak();
    }
  }

  void _updateStreak() {
    final today = DateTime.now();
    int count = 0;
    for (int i = 0; i < 1000; i++) {
      final date = today.subtract(Duration(days: i));
      final key = date.toIso8601String().substring(0, 10);
      if (completion[key] == true) {
        count++;
      } else {
        break;
      }
    }
    streak = count;
    if (streak > bestStreak) bestStreak = streak;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'streak': streak,
        'bestStreak': bestStreak,
        'completion': completion,
      };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        name: json['name'],
        streak: json['streak'],
        bestStreak: json['bestStreak'],
        completion: Map<String, bool>.from(json['completion']),
      );
}
