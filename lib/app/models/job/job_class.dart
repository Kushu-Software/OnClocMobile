const String jobClassesTable = 'job_classes';
const String jobClassGroupsTable = 'job_class_groups';

class JobClassFields {
  static final List<String> values = [
    jobClassId,
    name,
    description,
    colourCode,
  ];

  static const String jobClassId = 'jobClassId';
  static const String name = 'name';
  static const String description = 'description';
  static const String colourCode = 'colourCode';
}

class JobClassGroupFields {
  static final List<String> values = [
    id,
    jobClassId,
    jobGroupId,
  ];

  static const String id = 'id';
  static const String jobClassId = 'jobClassId';
  static const String jobGroupId = 'jobGroupId';
}

class JobClass {
  final int jobClassId;
  final String name;
  final String description;
  final String colourCode;

  JobClass({
    required this.jobClassId,
    required this.name,
    this.description = '',
    this.colourCode = '',
  });

  factory JobClass.fromJson(Map<String, dynamic> json) => JobClass(
        jobClassId: json['jobClassId'],
        name: json['name'],
        description: json['description'],
        colourCode: json['colourCode'],
      );

  Map<String, dynamic> toJson() => {
        'jobClassId': jobClassId,
        'name': name,
        'description': description,
        'colourCode': colourCode,
      };
}

class JobClassGroup {
  final int id;
  final int jobClassId;
  final int jobGroupId;

  JobClassGroup({
    required this.id,
    required this.jobClassId,
    required this.jobGroupId,
  });

  factory JobClassGroup.fromJson(Map<String, dynamic> json) => JobClassGroup(
        id: json['id'],
        jobClassId: json['jobClassId'],
        jobGroupId: json['jobGroupId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'jobClassId': jobClassId,
        'jobGroupId': jobGroupId,
      };
}
