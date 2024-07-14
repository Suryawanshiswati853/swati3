//import 'package:intl/intl.dart';

// //String UserLoginModelToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  int userId;
  String userName;
  String userMobile;
  String userEmail;

  String password;
  String userPassword;
  String role;
  String userCity;
  UserLogin({
    required this.userId,
    required this.userName,
    required this.userMobile,
    required this.userEmail,
    required this.password,
    required this.userPassword,
    required this.role,
    required this.userCity,
  });
  get getuserId => userId;

  set setuserId(final userId) => this.userId = userId;
  get getuserName => userName;

  set setuserName(final userName) => this.userName = userName;

  get getuserMobile => userMobile;

  set setuserMobile(final userMobile) => this.userMobile = userMobile;
  get getuserEmail => userEmail;

  set setuserEmail(final userEmail) => this.userEmail = userEmail;

  get getpassword => password;

  set setpassword(final password) => this.password = password;
  get getuserPassword => userPassword;

  set setuserPassword(userPassword) => this.userPassword = userPassword;
  get getrole => role;

  set setrole(final role) => this.role = role;

  get getuserCity => userCity;

  set setuserCity(final userCity) => this.userCity = userCity;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        userId: json['userId'],
        userEmail: json['userEmail'],
        userName: json['userName'],
        userMobile: json['userMobile'],
        password: json['password'],
        userPassword: json['userPassword'],
        role: json['role'],
        userCity: json['userCity'],
      );

  Map<String, dynamic> toJson() => {
        'userID': userId,
        'userEmail': userEmail,
        'userName': userName,
        'userMobile': userMobile,
        'password': password,
        'userPassword': userPassword,
        'role': role,
        'userCity': userCity,
      };
}
