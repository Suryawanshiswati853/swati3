class AppConstants {
  static const double appIconsize=25;
  static const String baseUrl = 'http://192.168.67.74:3000';
  //Auth 
  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String forgotPasswordEndpoint = '$baseUrl/auth/forgot-password';
  //http://localhost:3000/auth/reset-password
   static const String resetPasswordEndpoint = '$baseUrl/auth/reset-password';


  // Employee Endpoints
  static const String employeesEndpoint = '$baseUrl/employees';
  static const String employeesPresentEndpoint = '$baseUrl/employees/present';
  static const String employeesaddEndpoint = '$baseUrl/employees/add';
  static const String employeesEditEndpoint = '$baseUrl/employees/edit';

  //Leaves Endpoints
    static const String leavesEndpoint = '$baseUrl/api/leaves';
    static String leaveSummary(int employeeId) {
  return '$baseUrl/leaves/summary?employee_id=$employeeId';
}
 static String leavesByEmployee(int employeeId) {
    return '$baseUrl/leaves/by-employee?employee_id=$employeeId';
  }
  static String fetchLeaveDetail(int id) {
    return '$baseUrl/leaves/$id'; //http://localhost:3000/auth/login
  }




}
