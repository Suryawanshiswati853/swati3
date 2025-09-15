import 'package:my_hrm_system/res/imports.dart';


class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<EmployeeController>(
      init: EmployeeController(),
      builder: (controller) {
        return Scaffold(
          appBar:CustomAppBar(
      
            showAddIcon: true,
            onAddPressed: () {
              Get.off(AddEmployeePage());
            },
            onBackPressed: () {
            Get.to(AdminDashboardScreen())  ;          
            },
            title: 'Employee List',
            ),
            body: controller.isLoading
    ? const Center(child: CircularProgressIndicator())
    : LayoutBuilder(
        builder: (context, constraints) {
          double cardMaxWidth = constraints.maxWidth;

          if (ResponsiveHelper.isDesktop(context)) {
            cardMaxWidth = cardMaxWidth / 2.5;
          } else if (ResponsiveHelper.isTablet(context)) {
            cardMaxWidth = cardMaxWidth / 1.5;
          }

          return Center(
            child: SizedBox(
              width: cardMaxWidth,
              child: ListView.builder(
                padding: EdgeInsets.all(ResponsiveHelper.wp(context, 3)),
                itemCount: controller.employeeList.length,
                itemBuilder: (context, index) {
                  final employee = controller.employeeList[index];

                  return
                    InkWell(
  onTap: () {
    Get.to(() => EmployeeDetailsScreen(employeeId: employee['id']));
  },
               child:     Card(
                    color: AppColours.onPrimary,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(
                      vertical: ResponsiveHelper.hp(context, 1),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ResponsiveHelper.wp(context, 4)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(ResponsiveHelper.wp(context, 4)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Avatar
                          CircleAvatar(
                            radius: ResponsiveHelper.wp(context, 9),
                            backgroundImage: NetworkImage(
                              'http://192.168.67.74:3000/uploads/${employee['employee_image']}',
                            ),
                            backgroundColor: AppColours.gray,
                          ),
                          SizedBox(width: ResponsiveHelper.wp(context, 4)),

                          // Info Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Name and Status
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Employee Name
                                    Expanded(
                                      child: Text(
                                        employee['employee_name'] ?? 'No Name',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.sp(context, 3.5),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Status
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ResponsiveHelper.wp(context, 3),
                                        vertical: ResponsiveHelper.hp(context, 0.5),
                                      ),
                                      decoration: BoxDecoration(
                                        color: (employee['status'] == 'active') ? AppColours.green : AppColours.red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: AppColours.background,
                                            size: ResponsiveHelper.sp(context, 2.8),
                                          ),
                                          SizedBox(width: ResponsiveHelper.wp(context, 1)),
                                          Text(
                                            employee['status'] ?? 'Unknown',
                                            style: TextStyle(
                                              color: AppColours.background,
                                              fontSize: ResponsiveHelper.sp(context, 2.8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: ResponsiveHelper.hp(context, 0.5)),

                                // Designation
                                Text(
                                  employee['designation'] ?? 'No Designation',
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.sp(context, 2.8),
                                    color: AppColours.black87,
                                  ),
                                ),

                                SizedBox(height: ResponsiveHelper.hp(context, 0.6)),

                                // Email and Action Buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        employee['email'] ?? '',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.sp(context, 3.0),
                                          color: AppColours.black54,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              Get.off(() => EditEmployeeDeatils(employeeId: employee['id'],));
                                            });
                                          },
                                          icon: Icon(
                                            Icons.edit_outlined,
                                            color: AppColours.blue,
                                            size: ResponsiveHelper.sp(context, 5.0),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        IconButton(
                                          onPressed: () {
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              Get.off(() => LeaveSummaryScreen(employeeId: employee['id']));
                                            });
                                          },
                                          icon: Icon(
                                            Icons.event_busy_outlined,
                                            color: AppColours.blue,
                                            size: ResponsiveHelper.sp(context, 5.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ),
          );
        },
      ));
      }
  );}
}

//           body: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : LayoutBuilder(
//                   builder: (context, constraints) {
//                     double cardMaxWidth = constraints.maxWidth;

//                     if (cardMaxWidth >= 1024) {
//                       cardMaxWidth = cardMaxWidth / 2.5; 
//                     } else if (cardMaxWidth >= 600) {
//                       cardMaxWidth = cardMaxWidth / 1.5; 
//                     }

//                     return Center(
//                       child: SizedBox(
//                         width: cardMaxWidth,
//                         child: ListView.builder(
//                           padding: EdgeInsets.all(screenWidth * 0.03),
//                           itemCount: controller.employeeList.length,
//                           itemBuilder: (context, index) {
//                             final employee = controller.employeeList[index];

//                             return Card(
//                               color:  AppColours.onPrimary,
//                               elevation: 4,
//                               margin: EdgeInsets.symmetric(
//                                 vertical: screenHeight * 0.01,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(screenWidth * 0.04),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(screenWidth * 0.04),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CircleAvatar(
//                                       radius: screenWidth * 0.09,
//                                       backgroundImage: NetworkImage(
//                                         'http://192.168.67.74:3000/uploads/${employee['employee_image'] ??Icon(Icons.person_outline,size: AppConstants.appIconsize,color: AppColours.blue,)}',
//                                       ),
//                                       backgroundColor: AppColours.gray,
//                                     ),
//                                     SizedBox(width: screenWidth * 0.04),

//                                     // Employee Info
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: Text(
//                                                   employee['employee_name'] ?? 'No Name',
//                                                   style: TextStyle(
//                                                     fontSize: screenWidth * 0.040,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Container(
//                                                 padding: EdgeInsets.symmetric(
//                                                   horizontal: screenWidth * 0.03,
//                                                   vertical: screenHeight * 0.005,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   color: (employee['status'] == 'active') ? AppColours.green : AppColours.red,
//                                                   borderRadius: BorderRadius.circular(20),
//                                                 ),
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(
//                                                       Icons.check_circle_outline,
//                                                       color: AppColours.background,
//                                                       size: screenWidth * 0.035,
//                                                     ),
//                                                     SizedBox(width: screenWidth * 0.01),
//                                                     Text(
//                                                       employee['status'] ?? 'Unknown',
//                                                       style: TextStyle(
//                                                         color: AppColours.background,
//                                                         fontSize: screenWidth * 0.035,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),

//                                           SizedBox(height: screenHeight * 0.005),

//                                           Text(
//                                             employee['designation'] ?? 'No Designation',
//                                             style: TextStyle(
//                                               fontSize: screenWidth * 0.03,
//                                               color: AppColours.black87,
//                                             ),
//                                           ),

//                                           SizedBox(height: screenHeight * 0.006),
//                                           Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     // Email text
//     Flexible(
//       child: Text(
//         employee['email'] ?? '',
//         style: TextStyle(
//           fontSize: screenWidth * 0.035,
//           color: AppColours.black54,
//         ),
//       ),
//     ),
//     Row(
//       children: [
//         IconButton(
//           onPressed: () {
          
//           },
//           icon: Icon(Icons.edit_outlined, color: AppColours.blue, size: AppConstants.appIconsize),
//         ),
//         const SizedBox(width: 4), 
//         IconButton(
//           onPressed: () {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               Get.off(() => LeaveSummaryScreen(employeeId: employee['id']));
//             });
//           },
//           icon: Icon(Icons.event_busy_outlined, color: AppColours.blue, size: AppConstants.appIconsize),
//         ),
//       ],
//     ),
//   ],
// )


//                                           // Row(
//                                           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           //   children: [
                                            
//                                           //     Flexible(
//                                           //       child: Text(
//                                           //         employee['email'] ?? '',
//                                           //         style: TextStyle(
//                                           //           fontSize: screenWidth * 0.035,
//                                           //           color: AppColours.black54,
//                                           //         ),
//                                           //       ),
//                                           //     ),
//                                           //  //  SizedBox(height: screenHeight * 0.006),
//                                           //     Flexible(
//                                           //       child: IconButton(onPressed: (){
                                               

//                                           //       }, icon: Icon(Icons.edit_outlined,color: AppColours.blue,size: 25,)),
                                               
//                                           //     ),
//                                           //      // SizedBox(height: screenHeight * 0.001),
                                              
//                                           //     Flexible(
//                                           //       child: IconButton(onPressed: (){
//                                           //       WidgetsBinding.instance.addPostFrameCallback((_) {
//                                           // Get.off(() => LeaveSummaryScreen(employeeId: employee['id']),
//                                           //            );
//                                           //             });

//                                           //       }, icon: Icon(Icons.event_busy_outlined,color: AppColours.blue,size: 25,)),
                                               
//                                           //     ),
                                              

                                              
//                                           //   ],
//                                           // ),

//                                          // SizedBox(height: screenHeight * 0.005),

//                                           // Row(
//                                           //   children: [
//                                           //     Icon(Icons.phone, size: screenWidth * 0.04, color: AppColours.grey[600]),
//                                           //     SizedBox(width: screenWidth * 0.015),
//                                           //     Text(
//                                           //       employee['mobile_no'] ?? '',
//                                           //       style: TextStyle(
//                                           //         fontSize: screenWidth * 0.035,
//                                           //         color: AppColours.black54,
//                                           //       ),
//                                           //     ),
//                                           //   ],
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//         );
//       },
//     );
//   }
// }

