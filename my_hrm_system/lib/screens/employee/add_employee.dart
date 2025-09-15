import 'package:my_hrm_system/res/imports.dart';



class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  late final EmployeeController controller;
  late final LocationController locationController;
    final _formKey = GlobalKey<FormState>();
      DateTime? selectedDate;
      Position? currentPosition;



   String awayFromOffice = '200 M';

  static const LatLng companyLocation = LatLng(18.440987296808864, 73.85815125032131);//18.440987296808864, 73.85815125032131
  // static const CameraPosition _kGoogleplex = CameraPosition(
  //   target: companyLocation,
  //   zoom: 14,
  // );

  // final List<Marker> _markers = <Marker>[
  //   Marker(
  //     markerId: MarkerId('1'),
  //     position: companyLocation,
  //     infoWindow: InfoWindow(title: 'Anjalinagar Katraj'),
  //   ),
  // ];


  @override
  void initState() {
    super.initState();
    controller = Get.put(EmployeeController());
  }
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   // final now = TimeOfDay.now();
  }


  

  

  @override
  void dispose() {
    Get.delete<EmployeeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   //  final double screenWidth = MediaQuery.of(context).size.width;
       final screenWidth = MediaQuery.of(context).size.width;

    final bool isWeb = screenWidth >= 1024;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;
      final screenHeight = MediaQuery.of(context).size.height;

    // final avatarRadius = screenWidth * 0.10;
    final verticalSpaceSmall = screenHeight * 0.01;
    final verticalSpaceMedium = screenHeight * 0.02;
    // final verticalSpaceLarge = screenHeight * 0.04;
    final horizontalGap = screenWidth * 0.02;
    final paddingAll = screenWidth * 0.02;

    // final double allPadding = ResponsiveHelper.isMobile(context)
    //     ? 10.0
    //     : isTablet
    //         ? 20.0
    //         : 30.0;
    // final double newPadding = ResponsiveHelper.isMobile(context)
    //     ? 24.0
    //     : isTablet
    //         ? 34.0
    //         : 44.0;
            final contentHorizontal = screenWidth * 0.03; 
final contentVertical = screenHeight * 0.015; 
    final double borderRadius = isWeb ? 20.0 : isTablet ? 15.0 : 12.0;
final size = MediaQuery.of(context).size;
final avatarRadius = size.width * 0.06; 
        return Scaffold(
            resizeToAvoidBottomInset: false
            , 
           appBar:CustomAppBar(
      
            showAddIcon: false,
            showBackButton: true,
           
            onBackPressed: () {
            Get.off(EmployeeListScreen())  ;          
            },
            title: 'Add Employee',
            ),
          body: GetBuilder<EmployeeController>(
       builder: (controller) => GestureDetector(

    onTap: () => FocusScope.of(context).unfocus(),
         child:SafeArea(
           
      child: SingleChildScrollView(
         reverse: true,
        child: Padding(
          padding: EdgeInsets.all(paddingAll),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
  child: Padding(
    padding: EdgeInsets.all(paddingAll),
    child: Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: AppColours.gray,
          backgroundImage: controller.profileImage != null
              ? FileImage(controller.profileImage!)
              : null,
          child: controller.profileImage == null
              ? Icon(
                  Icons.person_outline,
                  size: avatarRadius * 0.8, 
                  color: AppColours.background,
                )
              : null,
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              Get.bottomSheet(
                Container(
                  padding: EdgeInsets.all(paddingAll),
                  decoration: const BoxDecoration(
                    color: AppColours.background,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.camera_alt_outlined),
                        title: const Text('Take Photo'),
                        onTap: () {
                          Get.back();
                          controller.pickImage(ImageSource.camera);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.image_outlined),
                        title: const Text('Choose from Gallery'),
                        onTap: () {
                          Get.back();
                          controller.pickImage(ImageSource.gallery);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(size.width * 0.012), 
              decoration: BoxDecoration(
                color: AppColours.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                size: size.width * 0.02,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
              
                SizedBox(height: verticalSpaceSmall),
                const Text("Employee Name", style: AppTextStyles.bodyText2),
                SizedBox(height: verticalSpaceSmall),
               
                NewCustomTextFormField(
               keyboardType: TextInputType.name,

                  controller: controller.nameController,
                  hintText: "Enter full name",
                  prefixIcon: Icons.person_outline,
                  validator: Validation.validateName,
                ),
                SizedBox(height: verticalSpaceSmall),
                Row(
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Email", style: AppTextStyles.bodyText2),
        //  SizedBox(height: verticalSpaceSmall),
          Container(
            
           height: 80, // Adjust height as needed
            child: NewCustomTextFormField(
                // errorStyle:   TextStyle(height: ),
              controller: controller.emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
              validator: Validation.validateEmail,
            ),
          ),
        ],
      ),
    ),
    SizedBox(width: horizontalGap),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Joining Date", style: AppTextStyles.bodyText2),
        //  SizedBox(height: verticalSpaceSmall),
          Container(
            height: 80,
             
            child: NewCustomTextFormField(
            errorStyle:   TextStyle(height: 1),
              controller: controller.dateController,
              hintText: "Select Joining Date",
              validator: Validation.validateDate,
              prefixIcon: Icons.calendar_month_outlined,
              
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3100),
                );
                if (pickedDate != null) {
                  controller.dateController.text =
                      "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                  controller.update();
                }
              },
            ),
          ),
        ],
      ),
    ),
  ],
),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
                    
//                       child:
//                        Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("Email", style: AppTextStyles.bodyText2),
//                             SizedBox(height: verticalSpaceSmall),
                          
                        
//                          NewCustomTextFormField(
                            
//                             controller: controller.emailController,
//                             hintText: "Email",
//                             keyboardType: TextInputType.emailAddress,
//                            prefixIcon: Icons.email_outlined,

//                             validator: Validation.validateEmail,
//                              errorStyle: TextStyle(height: 1.5),
//                           ),
//                       ],
//                       ),
//                     ),
//                         SizedBox(width: horizontalGap),

//                       Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("Joining Date", style: AppTextStyles.bodyText2),
//                             SizedBox(height: verticalSpaceSmall),
//                             NewCustomTextFormField(
//                                 errorStyle: TextStyle(height: 1.5),
//                      controller: controller.dateController,
//                   //  label: "Joining Date",
//                   hintText: "Select Joining Date",
//                     validator: Validation.validateDate,
                  
//                   prefixIcon: Icons.calendar_month_outlined,
//   onTap: () async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(3100),
//     );

//     if (pickedDate != null) {
//       controller.dateController.text =
//           "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
//           controller.update();
//     }
//   },
// ),

                          
//                       ],
//                       ),
//                     ),
//                   ],
//                 ),
              //  SizedBox(height: verticalSpaceSmall),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Password", style: AppTextStyles.bodyText2),
                            SizedBox(height: verticalSpaceSmall),
                          NewCustomTextFormField(
                           
                            controller: controller.passwordController,
                             obscureText: controller.isPasswordVisible,
                                 prefixIcon: Icons.lock_outline,
                         suffixIcon: controller.isPasswordVisible
          ? Icons.visibility
          : Icons.visibility_off,
      onSuffixIconTap: controller.togglePasswordVisibility,
                            hintText: "Password",
                            validator: Validation.validatePassword,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: horizontalGap),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Mobile Number", style: AppTextStyles.bodyText2),
                            SizedBox(height: verticalSpaceSmall),
                          NewCustomTextFormField(
               
                            controller: controller.mobilenoController,
                            hintText: "Enter mobile number",
                               prefixIcon: Icons.phone_outlined,
                               inputFormatters: [
                                       FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10),
                                           ],

                            keyboardType: TextInputType.phone,
                               validator: Validation.validateMobile,

                            // validator: (val) => val == null || val.length < 10 ? "Invalid mobile number" : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpaceSmall),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Role", style: AppTextStyles.bodyText2),
                          SizedBox(height: verticalSpaceSmall),
                          DropdownButtonFormField<String>(
                            value: controller.selectedRole,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
                              contentPadding: EdgeInsets.symmetric(horizontal: contentHorizontal, vertical: contentVertical),
                            ),
                            validator: (String? value) {
                             if(value==null){
                              return "Please select the role";
                             }
                             return null;
                            },
                            items: controller.roles.map((role) => DropdownMenuItem(value: role, child: Text(role))).toList(),
                            onChanged: (value) {
                              controller.selectedRole = value!;
                              controller.update();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: horizontalGap),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Designation", style: AppTextStyles.bodyText2),
                          SizedBox(height: verticalSpaceSmall),
                          DropdownButtonFormField<String>(
                            value: controller.selectedDesignation,
                            decoration: InputDecoration(
                             
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
                              contentPadding: EdgeInsets.symmetric(horizontal: contentHorizontal, vertical: contentVertical),
                            ),
                             validator: (String? value) {
                             if(value==null){
                              return "Please select the Designation";
                             }
                             return null;
                            },
                            items: controller.designations.map((des) => DropdownMenuItem(value: des, child: Text(des))).toList(),
                            onChanged: (value) {
                              controller.selectedDesignation = value!;
                              controller.update();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpaceMedium),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Address", style: AppTextStyles.bodyText2),
                            SizedBox(height: verticalSpaceSmall),
                          NewCustomTextFormField(
                         keyboardType: TextInputType.streetAddress,
                         prefixIcon: Icons.location_on_outlined,


                            controller: controller.addressController,
                            hintText: "Enter address",
                               validator: Validation.validateAddress
                            // validator: (val) => val == null || val.isEmpty ? "Address required" : null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: horizontalGap),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Pincode", style: AppTextStyles.bodyText2),
                            SizedBox(height: verticalSpaceSmall),
                          NewCustomTextFormField(
                            prefixIcon: Icons.markunread_mailbox_outlined,

                            
                            controller: controller.pinCodeController,
                            hintText: "Pincode",
                            keyboardType: TextInputType.number,
                         validator: Validation.validatePincode,

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalSpaceSmall),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Department", style: AppTextStyles.bodyText2),
                          SizedBox(height: verticalSpaceSmall),
                          DropdownButtonFormField<String>(
  value: (controller.selectedDepartmentName != null &&
          controller.selectedDepartmentName!.isNotEmpty)
      ? controller.selectedDepartmentName
      : null, // Prevents null issue
  decoration: InputDecoration(
    hintText: "Select the Department",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: contentHorizontal,
      vertical: contentVertical,
    ),
  ),
  items: controller.departments
      .map((dept) => DropdownMenuItem<String>(
            value: dept['name'],
            child: Text(dept['name']),
          ))
      .toList(),
  onChanged: (value) {
    if (value != null) {
      controller.setDepartment(value);
      controller.update();
    controller.  formKey.currentState?.validate(); 
    }
  },
  validator: (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Select department';
    }
    return null;
  },
)

//                           DropdownButtonFormField<String>(
//                             value: controller.selectedDepartmentName,
//                             decoration: InputDecoration(
//                               hintText: "Select the Department",
//                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
//                               contentPadding: EdgeInsets.symmetric(horizontal: contentHorizontal, vertical: contentVertical),
//                             ),
//                             items: controller.departments.map((dept) => DropdownMenuItem<String>(
//                               value: dept['name'],
//                               child: Text(dept['name']),
//                             )).toList(),
//                             onChanged: (value) => controller.setDepartment(value),
//                             validator: (value) {
//   if (value == null || value.isEmpty) {
//     return 'slelect department';
//   }
//   return null;
// },

//                           //  validator: (val) => val == null ? "Please select department" : null,
//                           ),
                        ],
                      ),
                    ),
                  ],
                ),
             SizedBox(height: verticalSpaceMedium),

