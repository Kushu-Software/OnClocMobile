const String jobCardGenresTable = 'job_Card_Genres';

class JobCardGenre {
  final int id;
  final String name;
  final String description;
  final String colourCode;

  JobCardGenre({
    required this.id,
    required this.name,
    this.description = '',
    this.colourCode = '',
  });

  factory JobCardGenre.fromMap(Map<String, dynamic> map) {
    return JobCardGenre(
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