


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

   case "String":
    return null;

   default:
    return null;
  }
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
  // }'




 getFormattedDate(String dt){
  DateTime date = DateTime.parse(dt);
  // Format the date using intl package
  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  return formattedDate;
 }

 }





