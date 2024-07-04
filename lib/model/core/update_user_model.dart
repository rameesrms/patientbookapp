import 'package:interview_task/model/core/basic_response_model.dart';
import 'package:interview_task/model/core/basic_response_model.dart';
import 'package:interview_task/model/core/basic_response_model.dart';
import 'package:interview_task/model/core/treatments_model.dart';

class UpdateUserModel {
  String? name;
  String? excecutive;
  String? payment;
  String? phone;
  String? address;
  double? totalAmount;
  double? discountAmount;
  double? advanceAmount;
  double? balanceAmount;
  String? dateNdTime;
  BasicItem? hour;
  BasicItem? minute;
  BasicItem? location;
  String? id;
  List<AddedTreatmentItem>? addedTreatmentItems;

  BasicItem? branch;

  UpdateUserModel(
      {this.name,
        this.excecutive,
        this.payment,
        this.phone,
        this.location,
        this.address,
        this.totalAmount,
        this.discountAmount,
        this.advanceAmount,
        this.balanceAmount,
        this.dateNdTime,
        this.id,
        this.addedTreatmentItems,
        this.branch,
        });

  // UpdateUserModel.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   excecutive = json['excecutive'];
  //   payment = json['payment'];
  //   phone = json['phone'];
  //   address = json['address'];
  //   totalAmount = json['total_amount'];
  //   discountAmount = json['discount_amount'];
  //   advanceAmount = json['advance_amount'];
  //   balanceAmount = json['balance_amount'];
  //   dateNdTime = json['date_nd_time'];
  //   id = json['id'];
  //
  //   branch = json['branch'];
  //
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['excecutive'] = this.excecutive;
  //   data['payment'] = this.payment;
  //   data['phone'] = this.phone;
  //   data['address'] = this.address;
  //   data['total_amount'] = this.totalAmount;
  //   data['discount_amount'] = this.discountAmount;
  //   data['advance_amount'] = this.advanceAmount;
  //   data['balance_amount'] = this.balanceAmount;
  //   data['date_nd_time'] = this.dateNdTime;
  //   data['id'] = this.id;
  //
  //
  //   data['branch'] = this.branch;
  //
  //   return data;
  // }
}
