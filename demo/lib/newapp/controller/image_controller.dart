import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_demo/newapp/screens/home_screen.dart';
class ImageController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String accessKey = 'mq-YMpqcQuiVdu2b27l7xo1oUG4msGpKRoy-oL3KTTc'; // Unsplash Access Key
  String? userId; // Variable to store user ID
  bool isLoading = false;
  List<String> imageList = [];
  int currentPage = 1;

  // Function to log in the user and store the user ID in shared preferences
  Future<void> loginUser(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get user ID and store it
      userId = userCredential.user!.uid;

      Fluttertoast.showToast(
        msg: "Login successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );

      // Store login status and user ID in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      prefs.setString('userId', userId!);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
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
        backgroundColor: Colors.black,
        textColor: Colors.red,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "An unexpected error occurred. Please try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.red,
      );
    }
  }

  // Fetch images from Unsplash API
  Future<void> fetchImages(BuildContext context) async {
    if (isLoading) return; // Prevent multiple calls if already loading

    isLoading = true;
    try {
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos?page=$currentPage&per_page=10&client_id=$accessKey'),
      );

      if (response.statusCode == 200) {
        final List fetchedImages = jsonDecode(response.body);
        imageList.addAll(fetchedImages.map((img) => img['urls']['regular'] as String).toList());
        currentPage++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load images')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading images')),
      );
    } finally {
      isLoading = false;
    }
  }

  // Search images by query from Unsplash API
  Future<void> searchImages(BuildContext context, String query) async {
    if (query.isEmpty) return;

    isLoading = true;

    try {
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/search/photos?query=$query&per_page=10&client_id=$accessKey'),
      );

      if (response.statusCode == 200) {
        print('----${response.body}');
        final List searchResults = jsonDecode(response.body)['results'];
        imageList = searchResults.map((img) => img['urls']['regular'] as String).toList();
        storeSearchQuery(query); // Store the search query in Firebase
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Search failed: ${response.statusCode}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during search')),
      );
    } finally {
      isLoading = false;
    }
  }
    Future<void> storeSearchQuery(String query) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId'); // Retrieve the stored user ID

  if (userId != null) {
    await FirebaseFirestore.instance.collection('searchHistory').add({
      'query': query,
      'timestamp': FieldValue.serverTimestamp(),
      'userId': userId, // Store the user ID with the query
    });
  } else {
    // Handle the case where the userId is null (e.g., log an error)
    print("User ID not found");
  }
}



  // Fetch search history from Firebase Firestore
  Future<List<String>> getSearchHistory() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('searchHistory')
        .orderBy('timestamp', descending: true)
        .limit(5)
        .get();

    return querySnapshot.docs.map((doc) => doc['query'] as String).toList();
  }
}


