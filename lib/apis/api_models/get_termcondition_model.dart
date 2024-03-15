class GetTermConditionModel {
  List<GetTermConditionResult>? result;
  String? message;
  String? status;

  GetTermConditionModel({this.result, this.message, this.status});

  GetTermConditionModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetTermConditionResult>[];
      json['result'].forEach((v) {
        result!.add(GetTermConditionResult.fromJson(v));
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

class GetTermConditionResult {
  String? id;
  String? name;
  String? description;

  GetTermConditionResult({this.id, this.name, this.description});

  GetTermConditionResult.fromJson(Map<String, dynamic> json) {
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
