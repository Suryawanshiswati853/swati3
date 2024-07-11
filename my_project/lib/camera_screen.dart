import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:gallery_saver/gallery_saver.dart';



class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
    File? _videoFile;
      VideoPlayerController? _videoPlayerController;
        String? _errorMessage;

  Future<void> _captureImage() async {
    final pickedFile=await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile!=null) {
        _imageFile=File(pickedFile.path);
         _videoFile = null; 
        _errorMessage = null;
         GallerySaver.saveImage(pickedFile.path).then((bool? success) {
          setState(() {
            print('image saved to gallery: $success');
          });
        });
        
      }else{
         print('No image captured.');

      }
    });
   
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
         _videoFile = null; 
        _errorMessage = null;
      } else {
        print('No image selected.');
      }
    });
  }
  Future<void> _recordVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _videoFile = File(pickedFile.path);
        _imageFile = null; 
        _initializeVideoPlayer();
        _errorMessage = null;
         GallerySaver.saveVideo(pickedFile.path).then((bool? success) {
          setState(() {
            print('Video saved to gallery: $success');
          });
        });
      } else {
        print('No image save.');
      }
    });
  }


  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (pickedFile.path.endsWith(".mp4") || pickedFile.path.endsWith(".mov") || pickedFile.path.endsWith(".avi")) {
          _videoFile = File(pickedFile.path);
          _imageFile = null;
          _initializeVideoPlayer();
          _errorMessage = null;
        } else {
          _errorMessage = "Please select a video file, not an image.";
        }
      } else {
        print('No video selected.');
      }
    });
  }


void _initializeVideoPlayer(){
  if(_videoFile!=null){
    _videoPlayerController=VideoPlayerController.file(_videoFile!)..initialize().then((_) => setState(() {
      _videoPlayerController!.play();
    }));
  }
}
@override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text('image and video picker ',style: TextStyle(color: Colors.white,fontSize: 15),),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_outlined,color: Colors.white,),
            onPressed: () {
              _captureImage();
            },
          ),
          IconButton(
            icon: const Icon(Icons.image_sharp,color: Colors.white,),
            onPressed: () {
              _pickImage();
            },
          ),
          //  IconButton(
          //   icon: const Icon(Icons.videocam_rounded,color: Colors.white,),
          //   onPressed: () {
          //    // _captureImage();
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.video_p,color: Colors.white,),
          //   onPressed: () {
          //    // _pickImage();
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           
                    if (_imageFile != null)
                    Center(
          child:     Container(
                height: 100,
                width: 150,
                child: Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                ),
              ))
            else
            Center(
           child:    Container(
                height: 100,
                width: 150,
                color: Colors.grey[200],
                child: const Center(
                  child: Text('No image selected.'),
                ),
              ),
            ),
                 
                    const SizedBox(height: 10),
                    if(_videoFile!=null&&_videoPlayerController!=null&&
                    _videoPlayerController!.value.isInitialized)
                     Container(
                height: 150,
                width: 200,
                child: AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController!),
                ),
              )
              else
              Container(
                height: 100,
                width: 150,
                color: Colors.grey[200],
                child: const Center(
                  child: Text('No video selected.'),
                ),
              ),
              const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _recordVideo,
              child: const Text('Record Video'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickVideo,
              child: const Text('Pick Video from Gallery'),
            ),


        ],
        ),
      ),
    );
  }
}


