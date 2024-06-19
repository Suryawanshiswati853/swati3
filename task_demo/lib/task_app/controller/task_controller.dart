import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_demo/components/constants.dart';

class TaskController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<List<DocumentSnapshot>> fetchTasks() async {
    QuerySnapshot snapshot = await _firestore.collection('tasks').get();
    return snapshot.docs;
  }
   Future<void> addTask(String title, String description) async {
    try {
      await _firestore.collection('tasks').add({
        'title': title,
        'description': description,
        'completed': false,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Fluttertoast.showToast(
        msg: "Task added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: blackColour,
        textColor: whiteColour,
        fontSize: 16.0,
      );
    } catch (e) {
      print("Error adding task: $e");
      Fluttertoast.showToast(
        msg: "Failed to add task. Please try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: blackColour,
        textColor: Colors.red,
        fontSize: 16.0,
      );
      throw e; 
    }
  }


  
    Future<void> editTask(String id, String title, String description) async {
    try {
      await _firestore.collection('tasks').doc(id).update({
        'title': title,
        'description': description,
             });
      Fluttertoast.showToast(
        msg: "Task updated successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: blackColour,
        textColor: whiteColour,
        fontSize: 16.0,
      );
    } catch (e) {
      print("Error editing task: $e");
      Fluttertoast.showToast(
        msg: "Failed to update task. Please try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: blackColour,
        textColor: Colors.red,
        fontSize: 16.0,
      );
      throw e; 
    }
  }


  
  Future<void> deleteTask(String id) async {
    await _firestore.collection('tasks').doc(id).delete();
  }

  Future<void> toggleTaskCompletion(String id, bool completed) async {
    await _firestore.collection('tasks').doc(id).update({
      'completed': !completed,
    });
  }
}
