const String serviceProjectsTable = 'service_Projects';

class ServiceProjectFields {
  static final List<String> values = [
    serviceProjectId, name, description
  ];

  static final String serviceProjectId = 'serviceProjectId';
  static final String name = 'name';
  static final String description = 'description';
}

class ServiceProject {
  final int serviceProjectId;
  final String name;
  final String description;

  ServiceProject({
    required this.serviceProjectId,
    required this.name,
    required this.description,
  });

  factory ServiceProject.fromJson(Map<String, dynamic> json) => ServiceProject(
        serviceProjectId: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': serviceProjectId,
        'name': name,
        'description': description,
      };
}
