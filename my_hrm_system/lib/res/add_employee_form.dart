import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:my_hrm_system/res/imports.dart';






// class AddEmployeeController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//     File? profileImage;
//       bool isLoading = false;
//         String? currentAddress;
// bool isPasswordVisible = false;
//         void togglePasswordVisibility() {
//   isPasswordVisible = !isPasswordVisible;
//   update();
// }



//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController=TextEditingController();
//   final addressController=TextEditingController();
//   final pinCodeController=TextEditingController();
//   final mobilenoController = TextEditingController();

//   final longController = TextEditingController();
//     final latController = TextEditingController();

//   final roleController = TextEditingController();

//   final designtaionController = TextEditingController();

//   final statusController = TextEditingController();

//   final deptnameController = TextEditingController();

//   final dateController=TextEditingController();
//   String selectedDesignation = 'Developer';
//   int? selectedDepartmentId; 
//     String selectedRole = 'Employee';
//     List<Map<String, dynamic>> departments = [];
//   String? selectedDepartmentName;
//   Position?currentPosition;
//   bool isLoadingDepartments = true;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchDepartments();
//     fetchCurrentLocationAndAddress();
//   }
//   Future<void> fetchCurrentLocationAndAddress() async {
//   try {
//     print(" Checking if location services are enabled...");
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Get.snackbar("Error", "Location services are disabled.");
//       print(" Location services are disabled.");
//       return;
//     }

