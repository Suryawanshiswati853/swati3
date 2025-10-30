import 'dart:convert';
import '../widgets/habit_tile.dart';
import 'package:flutter/material.dart';
import '../widgets/add_habit_dialog.dart';
import 'package:my_new_app/model/habit.dart';
import 'package:my_new_app/utils/Colors.dart';
import 'package:my_new_app/utils/apptextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';





class HabitTrackerHome extends StatefulWidget {
  const HabitTrackerHome({super.key});

  @override
  State<HabitTrackerHome> createState() => _HabitTrackerHomeState();
}

class _HabitTrackerHomeState extends State<HabitTrackerHome> {
 /// List of habits
  List<Habit> habits = [];
/// Initialize state and load habits
  @override
  void initState() {
    super.initState();
    loadHabits();
  }
/// Load habits from SharedPreferences
  Future<void> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('habits') ?? [];
    setState(() {
      habits = data.map((e) => Habit.fromJson(jsonDecode(e))).toList();
    });
  }
/// Save habits to SharedPreferences
  Future<void> saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final data = habits.map((h) => jsonEncode(h.toJson())).toList();
    await prefs.setStringList('habits', data);
  }
/// Toggle habit done status
  void toggleHabit(int index) {
    setState(() {
      habits[index].toggleDone();
      if (habits[index].streak == 7 || habits[index].streak == 14 || habits[index].streak == 30) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Milestone Reached!'),
            content: Text('You achieved a ${habits[index].streak}-day streak on ${habits[index].name}!'),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Yay!'))],
          ),
        );
      }
    });
    saveHabits();
  }
/// Add new habit
  void addHabit(String name) {
    setState(() {
      habits.add(Habit(name: name));
    });
    saveHabits();
  }
  /// Leaderboard dialog
void showLeaderboard(BuildContext context, List<Habit> habits) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  final sorted = [...habits]..sort((a, b) => b.bestStreak.compareTo(a.bestStreak));

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Leaderboard',
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: AlertDialog(
              backgroundColor: isDark ? TColors.secondary : TColors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events_rounded, color: TColors.amber, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    'Leaderboard',
                    style: AppTextStyles.headingStyle.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
        
              content: SizedBox(
                height: 350,
                
                width: double.infinity,
                child: sorted.isEmpty
                    ? Center(
                        child: Text(
                          "No data yet",
                          style: AppTextStyles.bodyStyle.copyWith(
                            color: isDark ? TColors.white70 : TColors.black54,
                          ),
                        ),
                      )
                      /// Habit list
                    : Scrollbar(
                        thumbVisibility: true,
                        child: ListView.separated(
                          itemCount: sorted.length,
                          separatorBuilder: (_, __) => Divider(
                            color: isDark ? TColors.darkDivider : TColors.lightDivider,
                            thickness: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            final habit = sorted[index];
                            final rank = index + 1;

                            Color rankColor;
                            switch (rank) {
                              case 1:
                                rankColor = TColors.amber600;
                                break;
                              case 2:
                                rankColor = TColors.silver;
                                break;
                              case 3:
                                rankColor = TColors.bronze;
                                break;
                              default:
                                rankColor = theme.colorScheme.primary;
                            }

                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: rankColor.withOpacity(0.15),
                                child:
                                Icon(Icons.emoji_events_rounded, color: rankColor, size: 20),

                              ),
                              title: Text(
                                habit.name,
                                style: AppTextStyles.bodyStyle.copyWith(
                                  color: isDark ? TColors.white : TColors.black87,
                                ),
                                
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                
                                  Text(
                                    "${habit.bestStreak} days",
                                    style: AppTextStyles.bodyStyle.copyWith(
                                      color: isDark ? TColors.lightDivider : TColors.lightTextSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ),
      
              actions: [
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Close',
                      style: AppTextStyles.buttonStyle.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    /// Animated dialog transition
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar
     appBar: AppBar(
  centerTitle: true,
  backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // uses theme
  title: Text(
    'Habit Tracker',
    style: AppTextStyles.appbar.copyWith(
      color: Theme.of(context).appBarTheme.foregroundColor, // adaptive text color
    ),
  ),
  actions: [
    // Leaderboard button
    IconButton(
      icon: Icon(
        Icons.leaderboard,
        color: Theme.of(context).appBarTheme.foregroundColor, // adaptive icon color
      ),
      onPressed: () => showLeaderboard(context, habits),
    ),
  ],
),
/// body
      body: habits.isEmpty
    ? const Center(child: Text("No habits yet. Tap + to add one!"))
    : ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Dismissible(
            key: Key(habit.name + index.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (_) async {
              return await showDialog<bool>(  ///dialog to confirm deletion
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete Habit'),
                  content: Text('Are you sure you want to delete "${habit.name}"?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
                  ],
                ),
              );
            },
            onDismissed: (_) {
              setState(() {
                habits.removeAt(index);
              });
              saveHabits();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Deleted "${habit.name}"')),
              );
            },
            child: HabitTile(
              habit: habit,
              onToggle: () => toggleHabit(index),
            ),
          );
        },
      ),
/// floating action button
     floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final name = await showAddHabitDialog(context);
    if (name != null) addHabit(name);
  },
  backgroundColor: Theme.of(context).colorScheme.primary, 
  foregroundColor: Theme.of(context).colorScheme.onPrimary,
  child: const Icon(Icons.add),
),

      
    );
  }
}
