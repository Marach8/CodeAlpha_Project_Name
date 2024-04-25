import 'dart:collection';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class UserModel extends MapView<String, String>{
  final String userId,
  firstName,
  lastName,
  userName,
  email,
  phoneNumber,
  displayPicture;
  final String? password;

  UserModel({
    required this.userId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email, 
    this.password,
    required this.phoneNumber,
    required this.displayPicture,
  }): super(
    {
      userIdString.toLowerCase(): userId,
      userNameString.toLowerCase(): userName,
      firstNameString.toLowerCase(): firstName,
      lastNameString.toLowerCase(): lastName,
      emailString.toLowerCase(): email,
      passwordString.toLowerCase(): password ?? emptyString,
      phoneString.toLowerCase(): phoneNumber,
      displayPictureString: displayPicture
    }
  );

  factory UserModel.fromJson(Map<String, dynamic> json)
    => UserModel(
      userId: json[userIdString.toLowerCase()],
      userName: json[userNameString.toLowerCase()],
      firstName: json[firstNameString.toLowerCase()],
      lastName: json[lastNameString.toLowerCase()],
      email: json[emailString.toLowerCase()],
      phoneNumber: json[phoneString.toLowerCase()],
      displayPicture: json[displayPictureString]
    );


  factory UserModel.empty() => UserModel(
      userId: emptyString,
      userName: emptyString,
      firstName: emptyString,
      lastName: emptyString,
      email: emptyString,
      phoneNumber: emptyString,
      displayPicture: emptyString
    );
}