//                 ElevatedButton.icon(
//   onPressed: controller.fetchCurrentLocationAndAddress,
//   icon: const Icon(Icons.my_location),
//   label: const Text("Use My Location"),
// ),

                SizedBox(height: verticalSpaceMedium),
                  controller.currentPosition == null
            ? const Text("Location not available")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${controller.currentPosition!.latitude},  '
                    '${controller.currentPosition!.longitude}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          controller.currentPosition!.latitude,
                          controller.currentPosition!.longitude,
                        ),
                        zoom: 15,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId("currentLocation"),
                          position: LatLng(
                            controller.currentPosition!.latitude,
                            controller.currentPosition!.longitude,
                          ),
                        ),
                      },
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  ),
                ],
              ),
                // if (controller.currentPosition != null)
                //   SizedBox(
                //     height: screenHeight * 0.25,
                //     child: GoogleMap(
                //       initialCameraPosition: CameraPosition(
                //         target: LatLng(
                //           controller.currentPosition!.latitude,
                //           controller.currentPosition!.longitude,
                //         ),
                        
                //         zoom: 15,
                //       ),
                      
                //       markers: {
                //         Marker(
                //           markerId: const MarkerId("currentLocation"),
                //           position: LatLng(
                //             controller.currentPosition!.latitude,
                //             controller.currentPosition!.longitude,
                //           ),
                          
                //         ),
                //       },
                //     ),
                //   ),
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
                  if (controller.formKey.currentState!.validate()) {
                    await controller.addEmployee();
                  } else {
                    print("Form is invalid. Failed");
                  }
                },
                text: "Add Employee",
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
          Container(
            height: isTablet ? 52 : 44,
            width: isTablet ? 52 : 44,
            decoration: BoxDecoration(
              color: AppColours.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.my_location, color: Colors.white),
              onPressed: controller.fetchCurrentLocationAndAddress,
              tooltip: "Use My Location",
              iconSize: isTablet ? 26 : 22,
            ),
          ),
        ],
      ),),
//                      CustomButton(
//   isLoading: controller.isLoading,
//   onPressed: () async {
//     if (controller.formKey.currentState!.validate()) {
//         await controller.addEmployee();
      
      
//   } else {
//     print(" Form is invalid. failed");
//   }

    
//   },
//   text: "Add Employee",
//   isWeb: isWeb,
//   isTablet: isTablet,
//   backgroundColor: AppColours.blue,
//   textStyle: AppTextStyles.buttonStyle,
//   loadingColor: AppColours.background,
// ),


              ],
            ),
          ),
        ),
      ),
    ))));
  }
}
//