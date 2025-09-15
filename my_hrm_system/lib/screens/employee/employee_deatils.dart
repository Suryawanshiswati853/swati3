import 'package:my_hrm_system/res/imports.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  final int employeeId;

  EmployeeDetailsScreen({required this.employeeId});

  @override
  _EmployeeDetailsScreenState createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
      employeeController.fetchEmployeeDetails(widget.employeeId);
      //leaveController.fetchLeaveRequestsForEmployee(widget.employeeId);
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
                    Expanded(child: _buildTextFormField(context, "Address", employee['address'].toString())),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(
                      child: _buildTextFormField(context, "pincode", "${employee['pincode']}"),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
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
                // Row(
                //   children: [
                //     Expanded(child: _buildTextFormField(context, "logitude", employee['longitude'] ?? "")),
                //     SizedBox(width: ResponsiveHelper.wp(context, 3)),
                //     Expanded(child: _buildTextFormField(context, "latitude", employee['latitude']?? "")),
                //   ],
                // ),
                // SizedBox(height: ResponsiveHelper.hp(context, 3)),

            // Row(
            //   children: [
            //     Expanded(child: _buildTextFormField(context,"Leave Type", leave['leave_type'] ?? "")),
            //     const SizedBox(width: 12),
            //     Expanded(child: _buildTextFormField(context,"Applied", formatDate(leave['applied_date']))),
            //   ],
            // ),
            // const SizedBox(height: 12),

            // Row(
            //   children: [
            //     Expanded(child: _buildTextFormField(context,"From", formatDate(leave['from_date']))),
            //     const SizedBox(width: 12),
            //     Expanded(child: _buildTextFormField(context,"To", formatDate(leave['to_date']))),
            //   ],
            // ),
            // const SizedBox(height: 12),

            // Row(
            //   children: [
            //     Expanded(child: _buildTextFormField(context,"Total Days", leave['total_days'].toString())),
            //     const SizedBox(width: 12),
            //     Expanded(child: _buildTextFormField(context,"Day Type", "${leave['from_day_type']} - ${leave['to_day_type']}")),
            //   ],
            // ),
            // const SizedBox(height: 12),

            // Row(
            //   children: [
            //     Expanded(child: _buildTextFormField(context,"Reason", leave['reason'] ?? "")),
            //     const SizedBox(width: 12),
            //     Expanded(child: _buildTextFormField(context,"Status", leave['status'] ?? "")),
            //   ],
            // ),
          ],
        ),
          ));
  }));
  }
  Widget _buildTextFormField(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.hp(context, 1.5)),
      child: TextFormField(
        readOnly: true,
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