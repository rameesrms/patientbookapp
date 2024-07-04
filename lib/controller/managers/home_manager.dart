import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/core/auth_model.dart';
import '../../model/core/basic_response_model.dart';
import '../../model/core/patient_list_model.dart';
import '../../model/helper/service_locator.dart';
import '../../view/theme/constants.dart';
import '../services/api_endpoints.dart';
import '../services/dio_service.dart';
import 'dart:io';

class HomeManager extends ChangeNotifier{

  List<Patient>? patients;


   getPatientList()async{
     if(patients!=null){
       patients = null;
notifyListeners();
     }
  String endpoint = Endpoints.patientList;
String? token = getIt<SharedPreferences>().getString(StringConstants.token);

dynamic responseData = await getIt<DioClient>().get(endpoint,token);



  if(responseData!=null){
    PatientListModel result  = PatientListModel.fromJson(responseData);
    patients = result.patient;
    notifyListeners();
  }
   else{
     // return PatientListModel(status: false,message: "Server Error");
    patients = [];
   }}












 }






