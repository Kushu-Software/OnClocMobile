import 'package:get/get.dart';

const String jobStatusesTable = 'job_statuses';

class JobStatus {
  final int id;
  final String status;
  final String colourCode;
  final RxBool isSelected;

  JobStatus({
    required this.id,
    required this.status,
    this.colourCode = '',
    bool isSelected = false,
    }) : isSelected = isSelected.obs;

  factory JobStatus.fromJson(Map<String, dynamic> json) {
    return JobStatus(
      id: json['id'],
      status: json['status'],
      colourCode: json['colourCode'],
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'colourCode': colourCode,
      'isSelected': isSelected,
    };
  }
}