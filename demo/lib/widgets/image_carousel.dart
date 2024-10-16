import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<dynamic> imageList; // Image data structure
  final bool isLoading;
  final bool isSearchLoading;
  final VoidCallback onFetchImages; // Callback for fetching images

  ImageCarousel({
    required this.imageList,
    required this.isLoading,
    required this.isSearchLoading,
    required this.onFetchImages, // Add the callback parameter
  });

  @override
  Widget build(BuildContext context) {
     return Expanded(
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
                              onFetchImages; 
                            }
                          },
                        ),
                      ),
          );
  }
}
  //   return Expanded(
  //     child: isSearchLoading || isLoading
  //         ? Center(child: CircularProgressIndicator())
  //         : imageList.isEmpty
  //             ? Center(child: Text('No images found'))
  //             : CarouselSlider.builder(
  //                 itemCount: imageList.length,
  //                 itemBuilder: (context, index, realIdx) {
  //                   final image = imageList[index];
                  

  //                   return Column(
  //                     children: [
  //                       // Display image details
  //                       Container(
  //                         padding: EdgeInsets.all(8.0),
  //                         decoration: BoxDecoration(
  //                           color: Colors.white.withOpacity(0.7),
  //                           borderRadius: BorderRadius.circular(8.0),
  //                         ),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             // Display user name and profile image
  //                             Row(
  //                               children: [
  //                                 CircleAvatar(
  //                                   backgroundImage: NetworkImage(user['profile_image']['small']),
  //                                 ),
  //                                 SizedBox(width: 8.0),
  //                                 Text(
  //                                   user['name'] ?? 'Unknown',
  //                                   style: TextStyle(fontWeight: FontWeight.bold),
  //                                 ),
  //                               ],
  //                             ),
  //                             SizedBox(height: 4.0),
  //                             // Additional user information
  //                             Text('Username: ${user['username']}'),
  //                             Text('Bio: ${user['bio'] ?? 'No bio available'}'),
  //                             Text('Total Photos: ${user['total_photos']}'),
  //                             Text('Created At: ${createdAt.substring(0, 10)}'),
  //                           ],
  //                         ),
  //                       ),
  //                       SizedBox(height: 8.0),
  //                       // Display the image
  //                       Image.network(
  //                         imageUrl,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ],
  //                   );
  //                 },
  //                 options: CarouselOptions(
  //                   height: 400,
  //                   autoPlay: true,
  //                   enlargeCenterPage: true,
  //                   onPageChanged: (index, reason) {
  //                     if (index == imageList.length - 1 && !isLoading) {
  //                       onFetchImages(); // Use the callback here
  //                     }
  //                   },
  //                 ),
  //               ),
  //   );
  // }

