import 'package:my_hrm_system/res/imports.dart';


class LeaveListScreen extends StatefulWidget {
  const LeaveListScreen({super.key});

  @override
  State<LeaveListScreen> createState() => _LeaveListScreenState();
}

class _LeaveListScreenState extends State<LeaveListScreen> {
  final LeaveController leaveController = Get.put(LeaveController());

  @override
  void initState() {
    super.initState();
    leaveController.fetchLeaves();
  }


  @override
  Widget build(BuildContext context) {


        return Scaffold(
            appBar:CustomAppBar(
      
            showAddIcon: false,
            showMenuButton: false,
            showBackButton: true,
            onBackPressed: () {
            Get.to(AdminDashboardScreen())  ;          
            },
            title: 'Leaves List',
            ),
             body: GetBuilder<LeaveController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.leaveList.isEmpty) {
            return const Center(child: Text("No leave records found."));
          }

          return Padding(
            padding: EdgeInsets.all(ResponsiveHelper.wp(context, 4)),
            child: ListView.builder(
              itemCount: controller.leaveList.length,
              itemBuilder: (context, index) {
                final leave = controller.leaveList[index];
                return buildLeaveRequestCard(context,leave);
              },
            ),
          );
        },
      ),
    );
  }
}
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
      color: AppColours.onPrimary,
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
            IconButton(
              onPressed: () {
                if (leave['id'] != null) {
                  Get.off(() => EditLeavesScreen(leaveId: leave['id']));
                }
              },
              icon: Icon(
                Icons.edit_outlined,
                color: AppColours.blue,
                size: ResponsiveHelper.wp(context, 5.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Widget buildLeaveRequestCard(Map<String, dynamic> leave, BuildContext context) {
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
//         Get.off(() => NewLeaveDetails(leaveId: leave['id']));
//       }
//     },
//     child: Card(
//       color: AppColours.onPrimary,
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




    //     appBar:    AppBar(
    //     centerTitle: true,
   
    //     backgroundColor: AppColours.blue2,
    //      leading: IconButton(
    //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white), // ← White back icon
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    // ),
    //   ),
          
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 headingRowColor:
//                     MaterialStateProperty.all(AppColours.gray),
//                 columns: const [
//                   DataColumn(label: Text('From Date', style: AppTextStyles.tableRows)),
//                   DataColumn(label: Text('To Date', style: AppTextStyles.tableRows)),
//                   DataColumn(label: Text('Reason', style: AppTextStyles.tableRows)),
//                   DataColumn(label: Text('Status', style: AppTextStyles.tableRows)),
//                 ],
//                 rows: controller.leaveList.map<DataRow>((leave) {
//                   final fromDate = DateTime.parse(leave['from_date']).toLocal().toString().split(' ')[0];
//                   final toDate = DateTime.parse(leave['to_date']).toLocal().toString().split(' ')[0];
//                   final reason = leave['reason'] ?? '-';
//                   final status = leave['status'] ?? '-';

//                   final isApproved = status == 'Approved';

//                   return DataRow(
//                     cells: [
//                       DataCell(Text(fromDate)),
//                       DataCell(Text(toDate)),
//                       DataCell(Text(reason)),
//                       DataCell(
//                         Text(
//                           status,
//                           style: TextStyle(
//                             color: isApproved ? Colors.green[800] : Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
