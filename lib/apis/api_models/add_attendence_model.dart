class AddAttendanceModel {
  String? attendenceId;
  String? attendenceHourId;
  String? message;
  String? status;

  AddAttendanceModel(
      {this.attendenceId, this.attendenceHourId, this.message, this.status});

  AddAttendanceModel.fromJson(Map<String, dynamic> json) {
    attendenceId = json['attendence_id'];
    attendenceHourId = json['attendence_hour_id'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendence_id'] = attendenceId;
    data['attendence_hour_id'] = attendenceHourId;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}


