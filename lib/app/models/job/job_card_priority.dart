const String jobCardPrioritiesTable = 'job_Card_Priorities';

class JobCardPriority {
  final int id;
  final int priorityIndex;
  final String priorityLevel;
  final String colourCode;
  final bool isDefault;

  JobCardPriority({
    required this.id,
    required this.priorityIndex,
    required this.priorityLevel,
    this.colourCode = '',
    this.isDefault = false,
  });

  factory JobCardPriority.fromMap(Map<String, dynamic> map) {
    return JobCardPriority(
      id: map['id'],
      priorityIndex: map['priorityIndex'],
      priorityLevel: map['priorityLevel'],
      colourCode: map['colourCode'],
      isDefault: map['isDefault'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'priorityIndex': priorityIndex,
      'priorityLevel': priorityLevel,
      'colourCode': colourCode,
      'isDefault': isDefault ? 1 : 0,
    };
  }
}