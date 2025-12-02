import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryService {
  static final CloudinaryPublic _cloudinary = CloudinaryPublic(
    'YOUR_CLOUD_NAME',
    'YOUR_UPLOAD_PRESET',
    cache: false,
  );

  static Future<String> uploadImage(String folderPath, XFile image) async {
    try {
      final response = await _cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          image.path,
          folder: folderPath,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
      return response.secureUrl;
    } catch (e) {
      throw "Cloudinary Upload Failed: $e";
    }
  }
}
