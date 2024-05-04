import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class BannerModel{
  String imageUrl;
  final String targetScreen;
  final bool isActive;

  BannerModel({
    required this.targetScreen,
    required this.isActive,
    this.imageUrl = emptyString
  });


  Map<String, dynamic> toJson() => {
    'imageUrl': imageUrl,
    'targetScreen': targetScreen,
    'isActive': isActive
  };


  factory BannerModel.fromJsonSnapshot({
    required DocumentSnapshot jsonSnapshot
  }) {
    final jsonData = jsonSnapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: jsonData['imageUrl'],
      targetScreen: jsonData['targetScreen'],
      isActive: jsonData['isActive']
    );
  }
}