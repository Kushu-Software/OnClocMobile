const String jobPrioritiesTable = 'job_priorities';

class JobPriorityFields {
  static final List<String> values = [
    jobPriorityId,
    priorityIndex,
    priorityLevel,
    colourCode,
    isDefault,
  ];

  static final String jobPriorityId = 'jobPriorityId';
  static final String priorityIndex = 'priorityIndex';
  static final String priorityLevel = 'priorityLevel';
  static final String colourCode = 'colourCode';
  static final String isDefault = 'isDefault';
}

class JobPriority {
  final int jobPriorityId;
  final int priorityIndex;
  final String priorityLevel;
  final String colourCode;
  final bool isDefault;

  JobPriority({
    required this.jobPriorityId,
    required this.priorityIndex,
    required this.priorityLevel,
    this.colourCode = '',
    this.isDefault = false,
  });

  factory JobPriority.fromJson(Map<String, dynamic> json) => JobPriority(
      jobPriorityId: json['id'],
      priorityIndex: json['priorityIndex'],
      priorityLevel: json['priorityLevel'],
      colourCode: json['colourCode'],
      isDefault: json['isDefault'] == 1,
    );

  Map<String, dynamic> toJson() => {
      'id': jobPriorityId,
      'priorityIndex': priorityIndex,
      'priorityLevel': priorityLevel,
      'colourCode': colourCode,
      'isDefault': isDefault ? 1 : 0,
    };
}
