const String jobCardGroupsTable = 'job_Card_Groups';

class JobCardGroup {
  final int id;
  final String name;
  final String description;
  final String colourCode;

  JobCardGroup({
    required this.id,
    required this.name,
    this.description = '',
    this.colourCode = '',
  });

  factory JobCardGroup.fromMap(Map<String, dynamic> map) {
    return JobCardGroup(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      colourCode: map['colourCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'colourCode': colourCode,
    };
  }
}