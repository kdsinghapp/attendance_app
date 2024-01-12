import 'package:flutter/services.dart';

class FormValidator {
  static String? isEmailValid({required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter email";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  static String? isNameValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter name";
    } else if (!RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(value)) {
      return "Please enter valid name";
    } else if (value.trim().length > 20) {
      return "Name length less than twenty";
    } else {
      return null;
    }
  }

  static String? isNumberValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter number";
    } else if (value.trim().length!=10) {
      return "Please enter valid 10 digit phone number";
    } else {
      return null;
    }
  }

  static String? isEmptyValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "This field is required !";
    } else {
      return null;
    }
  }
  static String? isLoginNumberValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter number";
    } else {
      return null;
    }
  }


  static String? isLoginPasswordValid(
      {required String? value,}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter password";
    } else {
      return null;
    }
  }

  static String? isPineCodeValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter pin code";
    } else if (value.trim().length < 6 || value.trim().length > 6) {
      return "Please enter valid pin code";
    } else if (!RegExp('^[1-9][0-9]{5}\$').hasMatch(value)) {
      return "Please enter valid pin code";
    } else {
      return null;
    }
  }

  static String? isPasswordValid(
      {required String? value, String? password = "Not"}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter password";
    } else if (value.trim().length < 6) {
      return "Password length greater than six";
    } else if (value.trim().length > 12) {
      return "Password length less than twelve";
    } else if (!RegExp("^(?=.*[a-z])").hasMatch(value)) {
      return "Password contain at least one lowercase";
    } else if (!RegExp("^(?=.*[A-Z])").hasMatch(value)) {
      return "Password contain at least one uppercase";
    } 
    // else if (!RegExp("^(?=.*[@#\$%^&+=]).*\$").hasMatch(value)) {
    //   return "Password contain at least one special character";
    // }
    else if (!RegExp("^(?=.*[0-9])").hasMatch(value)) {
      return "Password contain at least one numeric character";
    } else if ((password?.trim().toString() != "Not")) {
      if (password?.trim().toString() == value.trim().toString()) {
        return null;
      } else {
        return "Please enter correct password";
      }
    } else {
      return null;
    }
  }

  static String? isConfirmPasswordValid(
      {required String? value, String? password = "Not"}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter password";
    } else if ((password?.trim().toString() != "Not")) {
      if (password?.trim().toString() == value.trim().toString()) {
        return null;
      } else {
        return "Password not match";
      }
    } else {
      return null;
    }
  }

  static isDob({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter Date Of Birth";
    } else {
      RegExp dateRegex = RegExp(r'^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)');
      RegExpMatch? match = dateRegex.firstMatch(value);
      if (match != null) {
        return null;
      } else {
        return "Please enter correct Date Of Birth";
      }
    }
  }


  static isAddressValid({required String? value, required String content}) {

    if (value == null || value.toString().trim().isEmpty) {
      return "Please enter $content";
    }
    else{
      return null;
    }
  }

  static isDobForYYYYMMDD({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter Date Of Birth";
    } else {
      RegExp dateRegex = RegExp(r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$');
      RegExpMatch? match = dateRegex.firstMatch(value);
      if (match != null) {
        return null;
      } else {
        return "Please enter correct Date Of Birth";
      }
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}
String capitalize(String value) {
  if(value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";

}
