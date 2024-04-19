import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

bool passwordIsStrong(String password){
  RegExp passwordRegex = RegExp(r'^(?=.*[!@#\$%^&*()_+\-=\[\]{};:\'"\\|,.<>/?0-9]).{8,}");
  return passwordRegex.hasMatch(password);
}

bool phoneNumberIsOkay(String phoneNumber){
  return phoneNumber.split(emptyString)
    .every((element) => numbers0to9.contains(element)) &&
    phoneNumber.length >= 10;
}

String? validateForm({
  required String? value,
  bool? specialEmailCheck,
  bool? specialpasswordCheck,
  bool? specialPhoneNumberCheck
}){
  if(value == null || value.isEmpty){
    return emptyFieldString;
  }

  else if(specialEmailCheck != null && !value.contains(atSignString)){
    return missingAtSignString;
  }

  else if(specialpasswordCheck != null && !passwordIsStrong(value)){
    return weakPasswordString;
  }

  else if(specialPhoneNumberCheck != null && !phoneNumberIsOkay(value)){
    return invalidPhoneNumberString;
  }

  else{
    return null;
  }
}