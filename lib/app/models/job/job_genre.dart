const String jobGenresTable = 'job_genres';

class JobGenreFields {
  static final List<String> values = [
    jobGenreId,
    name,
    description,
    colourCode,
  ];

  static final String jobGenreId = 'jobGenreId';
  static final String name = 'name';
  static final String description = 'description';
  static final String colourCode = 'colourCode';
}

class JobGenre {
  final int jobGenreId;
  final String name;
  final String description;
  final String colourCode;

  JobGenre({
    required this.jobGenreId,
    required this.name,
    this.description = '',
    this.colourCode = '',
  });

  factory JobGenre.fromJson(Map<String, dynamic> json) {
    return JobGenre(
      jobGenreId: json['jobGenreId'],
      name: json['name'],
      description: json['description'],
      colourCode: json['colourCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobGenreId': jobGenreId,
      'name': name,
      'description': description,
      'colourCode': colourCode,
    };
  }
}
