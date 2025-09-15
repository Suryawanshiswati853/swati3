import 'package:my_hrm_system/res/imports.dart';


class HolidayListScreen extends StatelessWidget {
  const HolidayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HolidayController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Holiday List'),
      
        backgroundColor: AppColours.primary,
        foregroundColor: AppColours.onPrimary,
        actions: [
           GetBuilder<HolidayController>(
            builder: (controller) {
              return 
    IconButton(
      icon: Icon(
        controller.isCalendarVisible
            ? Icons.calendar_today
            : Icons.calendar_today_outlined,
      ),
      onPressed: controller.toggleCalendarVisibility,
    );
  })],
      ),
      body: GetBuilder<HolidayController>(
        builder: (controller) {
          return  Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.wp(context, 4),
                  vertical: ResponsiveHelper.hp(context, 2),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Search Holidays",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: controller.updateSearchQuery,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: controller.showUpcomingOnly,
                        onChanged: controller.toggleUpcomingFilter,
                      ),
                      const Text("Upcoming Holidays "),
                    ],
                  ),
                  // TextButton(
                  //   onPressed: controller.clearDateFilter,
                  //   child: const Text("Clear Date Filter"),
                  // ),
                ],
              ),
    
if (controller.isCalendarVisible)

  Padding(
    padding: const EdgeInsets.all(8.0),
    child:    SizedBox(
                    height: 245, 
   child:   TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: controller.selectedDate ?? DateTime.now(),
      calendarFormat: CalendarFormat.month,
      daysOfWeekHeight: 18,
      rowHeight: 28,
      availableGestures: AvailableGestures.horizontalSwipe,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColours.primary,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: AppColours.secondary,
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
        cellMargin: EdgeInsets.zero,
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontSize: 14),
        headerPadding: EdgeInsets.symmetric(vertical: 4),
      ),
      selectedDayPredicate: (day) =>
          controller.selectedDate != null &&
          isSameDay(controller.selectedDate, day),
      onDaySelected: (selectedDay, focusedDay) {
        controller.filterBySelectedDate(selectedDay);
      },
    ),
  ),
),


    
              const SizedBox(height: 5),
              Expanded(
                child: controller.filteredHolidays.isEmpty
                    ? const Center(child: Text("No holidays found."))
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveHelper.wp(context, 4),
                        ),
                        itemCount: controller.filteredHolidays.length,
                        itemBuilder: (context, index) {
                          final holiday = controller.filteredHolidays[index];
                          final date = DateFormat('yyyy-MM-dd')
                              .parse(holiday['date']);
                          final formattedDate =
                              DateFormat('MMMM dd, yyyy').format(date);

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                holiday['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 4),
                                  Text("Date: $formattedDate"),
                                  if (holiday['description'] != null)
                                    Text("Description: ${holiday['description']}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}


// class HolidayListScreen extends StatelessWidget {
//   const HolidayListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final HolidayController controller = Get.put(HolidayController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Holiday List"),
//       ),
//       body: GetBuilder<HolidayController>(
//         builder: (_) => Column(
//           children: [
//             // Calendar (Optional, just for reference)
//             TableCalendar(
//               focusedDay: DateTime.now(),
//               firstDay: DateTime.utc(2020),
//               lastDay: DateTime.utc(2030),
//               calendarFormat: CalendarFormat.month,
//               calendarStyle: const CalendarStyle(
//                 todayDecoration: BoxDecoration(
//                   color: Colors.blue,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               headerStyle: const HeaderStyle(
//                 formatButtonVisible: false,
//                 titleCentered: true,
//               ),
//               onDaySelected: (selectedDay, focusedDay) {
//                 // Optional: could be used to filter by selected date
//               },
//             ),

//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         hintText: "Search holiday name",
//                         prefixIcon: Icon(Icons.search),
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (val) => controller.updateSearchQuery(val),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: controller.showUpcomingOnly,
//                         onChanged: (val) => controller.toggleUpcomingFilter(val!),
//                       ),
//                       const Text("Upcoming Only"),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             Expanded(
//               child: controller.filteredHolidays.isEmpty
//                   ? const Center(child: Text("No holidays found."))
//                   : ListView.builder(
//                       itemCount: controller.filteredHolidays.length,
//                       itemBuilder: (context, index) {
//                         final holiday = controller.filteredHolidays[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                           child: ListTile(
//                             leading: const Icon(Icons.event_note, color: Colors.green),
//                             title: Text(holiday['name']),
//                             subtitle: Text(holiday['description']),
//                             trailing: Text(holiday['date']),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
