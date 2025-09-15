import 'package:my_hrm_system/res/imports.dart';


class CircularTimePicker extends StatefulWidget {
  final Function(String) onTimeSelected;

  const CircularTimePicker({Key? key, required this.onTimeSelected}) : super(key: key);

  @override
  _CircularTimePickerState createState() => _CircularTimePickerState();
}

class _CircularTimePickerState extends State<CircularTimePicker> {
  int selectedHour = 12;
  int selectedMinute = 0;
  int selectedSecond = 0;
  String selectedPeriod = 'AM';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanUpdate: (details) {
          // Handle gesture to change selected time
          // (For simplicity, we can just handle the hour change here)
          double angle = details.localPosition.direction;
          int newHour = ((angle / (pi / 6)) + 12).toInt() % 12;

          setState(() {
            selectedHour = newHour.toInt();
          });
        },
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[100],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '$selectedHour:$selectedMinute:$selectedSecond $selectedPeriod',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // Add hour, minute, and second picker here
              // You can use a circular rotation gesture to set values
            ],
          ),
        ),
      ),
    );
  }
}
