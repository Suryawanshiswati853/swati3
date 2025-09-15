import 'dart:io';
import '../../res/imports.dart' as http;
import 'package:path/path.dart' as path;
import 'package:my_hrm_system/res/imports.dart';


class EmployeeController extends GetxController {
      static const String baseUrl = 'http://192.168.67.74:3000';
    Map<String, dynamic>? employeeDetails;
  bool isEmployeeLoading = false;


  double? selectedLatitude;
  double? selectedLongitude;
  List<Marker> markers = [];
  

  
  List<dynamic> employeeList = [];
  // bool isLoading = true;
  int totalEmployees = 0;
  int employeesOnLeave = 0;
  int employeesPresent = 0;
  int totalnewEmployees=0;
  int totalDepartments=0;
   GoogleMapController? mapController;
   Map<String, dynamic> employee = {};

  
  final formKey = GlobalKey<FormState>();
    File? profileImage;
      bool isLoading = false;
        String? currentAddress;
bool isPasswordVisible = false;
        void togglePasswordVisibility() {
  isPasswordVisible = !isPasswordVisible;
  update();
}



  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController=TextEditingController();
  final addressController=TextEditingController();
  final pinCodeController=TextEditingController();
  final mobilenoController = TextEditingController();

  final longController = TextEditingController();
    final latController = TextEditingController();

  final roleController = TextEditingController();

  final designtaionController = TextEditingController();

  final statusController = TextEditingController();

  final deptnameController = TextEditingController();

  final dateController=TextEditingController();
  String selectedDesignation = 'Developer';
  int? selectedDepartmentId; 
    String selectedRole = 'Employee';
    List<Map<String, dynamic>> departments = [];
  String? selectedDepartmentName;
  Position?currentPosition;
  bool isLoadingDepartments = true;

  @override
  void onInit() {
    super.onInit();
    
      fetchEmployees();  
   fetchEmployeeData();  
    fetchDepartments();
   // fetchCurrentLocationAndAddress();
    //  mobilenoController.text = employee['mobile_no'] ?? '';
  }
  Future<void> fetchCurrentLocationAndAddress() async {
  try {
    print(" Checking if location services are enabled...");
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", "Location services are disabled.");
      print(" Location services are disabled.");
      return;
    }

    print(" Checking location permissions...");
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print(" Permission denied, requesting permission...");
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permissions are denied");
        print(" Location permissions still denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Error",
        "Location permissions are permanently denied, we cannot request them.",
      );
      print(" Location permission denied forever.");
      return;
    }

    print(" Getting current position...");
    currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    if (currentPosition == null) {
      print(" currentPosition is null.");
      return;
    }

    print(" Position fetched: ${currentPosition!.latitude}, ${currentPosition!.longitude}");

    print(" Fetching placemark from coordinates...");
    List<Placemark> placemarks = await placemarkFromCoordinates(
      currentPosition!.latitude,
      currentPosition!.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      print(" Placemark details: $place");

      currentAddress =
          "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
      final pinCode = place.postalCode ?? "";

      print(" Address: $currentAddress");
      print(" Pincode: $pinCode");

      addressController.text = currentAddress!;
      pinCodeController.text = pinCode;
    } else {
      print(" No placemarks found.");
    }

