import 'package:http/http.dart' as http;
import 'package:my_hrm_system/res/imports.dart';

class HolidayController extends GetxController {
  List<Map<String, dynamic>> allHolidays = [];
  List<Map<String, dynamic>> filteredHolidays = [];
  bool isCalendarVisible = true;

void toggleCalendarVisibility() {
  isCalendarVisible = !isCalendarVisible;
  update();
}


  String searchQuery = '';
  bool showUpcomingOnly = false;
  DateTime? selectedDate;

  @override
  void onInit() {
    super.onInit();
    fetchHolidays();
  }

  Future<void> fetchHolidays() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.67.74:3000/api/holidays'),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        allHolidays = List<Map<String, dynamic>>.from(data);
        applyFilters();
      } else {
        print("Failed to fetch holidays");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void applyFilters() {
    final now = DateTime.now();

    filteredHolidays = allHolidays.where((holiday) {
      final holidayDate = DateTime.parse(holiday['date']);

      final matchesSearch = searchQuery.isEmpty ||
          holiday['name'].toLowerCase().contains(searchQuery.toLowerCase());

      final matchesUpcoming =
          !showUpcomingOnly || holidayDate.isAfter(now.subtract(const Duration(days: 1)));

      final matchesSelectedDate = selectedDate == null ||
          (holidayDate.year == selectedDate!.year &&
           holidayDate.month == selectedDate!.month &&
           holidayDate.day == selectedDate!.day);

      return matchesSearch && matchesUpcoming && matchesSelectedDate;
    }).toList();

    update(); // important for GetBuilder
  }

  void toggleUpcomingFilter(bool? value) {
  showUpcomingOnly = value ?? false;
  applyFilters();
  update();
}


  void updateSearchQuery(String query) {
    searchQuery = query;
    applyFilters();
  }

  void filterBySelectedDate(DateTime date) {
    selectedDate = date;
    applyFilters();
  }

  void clearDateFilter() {
    selectedDate = null;
    applyFilters();
  }
}


// class HolidayController extends GetxController {
//   List<Map<String, dynamic>> upcomingHolidays = [];

//   @override
//   void onInit() {
//     fetchUpcomingHolidays();
//     super.onInit();
//   }

//   Future<void> fetchUpcomingHolidays() async {
//     try {
//       final response = await http.get(
//         Uri.parse('http://192.168.67.74:3000/api/holidays/upcoming'),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         upcomingHolidays = List<Map<String, dynamic>>.from(data['upcomingHolidays']);
//         update();
//       }
//     } catch (e) {
//       print("Failed to fetch holidays: $e");
//     }
//   }
//   DateTime? selectedDate;

// void filterBySelectedDate(DateTime date) {
//   selectedDate = date;

//   filteredHolidays = allHolidays.where((holiday) {
//     final holidayDate = DateTime.parse(holiday['date']);
//     return holidayDate.year == date.year &&
//            holidayDate.month == date.month &&
//            holidayDate.day == date.day;
//   }).toList();

//   update();
// }

// }
