class TreatmentsModel {
  bool? status;
  String? message;
  List<Treatments>? treatments;

  TreatmentsModel({this.status, this.message, this.treatments});

  TreatmentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['treatments'] != null) {
      treatments = <Treatments>[];
      json['treatments'].forEach((v) {
        treatments!.add(new Treatments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.treatments != null) {
      data['treatments'] = this.treatments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Treatments {
  int? id;
  // List<Branches>? branches;
  String? name;
  String? duration;
  String? price;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Treatments(
      {this.id,
        // this.branches,
        this.name,
        this.duration,
        this.price,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Treatments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // if (json['branches'] != null) {
    //   branches = <Branches>[];
    //   json['branches'].forEach((v) {
    //     branches!.add(new Branches.fromJson(v));
    //   });
    // }
    name = json['name'];
    duration = json['duration'];
    price = json['price'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // if (this.branches != null) {
    //   data['branches'] = this.branches!.map((v) => v.toJson()).toList();
    // }
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AddedTreatmentItem {
  int? id;
  String? name;
  int? male;
  int? female;


  AddedTreatmentItem(
      {this.id,
        this.name,
        this.male,
        this.female,
      });

  AddedTreatmentItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    male = json['male'];
    female = json['female'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['male'] = this.male;
    data['female'] = this.female;

    return data;
  }
}
