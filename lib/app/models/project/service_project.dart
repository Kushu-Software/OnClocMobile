const String serviceProjectsTable = 'service_Projects';

class ServiceProject {
  final int id;
  final String name;
  final String description;

  ServiceProject({
    required this.id,
    required this.name,
    this.description = '',
  });

  factory ServiceProject.fromMap(Map<String, dynamic> map) {
    return ServiceProject(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}