import 'package:demo2/another_app_screen/login_page.dart';
import 'package:demo2/another_app_screen/user_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<List<DocumentSnapshot>> getAllUsers() async {
    QuerySnapshot snapshot = await _firestore.collection('users').get();
    return snapshot.docs;
  }
  Future<void> loginUser(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    Fluttertoast.showToast(
      msg: "Login successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
       Navigator.push(context, MaterialPageRoute(builder: (context)=>UserListPage()));

   
  } on FirebaseAuthException catch (e) {
    String errorMessage = 'An error occurred. Please try again.';
    if (e.code == 'invalid-credential') {
      errorMessage = 'Invalid credentials. Please check your email and password.';
    } else {
      errorMessage = 'Authentication failed: ${e.message}';
    }
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.red,
      fontSize: 16.0,
    );
  } catch (e) {
    print('Error: $e');
    Fluttertoast.showToast(
      msg: "An unexpected error occurred. Please try again later.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.red,
      fontSize: 16.0,
    );
  }
}
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );  
    

    } catch (e) {
      Fluttertoast.showToast(
      msg: 'Failed to sign out',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.red,
      fontSize: 16.0,
    );
     
      print('Failed to sign out: $e');
    }
  }
  Stream<User?> get authStateChanges => _auth.authStateChanges();
    Future<void> addUser(BuildContext context, String name, String email, String mobile, String address,String password) async {
    try {
       QuerySnapshot emailQuerySnapshot = await _firestore.collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (emailQuerySnapshot.docs.isNotEmpty) {
      Fluttertoast.showToast(
        msg: "A user with this email already exists",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.red,
        fontSize: 16.0,
      );
      return; 
    }
    QuerySnapshot mobileQuerySnapshot = await _firestore.collection('users')
        .where('mobile no', isEqualTo: mobile)
        .get();

    if (mobileQuerySnapshot.docs.isNotEmpty) {
      Fluttertoast.showToast(
        msg: "A user with this mobile number already exists",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.red,
        fontSize: 16.0,
      );
      return; 
    }
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
   
    
      await _firestore.collection('users').add({
        'name': name,
        'email': email,
        'mobile no': mobile,
        'address': address,
        'password':password
      });
       Fluttertoast.showToast(
        msg: "User added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));


    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to add user",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.red,
        fontSize: 16.0,
      );
      print('Failed to add user: $e');
      return null;
    }
  }
  Future<void> editUser(BuildContext context, String userId, String name, String email, String mobile, String address) async {
  try {
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
    Map<String, dynamic> currentData = userDoc.data() as Map<String, dynamic>;

    bool hasChanged = false;
    if (currentData['name'] != name ||
        currentData['email'] != email ||
        currentData['mobile no'] != mobile ||
        currentData['address'] != address) {
      hasChanged = true;
    }

    if (!hasChanged) {
      Fluttertoast.showToast(
        msg: "No changes were made",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserListPage()));

      
      return; 
    }

    await _firestore.collection('users').doc(userId).update({
      'name': name,
      'email': email,
      'mobile no': mobile,
      'address': address,
    });

    Fluttertoast.showToast(
      msg: "User updated successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserListPage()));

  } catch (e) {
    Fluttertoast.showToast(
      msg: "Failed to update user",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.red,
      fontSize: 16.0,
    );
    print('Failed to edit user: $e');
    throw e;
  }
}
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      print('Failed to delete user: $e');
      throw e;
    }
  }
}

