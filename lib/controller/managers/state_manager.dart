


import 'package:flutter/material.dart';

class StateManager extends ChangeNotifier{

// bool startAnimation = false;
bool showPass = false;
// int consultTabIndex=0;



showPwd(bool val){
 showPass = val;
 notifyListeners();
}

// dispose animationVariable

 String? validateFieldValues(String val, String type) {
  switch (type) {
   case "int":
    return int.tryParse(val) == null ? "Invalid input" : null;
  // break;
   case "double":
    return double.tryParse(val) == null ? "Invalid input" : null;

   case "char":
    return null;

   default:
    return null;
  }
 }


 bool isValidBloodGroup(String bloodGroup) {
  // Regular expression pattern for blood groups (e.g., A+, AB-, etc.)
  RegExp regex = RegExp(r'^[ABO][+-]$');

  // Check if the entered blood group matches the pattern
  if (regex.hasMatch(bloodGroup)) {
   return true;
  } else {
   return false;
  }
 }

 bool isValidBloodPressure(String bp) {
  // Regular expression pattern for blood groups (e.g., A+, AB-, etc.)
  // RegExp regex = RegExp(r'^[ABO][+-]$');
  List<String> bpParts = bp.split('/');
  if (bpParts.length == 2 && double.tryParse(bpParts[0]) != null &&
      double.tryParse(bpParts[1]) != null) {
   return true;
  } else {
   return false;
  }


  // removeLastIfZero(String str){
  //   if (str != null && str.length > 0 ) {
  //
  //     var st = str.substring(str.length-1);
  //     if(st == "0"){
  //       str = str.substring(0, str.length - 1);
  //
  //     }
  //   }
  //   return str;
  // }


  // Future<bool> checkInternetConnection() async {
  //  var connectivityResult = await Connectivity().checkConnectivity();
  //  return connectivityResult != ConnectivityResult.none;
  // }
 }

 //
 // getFormattedDate(String dt){
 //  DateTime date = DateTime.parse(dt);
 //  // Format the date using intl package
 //  String formattedDate = DateFormat.yMMMMd().format(date);
 //  return formattedDate;
 // }



}
