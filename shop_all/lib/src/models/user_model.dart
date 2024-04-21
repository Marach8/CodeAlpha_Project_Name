import 'dart:collection';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class UserModel extends MapView<String, String>{
  final String userId,
  firstName,
  lastName,
  userName,
  email,
  password,
  phoneNumber,
  displayPicture;

  UserModel({
    required this.userId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email, 
    required this.password,
    required this.phoneNumber,
    required this.displayPicture,
  }): super(
    {
      userIdString: userId,
      userNameString.toLowerCase(): userName,
      firstNameString.toLowerCase(): firstName,
      lastNameString.toLowerCase(): lastName,
      emailString.toLowerCase(): email,
      passwordString.toLowerCase(): password,
      phoneString.toLowerCase(): phoneNumber,
      displayPictureString: displayPicture
    }
  );
}