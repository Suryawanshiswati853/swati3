import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:my_new_app/model/habit.dart';
import 'package:my_new_app/utils/apptextStyle.dart';

/// A widget that displays a habit tile with its name, streak, and best streak.
class HabitTile extends StatefulWidget {
  final Habit habit;
  final VoidCallback onToggle;

  const HabitTile({
    super.key,
    required this.habit,
    required this.onToggle,
  });

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  late ConfettiController _confetti;

  @override
  void initState() {
    super.initState();
    _confetti = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final done = widget.habit.isDoneToday();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          shadowColor: isDark ? Colors.black54 : Colors.grey.shade300,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            onTap: () {
              widget.onToggle();
              if (!done) _confetti.play();
            },
            leading: AnimatedScale(
              scale: done ? 1.3 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                done ? Icons.check_circle : Icons.circle_outlined,
                color: done
                    ? Colors.greenAccent.shade400
                    : isDark
                        ? Colors.grey.shade500
                        : Colors.grey.shade600,
                size: 28,
              ),
            ),
            title: Text(
              widget.habit.name,
              style: AppTextStyles.bodyStyle.copyWith(
                color: isDark ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "${widget.habit.streak}-day streak",
              style: AppTextStyles.bodyStyle.copyWith(
                color: isDark ? Colors.grey[400] : Colors.grey[700],
                fontSize: 14,
              ),
            ),
            trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    AnimatedScale(
  scale: widget.habit.streak == widget.habit.bestStreak ? 1.3 : 1.0,
  duration: const Duration(milliseconds: 300),

  child:   Icon(
      Icons.emoji_events_rounded, 
      color: done
          ? Colors.amber.shade600
          : (isDark ? Colors.grey.shade500 : Colors.grey.shade400),
      size: 22,
    ),
    ),
    const SizedBox(width: 4),
    Text(
      "${widget.habit.bestStreak}",
      style: AppTextStyles.bodyStyle.copyWith(
        color: done
            ? Colors.amber.shade700
            : (isDark ? Colors.grey.shade300 : Colors.grey.shade700),
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

            
          ),
        ),

        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confetti,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 15,
              maxBlastForce: 12,
              minBlastForce: 4,
              emissionFrequency: 0.05,
              gravity: 0.3,
              colors: const [
                Colors.green,
                Colors.orange,
                Colors.blue,
                Colors.purple,
                Colors.yellow,
              ],
            ),
          ),
        ),
      ],
    );
  }
}


