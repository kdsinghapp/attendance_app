class GetPrivacyPolicyModel {
  List<GetPrivacyPolicyResult>? result;
  String? message;
  String? status;

  GetPrivacyPolicyModel({this.result, this.message, this.status});

  GetPrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetPrivacyPolicyResult>[];
      json['result'].forEach((v) {
        result!.add(GetPrivacyPolicyResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetPrivacyPolicyResult {
  String? id;
  String? name;
  String? description;

  GetPrivacyPolicyResult({this.id, this.name, this.description});

  GetPrivacyPolicyResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
