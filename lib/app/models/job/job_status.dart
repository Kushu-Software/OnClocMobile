import 'package:get/get.dart';

const String jobStatusesTable = 'job_Statuses';

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

  factory JobStatus.fromMap(Map<String, dynamic> map) {
    return JobStatus(
      id: map['id'],
      status: map['status'],
      colourCode: map['colourCode'],
      isSelected: map['isSelected'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'colourCode': colourCode,
      'isSelected': isSelected,
    };
  }
}