import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import 'package:task_demo/newapp/screens/search_history.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String accessKey = 'mq-YMpqcQuiVdu2b27l7xo1oUG4msGpKRoy-oL3KTTc';
  TextEditingController searchController = TextEditingController();
  List<String> imageList = [];
  bool isLoading = false;
  bool isSearchLoading = false;
  int currentPage = 1;
  String? lastQuery;
  
  @override
  void initState() {
    super.initState();
    fetchImages(); // Load initial images when the app starts
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchImages() async {
    if (isLoading) return; // Prevent multiple calls if already loading

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse(
            'https://api.unsplash.com/photos?page=$currentPage&per_page=10&client_id=$accessKey'),
      );

      if (response.statusCode == 200) {
        final List fetchedImages = jsonDecode(response.body);
        setState(() {
          imageList.addAll(fetchedImages.map((img) => img['urls']['regular'] as String).toList());
          currentPage++;
        });
      } else {
        handleError(response);
      }
    } catch (error) {
      handleError(null);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  Future<void> searchImages(String query) async {
  if (query.isEmpty) return;

  setState(() {
    isSearchLoading = true;
    imageList.clear(); // Clear previous images
    currentPage = 1; // Reset pagination
    lastQuery = query; // Store last query for history
  });

  try {
    final response = await http.get(
      Uri.parse(
          'https://api.unsplash.com/search/photos?query=$query&per_page=10&client_id=$accessKey'),
    );

    if (response.statusCode == 200) {
      final List searchResults = jsonDecode(response.body)['results'];
      setState(() {
        imageList = [];

        for (var img in searchResults) {
          String imageUrl = img['urls']['regular'];
          String createdAt = img['created_at'];
          print('Image URL: $imageUrl, Created At: $createdAt');
          imageList.add(imageUrl);
          
        }
      });
                storeSearchQuery(query);

    } else {
      handleError(response);
    }
  } catch (error) {
    handleError(null);
  } finally {
    setState(() {
      isSearchLoading = false;
    });
  }
}




  Future<void> storeSearchQuery(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId != null) {
      await FirebaseFirestore.instance.collection('searchHistory').add({
        'query': query,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': userId, 
      });
    } else {
      print("User ID not found");
    }
  }

Future<List<String>> getSearchHistory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId');

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

    // Map the Firestore documents to a list of search queries
    List<String> searchHistory = querySnapshot.docs.map((doc) => doc['query'] as String).toList();

    // Print the search history in the console
    print("Fetched search history: $searchHistory");

    return searchHistory;
  } catch (e) {
    print("Error fetching search history: $e");
    return [];
  }
}


  void handleError(http.Response? response) {
    String message = response != null
        ? 'Error: ${response.statusCode}, ${response.body}'
        : 'Error loading data';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Unsplash Carousel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history), // History icon
            onPressed: () {
              // Navigate to the search history screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchHistoryScreen()),
              );
            },
          ),

      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onSubmitted: (query) => searchImages(query),
              decoration: InputDecoration(
                hintText: 'Search Images',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    fetchImages(); 
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
         
          Expanded(
            child: isSearchLoading || isLoading
                ? const Center(child: CircularProgressIndicator())
                : imageList.isEmpty
                    ? const Center(child: Text('No images found'))
                    : CarouselSlider.builder(
                        itemCount: imageList.length,
                        itemBuilder: (context, index, realIdx) {
                          return Image.network(
                            imageList[index],
                            fit: BoxFit.cover,
                          );
                        },
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            if (index == imageList.length - 1 && !isLoading) {
                              fetchImages(); 
                            }
                          },
                        ),
                      ),
          ),
        
        ],
      ),
    );
  }
}