//     print(" Checking location permissions...");
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       print(" Permission denied, requesting permission...");
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         Get.snackbar("Error", "Location permissions are denied");
//         print(" Location permissions still denied.");
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       Get.snackbar(
//         "Error",
//         "Location permissions are permanently denied, we cannot request them.",
//       );
//       print(" Location permission denied forever.");
//       return;
//     }

//     print(" Getting current position...");
//     currentPosition = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     if (currentPosition == null) {
//       print(" currentPosition is null.");
//       return;
//     }

//     print(" Position fetched: ${currentPosition!.latitude}, ${currentPosition!.longitude}");

//     print(" Fetching placemark from coordinates...");
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       currentPosition!.latitude,
//       currentPosition!.longitude,
//     );

//     if (placemarks.isNotEmpty) {
//       final place = placemarks.first;
//       print(" Placemark details: $place");

//       currentAddress =
//           "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
//       final pinCode = place.postalCode ?? "";

//       print(" Address: $currentAddress");
//       print(" Pincode: $pinCode");

//       addressController.text = currentAddress!;
//       pinCodeController.text = pinCode;
//     } else {
//       print(" No placemarks found.");
//     }

//     update();
//   } catch (e) {
//     Get.snackbar("Location Error", e.toString());
//     print("Exception occurred: $e");
//   }
// }

//   Future<void> addEmployee() async {
//     if (!formKey.currentState!.validate()) return;

//     isLoading = true;
//     update();

//     final url = Uri.parse("http://192.168.67.74:3000/employees/"); 

//     try {
//       final request = http.MultipartRequest("POST", url);
//       request.fields['employee_name'] = nameController.text.trim();
//       request.fields['email'] = emailController.text.trim();
//       request.fields['password'] = passwordController.text.trim();
//       request.fields['address'] = addressController.text.trim();
//       request.fields['designation'] =
//           designtaionController.text.trim().isNotEmpty
//               ? designtaionController.text.trim()
//               : selectedDesignation;
//       request.fields['pincode'] = pinCodeController.text.trim();
//       request.fields['longitude'] = currentPosition?.longitude.toString() ?? "";
//       request.fields['latitude'] = currentPosition?.latitude.toString() ?? "";
//       request.fields['mobile_no'] = mobilenoController.text.trim();
//       request.fields['department_name'] = selectedDepartmentName ?? "";
//       request.fields['role'] = selectedRole;
//       request.fields['joining_date'] = dateController.text.trim();

//       // File Upload
//       if (profileImage != null) {
//         final ext = path.extension(profileImage!.path).toLowerCase().replaceAll('.', '');
//         final mimeType = getMimeType(ext);

//         request.files.add(await http.MultipartFile.fromPath(
//           'employee_image',
//           profileImage!.path,
//           contentType: mimeType,
//         ));
//       }

//       final response = await request.send();

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.snackbar("Success", "Employee added successfully!");
//         clearForm();
//       } else {
//         final errorBody = await response.stream.bytesToString();
//         Get.snackbar("Error", "Failed to add: $errorBody");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Something went wrong: $e");
//     } finally {
//       isLoading = false;
//       update();
//     }
//   }

//   MediaType getMimeType(String ext) {
//     switch (ext) {
//       case 'png':
//         return MediaType('image', 'png');
//       case 'jpg':
//       case 'jpeg':
//         return MediaType('image', 'jpeg');
//       case 'gif':
//         return MediaType('image', 'gif');
//       default:
//         return MediaType('application', 'octet-stream');
//     }
//   }


//   void fetchDepartments() async {
//     try {
//       isLoadingDepartments = true;
//       update();

//       final response = await http.get(Uri.parse('http://192.168.67.74:3000/api/departments'));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         departments = List<Map<String, dynamic>>.from(data['departments']);
//         isLoadingDepartments = false;
//         update();
//       } else {
//         throw Exception('Failed to load departments');
//       }
//     } catch (e) {
//       isLoadingDepartments = false;
//       Get.snackbar("Error", "Could not fetch departments: $e");
//       update();
//     }
//   }

//   void setDepartment(String? name) {
//     selectedDepartmentName = name;
//     selectedDepartmentId = departments.firstWhere((d) => d['name'] == name)['id'];
//     update();
//   }


//   final List<String> roles = ['Employee', 'Admin', 'HR'];
//   final List<String> designations = ['Developer', 'Flutter Developer', 'HR Executive', 'Admin'];

//   Future<void> pickImage(ImageSource source) async {
//     final picked = await ImagePicker().pickImage(source: source, imageQuality: 75);
//     if (picked != null) {
//       profileImage = File(picked.path);
//       update();
//     }
//   }


//   void submit() {
//     if (formKey.currentState!.validate()) {
//       final employeeData = {
//         "employee_name": nameController.text.trim(),
        
//         "email": emailController.text.trim(),
//         "password":passwordController.text.trim(),
//        "designation": designtaionController.text.trim(),
//         "address":addressController.text.trim(),
//         "pincode": pinCodeController.text.trim(),

//        "longitude": longController.text.trim(),

//        "latitude": latController.text.trim(),

//        //"employee_image": positionController.text.trim(),
//       "mobile_no": mobilenoController.text.trim(),


//        "department_name": deptnameController.text.trim(),
//         "joining_date": dateController.text.trim(),

//        "role": roleController.text.trim(),

//        "status": statusController.text.trim(),
 
//       };

//       print("Submitting: $employeeData");

//       Get.snackbar("Success", "Employee added successfully",
//           snackPosition: SnackPosition.TOP);

//       clearForm();
//     }
//   }

//   void clearForm() {
//     nameController.clear();
//     emailController.clear();
//     mobilenoController.clear();
//     designtaionController.clear();
//     deptnameController.clear();

//     longController.clear();

//     latController.clear();

//     dateController.clear();

//     roleController.clear();

//     pinCodeController.clear();

//     statusController.clear();

//     addressController.clear();

//     update();
//   }

//   @override
//   void onClose() {
//     nameController.dispose();
//     emailController.dispose();
//     mobilenoController.dispose();
//     pinCodeController.dispose();

//     longController.dispose();

//     latController.dispose();

//     dateController.dispose();

//     roleController.dispose();
    


    
//     statusController.dispose();

//     addressController.dispose();

//     designtaionController.dispose();

//     deptnameController.dispose();

    
//     super.onClose();
//   }
// }
