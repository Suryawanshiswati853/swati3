import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatters.dart';

class UserModel {
  final String id;
   String firstName;
   String lastName;
  final String userName;
  final String email;
   String phoneNumber;
   String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });
  String get fullName=>"$firstName $lastName";
  String get formattedDate=>TFormatter.formatPhoneNumber(phoneNumber);
  static List<String>namePorts(fullName)=>fullName.split(" ");
  static String generateUsername(fullName){
    List<String>namePorts=fullName.split(" ");
    String firstName=namePorts[0].toLowerCase();
        String lastName=namePorts.length> 1 ?namePorts[1].toLowerCase():"";
        String camelCaseUsername="$firstName$lastName";
                String usernamewithPrefix="cwt_$camelCaseUsername";
                return usernamewithPrefix;

  }
  static UserModel empty()=>UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');

  // Convert UserModel → Map (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  // Create UserModel ← Map (from Firestore)
factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();

  if (data != null) {
    return UserModel(
      id: document.id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      userName: data['userName'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
    );
  }

  // return empty user if no data
  return UserModel(
    id: document.id,
    firstName: '',
    lastName: '',
    userName: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );
}

  // CopyWith method (useful for updating specific fields)
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? phoneNumber,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
