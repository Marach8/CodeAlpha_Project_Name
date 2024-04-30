import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class CategoryModel{
  String id,
  name,
  image,
  parentId;
  bool featured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = emptyString,
    required this.featured
  });

  factory CategoryModel.empty() => 
    CategoryModel(
      id: emptyString,
      name: emptyString,
      image: emptyString,
      featured: false
    );

  Map<String, dynamic> toJson() => {
    'featured': featured,
    'name': name,
    'image': image,
    'parentId': parentId
  };

  factory CategoryModel.fromJsonSnapshot(DocumentSnapshot<Map<String, dynamic>> jsonSnapshot){
    final json = jsonSnapshot.data();
    final id = jsonSnapshot.id;
      
    if(json != null){
      return CategoryModel(
        id: id,
        featured: json['featured'],
        name: json['name'],
        image: json['image'],
        parentId: json['parentId']
      );
    }
    else{
      return CategoryModel.empty();
    }
  }
}