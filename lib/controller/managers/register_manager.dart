import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/core/auth_model.dart';
import '../../model/core/basic_response_model.dart';
import '../../model/core/branches_model.dart';
import '../../model/core/patient_list_model.dart';
import '../../model/core/treatments_model.dart';
import '../../model/core/update_user_model.dart';
import '../../model/helper/service_locator.dart';
import '../../view/theme/constants.dart';
import '../services/api_endpoints.dart';
import '../services/dio_service.dart';
import 'dart:io';

class RegisterManager extends ChangeNotifier{

  List<Treatments> treatments = [];
  List<Branches> branches = [];
  List<BasicItem> locations = [];
  // String? selectedpayMethode;
  UpdateUserModel  userModel= UpdateUserModel(addedTreatmentItems: []) ;

  // List<AddedTreatmentItem> addedTreatmentItems=[];

  changePayMethode(String val){
    userModel.payment = val;

    notifyListeners();
  }

  setUserModel(UpdateUserModel val){
    userModel = val;

    notifyListeners();
  }
  addTreatment(AddedTreatmentItem val){
    userModel.addedTreatmentItems!.add(val);
    notifyListeners();
  }

  setLocation(BasicItem val){
    userModel.location =val;
    notifyListeners();
  } setBranch(BasicItem val){
    userModel.branch =val;
    notifyListeners();
  } setDate(String val){
    userModel.dateNdTime =val;
    notifyListeners();
  }
  setHour(BasicItem val){
    userModel.hour = val;
    notifyListeners();
  }setMinute(BasicItem val){
    userModel.minute = val;
    notifyListeners();
  }

  getBranchList()async{

  String endpoint = Endpoints.branchList;
String? token = getIt<SharedPreferences>().getString(StringConstants.token);

dynamic responseData = await getIt<DioClient>().get(endpoint,token);



  if(responseData!=null){
    BrachesModel result  = BrachesModel.fromJson(responseData);
    branches = result.branches??[];
    locations = branches.map((e)=>BasicItem(name: e.location)).toList();
    notifyListeners();
  }

   else{
     // return PatientListModel(status: false,message: "Server Error");
    // patients = [];
   }}






   getTreatments()async{

  String endpoint = Endpoints.treatments;
String? token = getIt<SharedPreferences>().getString(StringConstants.token);

dynamic responseData = await getIt<DioClient>().get(endpoint,token);



    if(responseData!=null){
      TreatmentsModel result  = TreatmentsModel.fromJson(responseData);
      // branches = result
      treatments = result.treatments??[];
      notifyListeners();
    }
   else{
     // return PatientListModel(status: false,message: "Server Error");
    // patients = [];
   }}


  register(UpdateUserModel um)async{

  String endpoint = Endpoints.patientUpdate;
String? token = getIt<SharedPreferences>().getString(StringConstants.token);

  Map<String,dynamic> data = {
    "name":um.name,
    "excecutive":um.excecutive,
    "payment":um.payment,
    "phone":um.phone,
    "address":um.address,
    "total_amount":um.totalAmount,
    "discount_amount":um.discountAmount,
    "advance_amount":um.advanceAmount,
    "balance_amount":um.balanceAmount,
    "date_nd_time":um.dateNdTime,
    "id":um.id,
    "male":um.addedTreatmentItems!.map((e) {
      if(e.male!=0){
        return e.id;
      }

    }).toList().whereType<int>().toList(),

    "female":um.addedTreatmentItems!.map((e) {
  if(e.female!=null&&e.female!>0){
  return e.id;
  }

  }).toList().whereType<int>().toList(),
    "branch":um.branch?.name??"",
    "treatments":um.addedTreatmentItems!.map((e) =>e.id).toList(),

  };

  print("data");
  print(data);


dynamic responseData = await getIt<DioClient>().post(endpoint,data,token);



    if(responseData!=null){
      TreatmentsModel result  = TreatmentsModel.fromJson(responseData);
      // branches = result
      treatments = result.treatments??[];
      notifyListeners();
    }
   else{
     // return PatientListModel(status: false,message: "Server Error");
    // patients = [];
   }}














 }






