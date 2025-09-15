import 'package:my_hrm_system/res/imports.dart';

class HrDashboardScreen extends StatefulWidget {
  const HrDashboardScreen({Key? key}) : super(key: key);

  @override
  State<HrDashboardScreen> createState() => _HrDashboardScreenState();
}

class _HrDashboardScreenState extends State<HrDashboardScreen> {
  final AuthController controller = Get.put(AuthController());
   @override
void initState() {
  super.initState();
  controller.loadUserFromPrefs();
}


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final isTablet = screenWidth >= 600 && screenWidth < 1024;
    // final isWeb = screenWidth >= 1024;

    double scaleFont(double base) =>
        screenWidth < 600 ? base : screenWidth < 1024 ? base * 1.2 : base * 1.4;

    double scaleSize(double base) =>
        screenWidth < 600 ? base : screenWidth < 1024 ? base * 1.3 : base * 1.6;

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
                height: scaleSize(220),
                width: double.infinity,
                color: AppColours.blue2,
                child: GetBuilder<AuthController>(
                  builder: (ctrl) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   SizedBox(height: scaleSize(40)),
                   ctrl.image.isNotEmpty
                          ? CircleAvatar(
                              radius: scaleSize(40),
                              backgroundImage: NetworkImage(ctrl.image),
                            )
                          : CircleAvatar(
                              radius: scaleSize(40),
                              backgroundColor: AppColours.blue2,
                              child: Icon(
                                Icons.person,
                                size: scaleSize(40),
                                color: Colors.white,
                              ),
                            ),

     
                    SizedBox(height: scaleSize(10)),
                     
                      SizedBox(height: scaleSize(10)),
                      Text(ctrl.name,
                          style: AppTextStyles.heading3
                              .copyWith(fontSize: scaleFont(16))),
                      Text(ctrl.role,
                          style: AppTextStyles.heading5
                              .copyWith(fontSize: scaleFont(14))),
                    ],
                  ),
                ),
              ),
               Expanded(
                child: ListView(
                  children: [
                    _drawerItem(
                      context,
                      icon: Icons.home,
                      label: "Home",
                      onTap: () => Get.to(() => const AdminDashboardScreen()),
                      fontSize: scaleFont(16),
                    ),
                    _drawerItem(
                      context,
                      icon: Icons.people,
                      label: "Employees",
                      onTap: () => Get.to(() => const EmployeeListScreen()),
                      fontSize: scaleFont(15),
                    ),
                    _drawerItem(
                      context,
                      icon: Icons.assignment,
                      label: "View Attendance Record",
                      onTap: () {},
                      fontSize: scaleFont(15),
                    ),
                    _drawerItem(
                      context,
                      icon: Icons.assignment_turned_in_outlined,
                      label: "Add Attendance",
                      onTap: () {},
                      fontSize: scaleFont(15),
                    ),
                    _drawerItem(
                      context,
                      icon: Icons.event_busy,
                      label: "Leave",
                      onTap: () {
                       
                      },
                      fontSize: scaleFont(15),
                    ),
                    _drawerItem(
                      context,
                      icon: Icons.description,
                      label: "View Leave Record",
                      onTap: () {
                         Get.to(() => const LeaveListScreen());
                      },
                      fontSize: scaleFont(15),
                    ),
                    SizedBox(height: screenHeight * 0.15),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: scaleSize(16), vertical: scaleSize(8)),
                      decoration: BoxDecoration(
                        color: AppColours.error,
                        borderRadius: BorderRadius.circular(scaleSize(10)),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2)),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.logout,
                            color: AppColours.onPrimary, size: scaleFont(24)),
                        title:  Text('Logout',
                            style: AppTextStyles.heading3
                                .copyWith(fontSize: scaleFont(14))),
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
    
      body:Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [

        ],
      )));
  }
   Widget _drawerItem(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap,
      required double fontSize}) {
    return ListTile(
      leading: Icon(icon, color: AppColours.blue, size: 26),
      title: Text(label, style: TextStyle(fontSize: fontSize)),
      onTap: onTap,
    );
  }
}
    