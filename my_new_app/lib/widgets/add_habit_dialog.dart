import 'package:flutter/material.dart';
import 'package:my_new_app/utils/apptextStyle.dart';


/// Displays a dialog to add a new habit and returns the entered habit name.
Future<String?> showAddHabitDialog(BuildContext context) async {
  final controller = TextEditingController();
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  return showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        'Add New Habit',
        style: AppTextStyles.headingStyle.copyWith(
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      content: TextField(
        controller: controller,
        autofocus: true,
        cursorColor: theme.colorScheme.primary,
        style: AppTextStyles.bodyStyle.copyWith(
          color: isDark ? Colors.white : Colors.black87,
        ),
        decoration: InputDecoration(
          hintText: 'Enter habit name',
          hintStyle: AppTextStyles.bodyStyle.copyWith(
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
          filled: true,
          fillColor: isDark ? Colors.grey[850] : Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.secondary,
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: AppTextStyles.buttonStyle.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        /// add button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            final name = controller.text.trim();
            if (name.isNotEmpty) Navigator.pop(context, name);
          },
          child: Text(
            'Add',
            style: AppTextStyles.buttonStyle.copyWith(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