    update();
  } catch (e) {
  SnackbarUtil.showError('Location Error');

    // Get.snackbar("Location Error", e.toString());
    print("Exception occurred: $e");
  }
}

  Future<void> addEmployee() async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    update();

    final url = Uri.parse("$baseUrl/employees/"); 

    try {
      final request = http.MultipartRequest("POST", url);
      request.fields['employee_name'] = nameController.text.trim();
      request.fields['email'] = emailController.text.trim();
      request.fields['password'] = passwordController.text.trim();
      request.fields['address'] = addressController.text.trim();
      request.fields['designation'] =
          designtaionController.text.trim().isNotEmpty
              ? designtaionController.text.trim()
              : selectedDesignation;
      request.fields['pincode'] = pinCodeController.text.trim();
      request.fields['longitude'] = currentPosition?.longitude.toString() ?? "";
      request.fields['latitude'] = currentPosition?.latitude.toString() ?? "";
      request.fields['mobile_no'] = mobilenoController.text.trim();
      request.fields['department_name'] = selectedDepartmentName ?? "";
      request.fields['role'] = selectedRole;
      request.fields['joining_date'] = dateController.text.trim();

      // File Upload
      if (profileImage != null) {
        final ext = path.extension(profileImage!.path).toLowerCase().replaceAll('.', '');
        final mimeType = getMimeType(ext);

        request.files.add(await http.MultipartFile.fromPath(
          'employee_image',
          profileImage!.path,
          contentType: mimeType,
        ));
      }

      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
             SnackbarUtil.showSuccess('Employee added successfully!');

        Get.snackbar("Success", "Employee added successfully!");
        clearForm();
      } else {
        final errorBody = await response.stream.bytesToString();
     SnackbarUtil.showError('Could not fetch departments: $errorBody');

        // Get.snackbar("Error", "Failed to add: $errorBody");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  MediaType getMimeType(String ext) {
    switch (ext) {
      case 'png':
        return MediaType('image', 'png');
      case 'jpg':
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'gif':
        return MediaType('image', 'gif');
      default:
        return MediaType('application', 'octet-stream');
    }
  }


  void fetchDepartments() async {
    try {
      isLoadingDepartments = true;
      update();

      final response = await http.get(Uri.parse('$baseUrl/api/departments'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        departments = List<Map<String, dynamic>>.from(data['departments']);
        isLoadingDepartments = false;
        update();
      } else {
        throw Exception('Failed to load departments');
      }
    } catch (e) {
      isLoadingDepartments = false;
       SnackbarUtil.showError('Could not fetch departments: $e');

      // Get.snackbar("Error", "Could not fetch departments: $e");
      update();
    }
  }

  void setDepartment(String? name) {
    selectedDepartmentName = name;
    selectedDepartmentId = departments.firstWhere((d) => d['name'] == name)['id'];
    update();
  }


  final List<String> roles = ['Employee', 'Admin', 'HR'];
  final List<String> designations = ['Developer', 'Flutter Developer', 'HR Executive', 'Admin'];

  Future<void> pickImage(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source, imageQuality: 75);
    if (picked != null) {
      profileImage = File(picked.path);
      update();
    }
  }


  void submit() {
    if (formKey.currentState!.validate()) {
      final employeeData = {
        "employee_name": nameController.text.trim(),
        
        "email": emailController.text.trim(),
        "password":passwordController.text.trim(),
       "designation": designtaionController.text.trim(),
        "address":addressController.text.trim(),
        "pincode": pinCodeController.text.trim(),

       "longitude": longController.text.trim(),

       "latitude": latController.text.trim(),

      "mobile_no": mobilenoController.text.trim(),


       "department_name": deptnameController.text.trim(),
        "joining_date": dateController.text.trim(),

       "role": roleController.text.trim(),

       "status": statusController.text.trim(),
 
      };

      print("Submitting: $employeeData");
             SnackbarUtil.showSuccess('Employee added successfully');


      // Get.snackbar("Success", "Employee added successfully",
      //     snackPosition: SnackPosition.TOP);

      clearForm();
    }
  }
      Future<void> fetchEmployeeDetails(int employeeId) async {
    isEmployeeLoading = true;
    update();
    try {
      final response = await http.get(Uri.parse('$baseUrl/employees/$employeeId'));

      if (response.statusCode == 200) {
        employeeDetails = jsonDecode(response.body);
        loadEmployeeLocation(employeeDetails!);
      } else {
        employeeDetails = null;
      }
    } catch (e) {
      employeeDetails = null;
    } finally {
      isEmployeeLoading = false;
      update();
    }
  }
  void loadEmployeeLocation(Map<String, dynamic> employeeData) {
    selectedLatitude = double.tryParse(employeeData['latitude'].toString());
    selectedLongitude = double.tryParse(employeeData['longitude'].toString());
    if (selectedLatitude != null && selectedLongitude != null) {
      updateMarker(selectedLatitude!, selectedLongitude!);
    }
  }

  void setLocation(double latitude, double longitude) {
    selectedLatitude = latitude;
    selectedLongitude = longitude;
    updateMarker(latitude, longitude);
    update();
  }

  void updateMarker(double lat, double lng) {
    markers = [
      Marker(
        markerId: const MarkerId('emp_location'),
        position: LatLng(lat, lng),
        infoWindow: const InfoWindow(title: 'Employee Location'),
      ),
    ];
  }
  


 Future<void> fetchEmployeeData() async {
    try {
      final uri = Uri.parse('$baseUrl/employees/present');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        totalEmployees = data['total_employees'];
        employeesOnLeave = data['employees_on_leave'];
        employeesPresent = data['employees_present'];
        totalnewEmployees=data['new_employees_last_30_days'];
        update();
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
  
  Future<void> fetchDepartmentData() async {
    try {
      final uri = Uri.parse('$baseUrl/api/departments/count');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        totalDepartments = data['total_departments'];
        
        update();
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
  Future<void> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(AppConstants.employeesEndpoint));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        employeeList = data['employee_list'];
      } else {
        print('Failed to load employees');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      update(); 
    }
  }
  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  void animateToEmployeeLocation(double lat, double lng) {
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(lat, lng), 16),
      );
    }

  }
  void clearForm() {
    nameController.clear();
    emailController.clear();
    mobilenoController.clear();
    designtaionController.clear();
    deptnameController.clear();

    longController.clear();

    latController.clear();

    dateController.clear();

    roleController.clear();

    pinCodeController.clear();

    statusController.clear();

    addressController.clear();

    update();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobilenoController.dispose();
    pinCodeController.dispose();

    longController.dispose();

    latController.dispose();

    dateController.dispose();

    roleController.dispose();
    


    
    statusController.dispose();

    addressController.dispose();

    designtaionController.dispose();

    deptnameController.dispose();

    
    super.onClose();
  }
}


  
  
