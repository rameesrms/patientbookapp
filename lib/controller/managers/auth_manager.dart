import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/core/basic_response_model.dart';
import '../../model/helper/service_locator.dart';
import '../../view/theme/constants.dart';
import '../services/api_endpoints.dart';
import '../services/dio_service.dart';
import 'dart:io';

class AuthManager extends ChangeNotifier{


 int loadedWidget = 0;
 String selectedGender="";
 String selectedLang="";
 String countryCode="+91";
 int? otp = 1234;
 List<String>? phNo;


 saveToken(String val){
  getIt<SharedPreferences>().setString(StringConstants.token, val);
 }





  Future<BasicResponseModel> userLogin({required String username, required String pwd})async{

  String endpoint = Endpoints.login;
  Map<String,dynamic> data = {"username":username,"password":pwd,};
  dynamic responseData = await getIt<DioClient>().post(endpoint,data,null);

  var result  = BasicResponseModel.fromJson(responseData);


  if(responseData!=null&&result.status==1){
   return BasicResponseModel();
  }
   else{
     return BasicResponseModel();
   }}












 }






