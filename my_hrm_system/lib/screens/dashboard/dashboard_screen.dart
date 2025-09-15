import 'package:my_hrm_system/res/imports.dart';


class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final AuthController controller = Get.put(AuthController());
  EmployeeController _employeeController=Get.put(EmployeeController());
  HolidayController holidayController=Get.put(HolidayController());
   @override
void initState() {
  super.initState();
  controller.loadUserFromPrefs();
  _employeeController.fetchEmployeeData();
  //_employeeController.fetchDepartmentData();
   //holidayController.fetchUpcomingHolidays();
  
}


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final isTablet = screenWidth >= 600 && screenWidth < 1024;
    // final isWeb = screenWidth >= 1024;

    // double scaleFont(double base) =>
    //     screenWidth < 600 ? base : screenWidth < 1024 ? base * 1.2 : base * 1.4;

    // double scaleSize(double base) =>
    //     screenWidth < 600 ? base : screenWidth < 1024 ? base * 1.3 : base * 1.6;

    return Scaffold(
         appBar: CustomAppBar(
    title: 'Dashboard',
    showMenuButton: true,
    showBackButton: false,
    showAddIcon: false,
  ),
  drawer: Drawer(
  child: Container(
    color: AppColours.background,
    child: Column(
      children: [
        Container(
          height: ResponsiveHelper.hp(context, 30),
          width: double.infinity,
          color: AppColours.blue2,
          child: GetBuilder<AuthController>(
            builder: (ctrl) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
                ctrl.image.isNotEmpty
                    ? CircleAvatar(
                        radius: ResponsiveHelper.wp(context, 8),
                        backgroundImage: NetworkImage(ctrl.image),
                      )
                    : CircleAvatar(
                        radius: ResponsiveHelper.wp(context, 8),
                        backgroundColor: AppColours.blue,
                        child: Icon(
                          Icons.person_outline,
                          size: ResponsiveHelper.wp(context, 8),
                          color: AppColours.onPrimary,
                        ),
                      ),
                SizedBox(height: ResponsiveHelper.hp(context, 1)),
                Text(
                  ctrl.name,
                  style: AppTextStyles.heading3.copyWith(
                    fontSize: ResponsiveHelper.sp(context, 3.0),
                  ),
                ),
                Text(
                  ctrl.role,
                  style: AppTextStyles.heading5.copyWith(
                    fontSize: ResponsiveHelper.sp(context, 3.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
             
              _drawerItem(
                context,
                icon: Icons.people_outline,
                label: "Employees",
                onTap: () => Get.off(() => const EmployeeListScreen()),
                fontSize: ResponsiveHelper.sp(context, 2.8),
              ),
              _drawerItem(
                context,
                icon: Icons.assignment_outlined,
                label: "View Attendance Record",
                onTap: () {},
                fontSize: ResponsiveHelper.sp(context, 2.8),
              ),
              _drawerItem(
                context,
                icon: Icons.assignment_turned_in_outlined,
                label: "Add Attendance",
                onTap: () {},
                fontSize: ResponsiveHelper.sp(context, 2.8),
              ),
              _drawerItem(
                context,
                icon: Icons.event_busy_outlined,
                label: "Leave",
                onTap: () => Get.off(() => LeaveListScreen()),
                fontSize: ResponsiveHelper.sp(context, 2.8),
              ),
              _drawerItem(
                context,
                icon: Icons.description,
                label: "View Leave Record",
                onTap: () => Get.off(() => const LeaveListScreen()),
                fontSize: ResponsiveHelper.sp(context, 2.8),
              ),
              _drawerItem(
  context,
  icon: Icons.calendar_today,
  label: "Holiday List",
  onTap: () => Get.off(() => const HolidayListScreen()),
  fontSize: ResponsiveHelper.sp(context, 2.8),
),

              //  _drawerItem(
              //   context,
              //   icon: Icons.home_outlined,
              //   label: "Home",
              //   onTap: () => Get.off(() => const AdminDashboardScreen()),
              //   fontSize: ResponsiveHelper.sp(context, 2.8),
              // ),
              SizedBox(height: ResponsiveHelper.hp(context, 10)),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.wp(context, 4),
                  vertical: ResponsiveHelper.hp(context, 1),
                ),
                decoration: BoxDecoration(
                  color: AppColours.red,
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.wp(context, 3),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColours.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: AppColours.background,
                    size: ResponsiveHelper.sp(context, 3.5),
                  ),
                  title: Text(
                    'Logout',
                    style: AppTextStyles.heading3.copyWith(
                      fontSize: ResponsiveHelper.sp(context, 2.8),
                    ),
                  ),
                  onTap: () => controller.logout(),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

   
      // drawer: Drawer(
      //   child: Container(
      //     color: AppColours.background,
      //     child: Column(
      //       children: [
      //         Container(
      //           height: scaleSize(220),
      //           width: double.infinity,
      //           color: AppColours.blue2,
      //           child: GetBuilder<AuthController>(
      //             builder: (ctrl) => Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SizedBox(height: scaleSize(40)),
      //                ctrl.image.isNotEmpty
      //                     ? CircleAvatar(
      //                         radius: scaleSize(40),
      //                         backgroundImage: NetworkImage(ctrl.image),
      //                       )
      //                     : CircleAvatar(
      //                         radius: scaleSize(40),
      //                         backgroundColor: AppColours.blue,
      //                         child: Icon(
      //                           Icons.person_outline,
      //                           size: scaleSize(40),
      //                           color: AppColours.background,
      //                         ),
      //                       ),

                      
    
      //                 SizedBox(height: scaleSize(10)),
      //                 Text(ctrl.name,
      //                     style: AppTextStyles.heading3
      //                         .copyWith(fontSize: scaleFont(18))),
      //                 Text(ctrl.role,
      //                     style: AppTextStyles.heading5
      //                         .copyWith(fontSize: scaleFont(14))),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: ListView(
      //             children: [
      //               _drawerItem(
      //                 context,
      //                 icon: Icons.home_outlined,
      //                 label: "Home",
      //                 onTap: () => Get.off(() => const AdminDashboardScreen()),
      //                 fontSize: scaleFont(15),
      //               ),
      //               _drawerItem(
      //                 context,
      //                 icon: Icons.people_outline,
      //                 label: "Employees",
      //                 onTap: () => Get.off(() => const EmployeeListScreen()),
      //                 fontSize: scaleFont(15),
      //               ),
      //               _drawerItem(
      //                 context,
      //                 icon: Icons.assignment_outlined,
      //                 label: "View Attendance Record",
      //                 onTap: () {

      //                 },
      //                 fontSize: scaleFont(15),
      //               ),
      //               _drawerItem(
      //                 context,
      //                 icon: Icons.assignment_turned_in_outlined,
      //                 label: "Add Attendance",
      //                 onTap: () {

      //                 },
      //                 fontSize: scaleFont(15),
      //               ),
      //               _drawerItem(
      //                 context,
      //                 icon: Icons.event_busy_outlined,
      //                 label: "Leave",
      //                 onTap: () {
      //                   Get.off(LeaveListScreen());
                       
      //                 },
      //                 fontSize: scaleFont(15),
      //               ),
      //               _drawerItem(
      //                 context,
      //                 icon: Icons.description,
      //                 label: "View Leave Record",
      //                 onTap: () {
      //                    Get.off(() => const LeaveListScreen());
      //                 },
      //                 fontSize: scaleFont(15),
      //               ),
      //               SizedBox(height: screenHeight * 0.15),
      //               Container(
      //                 margin: EdgeInsets.symmetric(
      //                     horizontal: scaleSize(16), vertical: scaleSize(8)),
      //                 decoration: BoxDecoration(
      //                   color: AppColours.red,
      //                   borderRadius: BorderRadius.circular(scaleSize(10)),
      //                   boxShadow: const [
      //                     BoxShadow(
      //                         color: AppColours.black26,
      //                         blurRadius: 4,
      //                         offset: Offset(0, 2)),
      //                   ],
      //                 ),
      //                 child: ListTile(
      //                   leading: Icon(Icons.logout_outlined,
      //                       color: AppColours.background, size: scaleFont(24)),
      //                   title: Text('Logout',
      //                       style: AppTextStyles.heading3
      //                           .copyWith(fontSize: scaleFont(15))),
      //                   onTap: () => controller.logout(),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(
        width: ResponsiveHelper.wp(context, 60),  // 80% of screen width
        height: ResponsiveHelper.hp(context, 15), // 10% of screen height
        child: Card(
          margin: EdgeInsets.all(ResponsiveHelper.wp(context, 2.5)),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.wp(context, 3),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              ResponsiveHelper.wp(context, 2.5),
            ),
            child: GetBuilder<AuthController>(
              builder: (ctrl) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome ',
                style: AppTextStyles.heading8.copyWith(
                  fontSize: ResponsiveHelper.sp(context, 3.0),
                //  color: Colors.blue,
                ),
              ),
              TextSpan(
                text: '${ctrl.name}',
                style: AppTextStyles.heading5.copyWith(
                  fontSize: ResponsiveHelper.sp(context, 3.0),
                 // color: Colors.green,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: ResponsiveHelper.hp(context, 2)),
        Text(
          '${ctrl.designation}',
          style: AppTextStyles.heading8.copyWith(
            fontSize: ResponsiveHelper.sp(context, 2.5),
         
          ),
        ),
      
      //                RichText(
      // text: TextSpan(
      //   children: [
      //                 TextSpan(
      //       text: 'Welcome ',
      //       style: AppTextStyles.heading5.copyWith(
      //         fontSize: ResponsiveHelper.sp(context, 3.0),
      //         color: Colors.blue, // Change to desired color
      //       ),
      //     ),
      //     TextSpan(
      //       text: '${ctrl.name}',
      //       style: AppTextStyles.heading5.copyWith(
      //         fontSize: ResponsiveHelper.sp(context, 3.0),
      //         color: Colors.green, // Change to another color
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     // TextSpan(
      //     //   text: '  •  ', // Optional separator
      //     //   style: AppTextStyles.heading5.copyWith(
      //     //     fontSize: ResponsiveHelper.sp(context, 2.8),
      //     //     color: Colors.grey,
      //     //   ),
      //     // ),
         
      //   ]
      //               // Text(
      //               //   'Welcome ${ctrl.name}',
      //               //   style: AppTextStyles.heading8.copyWith(
      //               //     fontSize: ResponsiveHelper.sp(context, 3.0),
      //               //   ),
      //               // ),
      //               // SizedBox(
      //               //   height: ResponsiveHelper.wp(context, 1),
      //               // ),
      //               // Text(
      //               //   '${ctrl.designation}',
      //               //   style: AppTextStyles.heading5.copyWith(
      //               //     fontSize: ResponsiveHelper.sp(context, 3.0),
      //               //   ),
      //               // ),
      //           ),
      //           ),
                
                ],
                
                ),
              ),
    ),
          ),
        ),
      ),
      SizedBox(
        height: ResponsiveHelper.hp(context, 2), // 2% of screen height
      ),


//      body: SingleChildScrollView(
//   child:    Column(
//   children: [
//     SizedBox(
//   width: MediaQuery.of(context).size.width * 0.8, // 90% of screen width
//   height: MediaQuery.of(context).size.height * 0.10, // 12% of screen height

//  child:    Card(
//   margin: EdgeInsets.all(10),
//   elevation: 4,
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   child: Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: GetBuilder<AuthController>(
//       builder: (ctrl) =>Center(child: 
//       Row(
//         children: [
//           Text(
//         'Welcome ${ctrl.name}  ',
//         style: AppTextStyles.heading5
//       ),
//       SizedBox(
//         width: 5,
//       ),
//      Text(
//         'Welcome ${ctrl.name}  ',
//         style: AppTextStyles.heading5
//       ),

//         ],
//       ) 
//     ),
//   ),
// ),
//     ),
//     ),
//     SizedBox(
//   height: MediaQuery.of(context).size.height * 0.020, 
// ),
    GetBuilder<EmployeeController>(
      builder: (employeeCtrl) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(
             context: context,
            label: 'Total Employees',
            count: employeeCtrl.totalEmployees,
            icon: Icons.people_outlined,
            color: AppColours.blue,
            onTap: ()=>Get.off(EmployeeListScreen())
          ),
          _buildStatCard(
             context: context,
            label: 'On Leave',
            count: employeeCtrl.employeesOnLeave,
            icon: Icons.event_busy_outlined,
            color: AppColours.orange,
          ),
          
        
        ],
      ),
    ),
    SizedBox(
  height: MediaQuery.of(context).size.height * 0.02,
),


    GetBuilder<EmployeeController>(
      builder: (employeeCtrl) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(
            context: context,
            label: 'Present',
            count: employeeCtrl.employeesPresent,
            icon: Icons.check_circle_outlined,
            color: AppColours.purpule,
          ),
          _buildStatCard(
            context: context,
            label: 'New Employees',
            count: employeeCtrl.totalnewEmployees, 
            icon: Icons.person_add_outlined,
            color: AppColours.teal,
          ),
        ],
      ),
      
  

     ), SizedBox(
  height: MediaQuery.of(context).size.height * 0.02,
),

// Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//   child: Text(
//     'Upcoming Holidays',
//     style:AppTextStyles.bodyText3
//   ),
// ),
//   ]),


// SizedBox(height: screenHeight * 0.02),

// GetBuilder<HolidayController>(
//   builder: (holidayCtrl) {
//     if (holidayCtrl.upcomingHolidays.isEmpty) {
//       return Padding(
//         padding: EdgeInsets.all(screenWidth * 0.02),
//         child: Text(
//           'No upcoming holidays.',
//           style:AppTextStyles.bodyText2,
//         ),
//       );
//     }

//     return SizedBox(
//       height: screenHeight * 0.27, 
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//         itemCount: holidayCtrl.upcomingHolidays.length,
//         itemBuilder: (context, index) {
//           final holiday = holidayCtrl.upcomingHolidays[index];
//           final holidayDate = DateTime.parse(holiday['date']);

//           return Container(
//             width: screenWidth * 0.42, 
//             margin: EdgeInsets.only(right: screenWidth * 0.03),
//             child: Card(
//               color: AppColours.onPrimary,
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(screenWidth * 0.035),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                          Container(
//           padding: EdgeInsets.all( screenWidth * 0.020),
//           decoration: BoxDecoration(
//             color: AppColours.purpule,
//             shape: BoxShape.circle,
//           ),
//                      child:    Icon(Icons.celebration_outlined, color: AppColours.onPrimary, size: screenWidth * 0.05)),
//                         SizedBox(width: screenWidth * 0.02),
//                         Expanded(
//                           child: Text(
//                             holiday['name'],
//                             style: AppTextStyles.bodyText2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: screenHeight * 0.01),
//                     Text(
//                       DateFormat.yMMMMd().format(holidayDate),
//                       style: AppTextStyles.heading5
//                     ),
//                     SizedBox(height: screenHeight * 0.004),
//                     Text(
//                       holiday['description'],
//                       style:AppTextStyles.caption3,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
  



//   );})
]
       ),
    ));
  }
  Widget _buildStatCard({
  required BuildContext context,
  required String label,
  required int count,
  required IconData icon,
  required Color color,
  VoidCallback? onTap,
}) {
  final cardWidth = ResponsiveHelper.wp(context, ResponsiveHelper.isMobile(context) ? 30 : 60);
  final cardHeight = ResponsiveHelper.hp(context, ResponsiveHelper.isMobile(context) ? 15 : 30);
  final padding = ResponsiveHelper.wp(context, 2.5);
  final iconSize = ResponsiveHelper.sp(context, 4.5);
  final textSize = ResponsiveHelper.sp(context, 3.5);
  final labelSize = ResponsiveHelper.sp(context, 2.8);

  final card = Container(
    width: cardWidth,
    height: cardHeight,
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      color: AppColours.onPrimary,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: AppColours.black12, blurRadius: 6)],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColours.onPrimary, size: iconSize),
        ),
        const SizedBox(height: 10),
        Text(
          '$count',
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            color: AppColours.backgroundColour,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: labelSize,
            color: AppColours.fill3,
          ),
        ),
      ],
    ),
  );

  return onTap != null
      ? GestureDetector(onTap: onTap, child: card)
      : card;
}



Widget _drawerItem(
  BuildContext context, {
  required IconData icon,
  required String label,
  required VoidCallback onTap,
  required double fontSize,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: AppColours.blue,
      size: ResponsiveHelper.sp(context, 5.5), 
    ),
    title: Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
      ),
    ),
    onTap: onTap,
  );
}

  // Widget _drawerItem(BuildContext context,
  //     {required IconData icon,
  //     required String label,
  //     required VoidCallback onTap,
  //     required double fontSize}) {
  //   return ListTile(
  //     leading: Icon(icon, color: AppColours.blue, size: AppConstants.appIconsize),
  //     title: Text(label, style: TextStyle(fontSize: fontSize)),
  //     onTap: onTap,
  //   );
  // }
}



