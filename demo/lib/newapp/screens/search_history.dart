import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:task_demo/newapp/model/searchhistory_model.dart';

class SearchHistoryScreen extends StatelessWidget {
 
  Future<List<String>> getSearchHistory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId'); // Retrieve the stored user ID

  if (userId == null) {
    print("No user ID found");
    return [];
  }

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('searchHistory')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .limit(5)
        .get();

    List<String> searchHistory = querySnapshot.docs.map((doc) => doc['query'] as String).toList();

    // Print the search history in the console
    print("Fetched search history: $searchHistory");

    return searchHistory;
  } catch (e) {
    print("Error fetching search history: $e");
    return [];
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search History'),
      ),
      body: FutureBuilder<List<String>>(
        future: getSearchHistory(), // Fetch search history
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching search history: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No search history found'));
          }

          List<String> searchHistory = snapshot.data!;
          print('======$searchHistory');
          return ListView.builder(
            itemCount: searchHistory.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchHistory[index]),
              );
            },
          );
        },
      ),
    );
  }
}
