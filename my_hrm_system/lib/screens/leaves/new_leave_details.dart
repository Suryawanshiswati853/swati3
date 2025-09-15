import 'package:my_hrm_system/res/imports.dart';

class NewLeaveDetails extends StatefulWidget {
  final int leaveId;

  NewLeaveDetails({required this.leaveId});

  @override
  _NewLeaveDetailsState createState() => _NewLeaveDetailsState();
}
class _NewLeaveDetailsState extends State<NewLeaveDetails> {


  // NewLeaveDetails({required this.employeeId});
  final LeaveController controller = Get.find();
   @override
  void initState() {
    super.initState();

    // Defer API call to avoid build-time conflict
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.fetchLeaveDetail(widget.leaveId);  // ✅ Pass the ID
      
    });
  }

  String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr).toLocal();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final leave = controller.leaveDetail;

    return Scaffold(
      appBar: CustomAppBar(
      
            showAddIcon: false,
            showMenuButton: false,
            showBackButton: true,
            onBackPressed: () {
            final employeeId = controller.leaveDetail['employee_id'];
  if (employeeId != null) {
     Get.off(() => LeaveListScreen());
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //           Get.off(() => EmployeeListScreen());
    //         });
  } else {
    Get.back(); 
  }
             
            },
            title: 'Leaves Details',
            ),
            body: GetBuilder<LeaveController>(
        builder: (controller) {
          final leave = controller.leaveDetail;

          if (leave.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: EdgeInsets.all(ResponsiveHelper.wp(context, 4)),
          
        child: Column(
          children: [
           
             Row(
                  children: [
                    Expanded(child: _buildTextFormField(context, "Leave Type", leave['leave_type'] ?? "")),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(child: _buildTextFormField(context, "Applied", formatDate(leave['applied_date']))),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
                Row(
                  children: [
                    Expanded(child: _buildTextFormField(context, "From", formatDate(leave['from_date']))),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(child: _buildTextFormField(context, "To", formatDate(leave['to_date']))),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
                Row(
                  children: [
                    Expanded(child: _buildTextFormField(context, "Total Days", leave['total_days'].toString())),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(
                      child: _buildTextFormField(context, "Day Type", "${leave['from_day_type']} - ${leave['to_day_type']}"),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.hp(context, 2)),
                Row(
                  children: [
                    Expanded(child: _buildTextFormField(context, "Reason", leave['reason'] ?? "")),
                    SizedBox(width: ResponsiveHelper.wp(context, 3)),
                    Expanded(child: _buildTextFormField(context, "Status", leave['status']?? "")),
                  ],
                ),
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
          );
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
  

//   Widget _buildTextFormField(BuildContext context, String label, String value) {
//   final screenWidth = MediaQuery.of(context).size.width;
//   final screenHeight = MediaQuery.of(context).size.height;

//   // Dynamically scale sizes
//   double horizontalPadding = screenWidth * 0.03;  // 3% of screen width
//   double verticalPadding = screenHeight * 0.015;  // 1.5% of screen height
//   double borderRadius = screenWidth * 0.035;      // 3.5% of screen width
//   double fontSize = screenWidth * 0.030;          // 4% of screen width

//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: verticalPadding),
//     child: TextFormField(
//       readOnly: true,
//       initialValue: value,
//       style: TextStyle(fontSize: fontSize),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(fontSize: fontSize * 0.95),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//           borderSide: BorderSide(color: Colors.grey.shade400),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//           borderSide: BorderSide(color: Colors.blue, width: 2),
//         ),
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: horizontalPadding,
//           vertical: verticalPadding,
//         ),
//       ),
//     ),
//   );
// }
}