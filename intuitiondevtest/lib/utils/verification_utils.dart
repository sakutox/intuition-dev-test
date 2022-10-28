import 'package:fluttertoast/fluttertoast.dart';

class VerificationUtils{
  static bool emailVerification(String email) {
    RegExp exp = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
    bool flag = false;
    if (exp.hasMatch(email) == false) {
      Fluttertoast.showToast(msg: 'Invalid email');
    } else {
      flag = true;
    }
    return flag;
  }

  static bool nameVerification(String name) {
    bool flag = false;
    
    if (RegExp(r"^[\p{L} ,.'-]*$",
            caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(name)) {
      flag = true;
    }

    return flag;
  }
}