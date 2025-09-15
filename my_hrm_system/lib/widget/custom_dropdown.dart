import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? title;
  final String selectedValue;
  final List<String> items;
  final double borderRadius;
  final ValueChanged<String> onChanged;
   final String labelText;

  const CustomDropdown({
    super.key,
     this.title,
    required this.selectedValue,
    required this.items,
    this.borderRadius = 8.0,
    required this.onChanged,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Responsive spacing & font size
    final double contentHorizontal = size.width * 0.03; // 3% of width
    final double contentVertical = size.height * 0.015; // 1.5% of height
    final double fontSize = size.width * 0.03; // 4% of width

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   title,
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyMedium
        //       ?.copyWith(fontSize: fontSize, fontWeight: FontWeight.w500),
        // ),
       // SizedBox(height: size.height * 0.01), // 1% of height
        DropdownButtonFormField<String>(
          value: selectedValue.isNotEmpty && items.contains(selectedValue)
              ? selectedValue
              : null,
          decoration: InputDecoration(
            labelText: labelText,
            
          
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: contentHorizontal,
              vertical: contentVertical,
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: fontSize * 1.5,
          style: TextStyle(fontSize: fontSize),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: TextStyle(fontSize: fontSize)),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ],
    );
  }
}
