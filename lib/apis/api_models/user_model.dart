class UserModel {
  String? message;
  String? token;
  UserData? userData;
  String? status;

  UserModel({this.message, this.token, this.userData, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class UserData {
  String? id;
  String? userName;
  String? companyName;
  String? mobile;
  String? gender;
  String? dob;
  String? image;
  String? email;
  String? otp;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? countryCode;
  String? checkOutType;
  String? checkInOutStatus;

  UserData(
      {this.id,
        this.userName,
        this.companyName,
        this.mobile,
        this.gender,
        this.dob,
        this.image,
        this.email,
        this.otp,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.countryCode,
        this.checkOutType,
        this.checkInOutStatus});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    companyName = json['company_name'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    email = json['email'];
    otp = json['otp'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryCode = json['country_code'];
    checkOutType = json['check_out_type'];
    checkInOutStatus = json['check_in_out_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['company_name'] = companyName;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['dob'] = dob;
    data['image'] = image;
    data['email'] = email;
    data['otp'] = otp;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['country_code'] = countryCode;
    data['check_out_type'] = checkOutType;
    data['check_in_out_status'] = checkInOutStatus;
    return data;
  }
}

