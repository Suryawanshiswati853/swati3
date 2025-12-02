import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String ParentId;
  bool isFeatured;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
     this.ParentId='',
    required this.isFeatured,
  });
  static CategoryModel empty()=>
      CategoryModel(id: '', name: '', image: '', ParentId: '', isFeatured: false);
 
   
        Map<String, dynamic> toJson() {
          return{
        'name': name,
        'image': image,
        'ParentId':ParentId,
        'isFeatured':isFeatured,
      };
      
 
}
factory CategoryModel.fromSnapshot(DocumentSnapshot <Map<String,dynamic>> document){
    if(document.data()!=null){
      final data=document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        ParentId: data['ParentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    }else{
      return CategoryModel.empty();
    }
    
  }
// CategoryModel fromJson(Map<String, dynamic> json) =>
//       CategoryModel(
//         id: json['id'] ?? '',
//         name: json['name'] ?? '',
//         image: json['image'] ?? '',
//         ParentId: json['ParentId'] ?? '',
//         isFeatured: json['isFeatured'] ?? false,
//       );
}