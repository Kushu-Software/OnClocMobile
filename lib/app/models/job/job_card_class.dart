const String jobCardClassesTable = 'job_Card_Classes';

class JobCardClass {
  final int id;
  final String name;
  final String description;
  final String colourCode;

  JobCardClass({
    required this.id,
    required this.name,
    this.description = '',
    this.colourCode = '',
  });

  factory JobCardClass.fromMap(Map<String, dynamic> map) {
    return JobCardClass(
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