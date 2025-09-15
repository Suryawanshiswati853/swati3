import 'package:my_hrm_system/res/imports.dart';
import 'package:my_hrm_system/widget/custom_dropdown.dart';

class EditEmployeeDeatils extends StatefulWidget {
 final int employeeId;

 EditEmployeeDeatils({required this.employeeId});

  @override
  _EditEmployeeDeatilsState createState() => _EditEmployeeDeatilsState();
}
class _EditEmployeeDeatilsState extends State<EditEmployeeDeatils> {
    final formKey = GlobalKey<FormState>();

  


  final EmployeeController controller = Get.put(EmployeeController());
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchEmployeeDetails(widget.employeeId);
    });
  }

  String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr).toLocal();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
       final screenWidth = MediaQuery.of(context).size.width;

        final bool isWeb = screenWidth >= 1024;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;
      final screenHeight = MediaQuery.of(context).size.height;

   

    return Scaffold(
      appBar: CustomAppBar(
      
            showAddIcon: false,
            showMenuButton: false,
            showBackButton: true,
            onBackPressed: () {
          Get.to(EmployeeListScreen());
             
            },
            title: 'Edit Employee',
            ),
             body: GetBuilder<EmployeeController>(
        builder: (controller) {
          if (controller.isEmployeeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final employee = controller.employeeDetails;
          
          if (employee == null) {
            return const Center(child: Text("No data found"));
          }
           final double? latitude = double.tryParse(employee['latitude']?.toString() ?? '');
          final double? longitude = double.tryParse(employee['longitude']?.toString() ?? '');


         return SingleChildScrollView(
      child:    Padding(
            padding: EdgeInsets.all(ResponsiveHelper.wp(context, 4)),
            child: Column(
              children: [
                Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Circular Avatar
    CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
        'http://192.168.67.74:3000/uploads/${employee['employee_image']}',
      ),
    ),

    // Horizontal spacing
    SizedBox(width: ResponsiveHelper.wp(context, 6)),

    // Role and Designation vertically aligned
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${employee['role'] ?? ''}",
          style: TextStyle(
            fontSize: ResponsiveHelper.sp(context, 2.8),
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: ResponsiveHelper.hp(context, 1)),
        Text(
          "${employee['designation'] ?? ''}",
          style: TextStyle(
            fontSize: ResponsiveHelper.sp(context, 2.5),
            color: Colors.grey[700],
          ),
        ),
       //  SizedBox(height: ResponsiveHelper.hp(context, 1)),

        //  Text(
        //   "${employee['department_id'] ?? ''}",
        //   style: TextStyle(
        //     fontSize: ResponsiveHelper.sp(context, 2.8),
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black87,
        //   ),
        // ),
      ],
    ),
  ],
),

                
             Row(
                  children: [
                    Expanded(child: _buildTextFormField(context, "Employee Name", employee['employee_name'] ?? "")),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(child: _buildTextFormField(context, "Email", employee['email'])),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
                Row(
                  children: [
                    Expanded(child: _buildTextFormField(context, "Mobile No", employee['mobile_no'])),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(child: _buildTextFormField(context, "Joining Date",employee['joining_date'])),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
                Row(
                  children: [
                    Expanded(child: _buildTextFormField(context, "Address", employee['address'].toString(),readOnly: true)),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(
                      child: _buildTextFormField(context, "pincode", "${employee['pincode']}",readOnly: true, ),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
//                 Row(
//                   children: [
//                     Expanded(child:
//                     CustomDropdown(
//                       labelText: "Role",
//  // title: "Role",
//   selectedValue: controller.selectedRole,
//   items: controller.roles,
//   onChanged: (value) {
//     controller.selectedRole = value;
//     controller.update();
//   },
// ),

//                     ),
//                     SizedBox(width: ResponsiveHelper.wp(context, 3)),
//                     Expanded(child: CustomDropdown(
//                       labelText: "Designation",
//   //title: "Designation",
//   selectedValue: controller.selectedDesignation,
//   items: controller.designations,
//   onChanged: (value) {
//     controller.selectedDesignation = value;
//     controller.update();
//   },
// ),

//                     ),
//                   ],
//                 ),
                SizedBox(height: ResponsiveHelper.hp(context, 3)),
                  if (latitude != null && longitude != null)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(latitude, longitude),
                        zoom: 15,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId("employee_location"),
                          position: LatLng(latitude, longitude),
                          infoWindow: const InfoWindow(title: "Employee Location"),
                        ),
                      },
                    onMapCreated: (GoogleMapController mapController) {
  controller.setMapController(mapController);
  final lat = double.tryParse(employee['latitude'] ?? '') ?? 0.0;
  final lng = double.tryParse(employee['longitude'] ?? '') ?? 0.0;
  controller.animateToEmployeeLocation(lat, lng);



                      },
                    ),
                  )
                else
                  const Text("Location not available"),

                      Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWeb ? 64 : isTablet ? 32 : 16,
        vertical: screenHeight * 0.02,
      ),
      child: Row(
        children: [
          // Add Employee Button
          Expanded(
            child: SizedBox(
              height: isTablet ? 52 : 44,
              child: CustomButton(
                isLoading: controller.isLoading,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                  }
                   else {
                    print("Form is invalid. Failed");
                  }
                },
                text: "Edit Employee",
                isWeb: isWeb,
                isTablet: isTablet,
                backgroundColor: AppColours.blue,
                textStyle: AppTextStyles.buttonStyle,
                loadingColor: AppColours.background,
              ),
            ),
          ),

          SizedBox(width: isWeb ? 24 : 12),

          // Location Icon Button
          // Container(
          //   height: isTablet ? 52 : 44,
          //   width: isTablet ? 52 : 44,
          //   decoration: BoxDecoration(
          //     color: AppColours.blue,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: IconButton(
          //     icon: const Icon(Icons.my_location, color: Colors.white),
          //     onPressed: controller.fetchCurrentLocationAndAddress,
          //     tooltip: "Use My Location",
          //     iconSize: isTablet ? 26 : 22,
          //   ),
          // ),
        ],
      ),),
              
            
          
//                 SizedBox(
//   height: ResponsiveHelper.hp(context, 30),
//   child: GoogleMap(
//     initialCameraPosition: CameraPosition(
//       target: LatLng(
//         double.tryParse(employee['latitude'] ?? '0') ?? 0.0,
//         double.tryParse(employee['longitude'] ?? '0') ?? 0.0,
//       ),
//       zoom: 14,
//     ),
//     markers: {
//       Marker(
//         markerId: MarkerId("employee_location"),
//         position: LatLng(
//           double.tryParse(employee['latitude'] ?? '0') ?? 0.0,
//           double.tryParse(employee['longitude'] ?? '0') ?? 0.0,
//         ),
//         infoWindow: InfoWindow(title: employee['employee_name']),
//       ),
//     },
//     onMapCreated: (GoogleMapController mapController) {
//        _mapController = mapController;
//       // Optional: store controller if needed
//     },
//     myLocationEnabled: false,
//     zoomControlsEnabled: true,
//   ),
// ),


           
          ],
        ),
          ));
  }));
  }
  Widget _buildTextFormField(BuildContext context, String label, String value, 
  //TextEditingController controller, 
  {
  bool readOnly = false, 
}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.hp(context, 1.5)),
      child: TextFormField(
       readOnly: readOnly,
        initialValue: value,
        style: TextStyle(fontSize: ResponsiveHelper.sp(context, 3.0)),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: ResponsiveHelper.sp(context, 3.2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ResponsiveHelper.wp(context, 3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ResponsiveHelper.wp(context, 3)),
            borderSide: BorderSide(color: AppColours.gray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ResponsiveHelper.wp(context, 3)),
            borderSide: BorderSide(color: AppColours.blue, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.wp(context, 3),
            vertical: ResponsiveHelper.hp(context, 1.5),
          ),
        ),
      ),
    );
  }
}