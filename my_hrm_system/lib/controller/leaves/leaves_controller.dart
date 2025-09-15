import 'package:http/http.dart' as http;
import 'package:my_hrm_system/res/imports.dart';


class LeaveController extends GetxController {
  static const String baseUrl = 'http://192.168.67.74:3000/api';
  List<dynamic> leaveList = [];
  Map<int, String> leaveStatuses = {};

  bool isLoading = true;
  Map<String, dynamic> leaveDetail = {};
   Map<String, dynamic>? leaveData;
  bool isLoadingLeaves = false;
  bool isLoadingRequests = false;
  List<Map<String, dynamic>> leaveRequests = [];
   bool showAll = false;
   void toggleViewAll() {  
    showAll = !showAll;
    update();
  }
  

  @override
  void onInit() {
    fetchLeaves();
    
    super.onInit();
  }

  Future<void> fetchLeaves() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/leaves'));

      if (response.statusCode == 200) {
        leaveList = jsonDecode(response.body);
      } else {
        print('Failed to load leaves');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      update(); 
    }
  }
    Future<void> fetchLeaveSummary(int employeeId) async {
    isLoadingLeaves = true;
    update();

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/leaves/summary?employee_id=$employeeId'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        leaveData = data["$employeeId"]?['leaves'] ?? {};
      } else {
        leaveData = {};
        SnackbarUtil.showError('Failed to fetch leave summary');
      }
    } catch (e) {
      leaveData = {};
      SnackbarUtil.showError('An error occurred while fetching summary');
    } finally {
      isLoadingLeaves = false;
      update();
    }
  }

  // Future<void> fetchLeaveSummary(int employeeId) async {
  //   isLoadingLeaves = true;
    

  //   final response = await http.get(
  //     Uri.parse('$baseUrl/leaves/summary?employee_id=$employeeId'),
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     leaveData = data["$employeeId"]?['leaves'];
  //   } else {
  //     leaveData = null;
  //      SnackbarUtil.showError('Failed to fetch leave data');
  //   }

  //   isLoadingLeaves = false;
  //   update();
  // }
    Future<void> fetchLeaveRequestsForEmployee(int employeeId) async {
    isLoadingRequests = true;
    update();

    try {
      final response = await http.get(Uri.parse('$baseUrl/leaves/by-employee?employee_id=$employeeId'));

      if (response.statusCode == 200) {
        leaveRequests = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } else {
        leaveRequests = [];
        SnackbarUtil.showError('Failed to fetch leave requests');
      }
    } catch (e) {
      leaveRequests = [];
      SnackbarUtil.showError('An error occurred while fetching requests');
    } finally {
      isLoadingRequests = false;
      update();
    }
  }

  // Future<void> fetchLeaveRequestsForEmployee(int employeeId) async {
  //   isLoadingRequests = true;
   
  //   try {
  //     final response = await http.get(Uri.parse('$baseUrl/leaves/by-employee?employee_id=$employeeId'));

  //     if (response.statusCode == 200) {
  //       leaveRequests = List<Map<String, dynamic>>.from(jsonDecode(response.body));
  //     } else {
  //       leaveRequests = [];
  //     }
  //   } catch (e) {
  //     leaveRequests = [];
  //   } finally {
  //     isLoadingRequests = false;
  //     update();
  //   }
  // }
  Future<void> fetchLeaveDetail(int id) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/leaves/$id"));
      if (response.statusCode == 200) {
        leaveDetail = jsonDecode(response.body);
        update(); 
      } else {
         SnackbarUtil.showError("Failed to fetch leave detail.");
      }
    } catch (e) {
      SnackbarUtil.showError("Error fetching leave detail: $e");
    }
  }
   Future<void> updateLeaveStatus(int leaveId, String status) async {
  final url = Uri.parse('$baseUrl/leaves/status/$leaveId');

  // Get token from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('auth_token');

  if (token == null) {
    SnackbarUtil.showError('No auth token found');
    return;
  }

  try {
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'status': status}),
    );

    if (response.statusCode == 200) {
      leaveStatuses[leaveId] = status;
      update(); 
       SnackbarUtil.showSuccess('Leave status updated to $status');
    } else {
      SnackbarUtil.showError('Failed to update status');
    }
  } catch (e) {
     SnackbarUtil.showError('API call failed: $e');
  }
}

}
