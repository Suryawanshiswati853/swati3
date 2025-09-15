import 'package:my_hrm_system/res/imports.dart';

extension StringCasingExtension on String {
  String toCapitalized() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}



class LeaveSummaryScreen extends StatefulWidget {
  final int employeeId;

  LeaveSummaryScreen({required this.employeeId});

  @override
  _LeaveSummaryScreenState createState() => _LeaveSummaryScreenState();
}

class _LeaveSummaryScreenState extends State<LeaveSummaryScreen> {
  final LeaveController leaveController = Get.put(LeaveController());

  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
      leaveController.fetchLeaveSummary(widget.employeeId);
      leaveController.fetchLeaveRequestsForEmployee(widget.employeeId);
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Employee Leaves',
        showAddIcon: false,
        onBackPressed: () => Get.off(EmployeeListScreen()),
      ),
      body: GetBuilder<LeaveController>(
        builder: (controller) {
          final leaves = controller.leaveData;
          // if (controller.isLoadingLeaves) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          

          return SingleChildScrollView(
            padding: EdgeInsets.all(ResponsiveHelper.wp(context, 4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 if (controller.isLoadingLeaves)
            const Center(child: CircularProgressIndicator())
          else if (leaves != null && leaves.isNotEmpty)
                // LEAVE CARDS
              //  if (leaves != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                         buildLeaveCard(
              context: context,
              title: 'Earned Leave',
              used: parseToDouble(leaves['Earned Leave']?['used']),
              allowed: parseToInt(leaves['Earned Leave']?['allowed']),
              remaining: parseToDouble(leaves['Earned Leave']?['remaining']),
              color: const Color.fromARGB(255, 131, 243, 131),
            ),
            buildLeaveCard(
              context: context,
              title: 'Sick Leave',
              used: parseToDouble(leaves['Sick Leave']?['used']),
              allowed: parseToInt(leaves['Sick Leave']?['allowed']),
              remaining: parseToDouble(leaves['Sick Leave']?['remaining']),
              color: const Color.fromARGB(255, 239, 104, 73),
            ),
            buildLeaveCard(
              context: context,
              title: 'Casual Leave',
              used: parseToDouble(leaves['Casual Leave']?['used']),
              allowed: parseToInt(leaves['Casual Leave']?['allowed']),
              remaining: parseToDouble(leaves['Casual Leave']?['remaining']),
              color: const Color.fromARGB(255, 243, 159, 35),
            ),
                     
                      ],
                    ),
                  ),

                SizedBox(height: ResponsiveHelper.hp(context, 3)),

                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Leave Requests', style: TextStyle(fontSize: ResponsiveHelper.sp(context, 4), fontWeight: FontWeight.bold)),
                  ],
                ),

                // LEAVE REQUEST CARDS
                if (controller.isLoadingRequests)
                  const Center(child: CircularProgressIndicator())
                else if (controller.leaveRequests.isEmpty)
                  const Center(child: Text("No leave requests found."))
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.leaveRequests.length,
                    itemBuilder: (context, index) {
                      final leave = controller.leaveRequests[index];
                      return buildLeaveRequestCard(context,leave);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  // LEAVE CARD
  Widget buildLeaveCard({
  required String title,
  required double used,
  required int allowed,
  required double remaining,
  required Color color,
  required BuildContext context,
}) {
  final cardWidth = ResponsiveHelper.isMobile(context)
      ? MediaQuery.of(context).size.width * 0.4
      : MediaQuery.of(context).size.width * 0.18;

  return Container(
    width: cardWidth,
    height: ResponsiveHelper.hp(context, 16), // ~14% of screen height
    margin: EdgeInsets.only(right: ResponsiveHelper.wp(context, 3)),
    padding: EdgeInsets.all(ResponsiveHelper.wp(context, 4)),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(ResponsiveHelper.wp(context, 3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.containerHeading),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${formatSmartNumber(remaining)}",
              style: AppTextStyles.leavestitle.copyWith(
                fontSize: ResponsiveHelper.sp(context, 3.0),
              ),
            ),
            SizedBox(width: ResponsiveHelper.wp(context, 2)),
           
            Text(
              "${formatSmartNumber(used)} / $allowed",
              style: AppTextStyles.leavestitle.copyWith(
                fontSize: ResponsiveHelper.sp(context, 3.0),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//   Widget buildLeaveCard({
//   required String title,
//   required double used,
//   required int allowed,
//   required double remaining,
//   required Color color,
//   required BuildContext context,
// }) {
//   final screenWidth = MediaQuery.of(context).size.width;

//   return Container(
//     width: screenWidth * 0.5,
//     height: 100,
//     margin: const EdgeInsets.only(right: 12),
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: color,
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: AppTextStyles.containerHeading),
//         const Spacer(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
          
//             Text(
//               "${formatSmartNumber(remaining)}",
//               style:  AppTextStyles.leavestitle,
//             ),
//               Text(
//               "${formatSmartNumber(used)} / $allowed",
//               style:  AppTextStyles.leavestitle,
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

  

  // LEAVE REQUEST CARD
  Widget buildLeaveRequestCard(BuildContext context, Map<String, dynamic> leave) {
  final double padding = ResponsiveHelper.wp(context, 4);
  final double spacing = ResponsiveHelper.wp(context, 3);
  final double iconSize = ResponsiveHelper.wp(context, 8);
  final double fontSize = ResponsiveHelper.sp(context, 3.0);
  final double smallFontSize = ResponsiveHelper.sp(context, 3);

  DateTime fromDate = DateTime.parse(leave['from_date']).toLocal();
  DateTime toDate = DateTime.parse(leave['to_date']).toLocal();
  DateTime appliedDate = DateTime.parse(leave['applied_date']);
  final String status = leave['status'] ?? 'Pending';

  String formatDate(DateTime date) => DateFormat('dd-MM-yyyy').format(date);

  return GestureDetector(
    onTap: () {
      if (leave['id'] != null) {
        Get.off(() => NewLeaveDetails(leaveId: leave['id']));
      }
    },
    child: Card(
      color: AppColours.background,
      margin: EdgeInsets.symmetric(vertical: ResponsiveHelper.hp(context, 1)),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ResponsiveHelper.wp(context, 3)),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.calendar_month_outlined,
              size: iconSize,
              color: getStatusColor(status),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${formatDate(fromDate)} - ${formatDate(toDate)}",
                    style: AppTextStyles.caption2.copyWith(fontSize: fontSize),
                  ),
                  SizedBox(height: ResponsiveHelper.hp(context, 0.5)),
                  Text(
                    "Applied Date (${formatDate(appliedDate)})",
                    style: AppTextStyles.caption2.copyWith(fontSize: smallFontSize),
                  ),
                  SizedBox(height: ResponsiveHelper.hp(context, 0.5)),
                  Text(
                    "${(leave['from_day_type']?.toString().toCapitalized() ?? '')} Day - ${(leave['to_day_type']?.toString().toCapitalized() ?? '')} Day",
                    style: AppTextStyles.captiongrey.copyWith(fontSize: smallFontSize),
                  ),
                  SizedBox(height: ResponsiveHelper.hp(context, 0.5)),
                  Text(
                    "${leave['total_days']} Day(s) - ${leave['leave_type']}",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  SizedBox(height: ResponsiveHelper.hp(context, 0.8)),
                  Text(
                    "${leave['status']}",
                    style: TextStyle(
                      fontSize: fontSize,
                      color: getStatusColor(status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     if (leave['id'] != null) {
            //       Get.off(() => LeaveDetailScreen(leaveId: leave['id']));
            //     }
            //   },
            //   icon: Icon(
            //     Icons.edit_outlined,
            //     color: AppColours.blue,
            //     size: ResponsiveHelper.wp(context, 5.0),
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}
//   Widget buildLeaveRequestCard(Map<String, dynamic> leave, BuildContext context) {
//   final screenWidth = MediaQuery.of(context).size.width;
//   final screenHeight = MediaQuery.of(context).size.height;

//   final double padding = screenWidth * 0.04; // ~4% horizontal padding
//   final double spacing = screenWidth * 0.03; // space between icon and text
//   final double iconSize = screenWidth * 0.09; // responsive icon size
//   final double fontSize = screenWidth * 0.035; // base text size
//   final double smallFontSize = fontSize * 0.9;

//   DateTime fromDate = DateTime.parse(leave['from_date']).toLocal();
//   DateTime toDate = DateTime.parse(leave['to_date']).toLocal();
//   DateTime appliedDate = DateTime.parse(leave['applied_date']);

//   String formatDate(DateTime date) => DateFormat('dd-MM-yyyy').format(date);
//   final String status = leave['status'] ?? 'pending';

//   return GestureDetector(
//     onTap: () {
//       if (leave['id'] != null) {
//         Get.off(() => LeaveDetailScreen(leaveId: leave['id']));
//       }
//     },
//     child: Card(
//       color: AppColours.background,
//       margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(padding),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(
//               Icons.calendar_month_outlined,
//               size: iconSize,
//               color: getStatusColor(status),
//             ),
//             SizedBox(width: spacing),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${formatDate(fromDate)} - ${formatDate(toDate)}",
//                      style: AppTextStyles.caption2
//                   //  style: AppTextStyles.caption2.copyWith(fontSize: fontSize),
//                   ),
//                   SizedBox(height: screenHeight * 0.005),
//                   Text(
//                     "Applied Date (${formatDate(appliedDate)})",
//                      style: AppTextStyles.caption2
//                     // style: AppTextStyles.caption2.copyWith(fontSize: smallFontSize),
//                   ),
//                   SizedBox(height: screenHeight * 0.005),
//                   Text(
//                     "${(leave['from_day_type']?.toString().toCapitalized() ?? '')} Day - ${(leave['to_day_type']?.toString().toCapitalized() ?? '')} Day",
//                     style: AppTextStyles.captiongrey
//                    // style: AppTextStyles.captiongrey.copyWith(fontSize: smallFontSize),
//                   ),
//                   SizedBox(height: screenHeight * 0.005),
//                   Text(
//                     "${leave['total_days']} Day(s) - ${leave['leave_type']}",
//                   //  style: TextStyle(fontSize: fontSize),
//                   ),
//                   SizedBox(height: screenHeight * 0.008),
//                   Text(
//                     "${leave['status']}",
//                     style: TextStyle(color: getStatusColor(leave['status']), fontWeight: FontWeight.bold)
//                     // style: TextStyle(
//                     //   fontSize: fontSize,
//                     //   color: getStatusColor(status),
//                     //   fontWeight: FontWeight.bold,
//                     // ),
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 if (leave['id'] != null) {
//                   Get.off(() => EditLeavesScreen(leaveId: leave['id']));
//                 }
//               },
//               icon: Icon(
//                 Icons.edit_outlined,
//                 color: AppColours.blue,
//                 size:AppConstants.appIconsize ,
//                 //size: screenWidth * 0.07, // responsive icon size
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

  // Widget buildLeaveRequestCard(Map<String, dynamic> leave, BuildContext context) {
  //   DateTime fromDate = DateTime.parse(leave['from_date']).toLocal();
  //   DateTime toDate = DateTime.parse(leave['to_date']).toLocal();

  //   String formatDate(DateTime date) {
  //     return DateFormat('dd-MM-yyyy').format(date);
  //   }
  //   final String status = leave['status'] ?? 'pending';
  //   final DateTime appliedDate = DateTime.parse(leave['applied_date']);
  //    return GestureDetector(
  //     onTap: () async {
  //     if (leave['id'] != null) {
  //           Get.off(() => LeaveDetailScreen(leaveId: leave['id']),
  //                  );
  //                     }
  //     },
  //     child:

  //    Card(
  //       color:  AppColours.background,
      
  //     margin: const EdgeInsets.symmetric(vertical: 8),
  //     elevation: 3,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(20),
  //       child: Row(
  //         children: [
  //            Icon(Icons.calendar_month_outlined, size: 40, color:  getStatusColor(status)),
  //            const SizedBox(width: 12), 
           
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("${formatDate(fromDate)} - ${formatDate(toDate)}", style: AppTextStyles.caption2,),
  //                 const SizedBox(height: 4),
  //                  Text(
  //           "Applied Date (${formatDate(appliedDate)})",
  //           style:  AppTextStyles.caption2,
  //         ),
  //         const SizedBox(height: 4),
  //                 Text("${(leave['from_day_type']?.toString().toCapitalized() ?? '')} Day - ${(leave['to_day_type']?.toString().toCapitalized() ?? '')} Day",style: AppTextStyles.captiongrey,),
  //                 const SizedBox(height: 4),
  //                 Text("${leave['total_days']} Day(s) - ${leave['leave_type']}"),
  //                 const SizedBox(height: 6),
  //                 Text("${leave['status']}", style: TextStyle(color: getStatusColor(leave['status']), fontWeight: FontWeight.bold)),
  //               ],
  //             ),
  //           ),
  //           //  IconButton(
  //           //   onPressed: () {
  //           //     if (leave['id'] != null) {
  //           //       Get.off(() => EditLeavesScreen(leaveId: leave['id']));
  //           //     }
  //           //   },
  //           //   icon: Icon(
  //           //     Icons.edit_outlined,
  //           //     color: AppColours.blue,
  //           //     size:AppConstants.appIconsize ,
  //           //     //size: screenWidth * 0.07, // responsive icon size
  //           //   ),
  //          // ),
  //         ],
  //       ),
  //     ),
  //   ));
  // }
  int parseToInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  return int.tryParse(value.toString()) ?? 0;
}
double parseToDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

String formatSmartNumber(num value) {
  return value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(1);
}
  // int parseToInt(dynamic value) {
  //   if (value == null) return 0;
  //   if (value is int) return value;
  //   return int.tryParse(value.toString()) ?? 0;
  // }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return AppColours.green;
      case 'pending':
        return AppColours.orange;
      case 'rejected':
        return AppColours.red;
      default:
        return AppColours.gray;
    }
  }
}




Widget buildLeaveCard({
  required BuildContext context,
  required String title,
  required int used,
  required int allowed,
  required Color color,
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Container(
    width: screenWidth * 0.4, // 50% of screen width
    height: screenHeight * 0.20, // 15% of screen height
    margin: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.025, // 2.5% of width
      vertical: screenHeight * 0.02, // 2% of height
    ),
    padding: EdgeInsets.all(screenWidth * 0.03),
    decoration: BoxDecoration(
      color: color, // softer color
      borderRadius: BorderRadius.circular(screenWidth * 0.03), 
      border: Border.all(color: color, width: 1.5),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.containerHeading,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            '$used / $allowed',
            style: AppTextStyles.leavestitle,
          ),
        ),
      ],
    ),
  );
}



  int parseToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    return 0;
  }


