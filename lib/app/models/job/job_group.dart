const String jobGroupsTable = 'job_groups';
const String jobGroupGenresTable = 'job_group_genres';

class JobGroupFields {
  static final List<String> values = [
    jobGroupId,
    name,
    description,
    colourCode,
  ];

  static final String jobGroupId = 'id';
  static final String name = 'name';
  static final String description = 'description';
  static final String colourCode = 'colourCode';
}

class JobGroupGenreFields {
  static final List<String> values = [
    id,
    jobGroupId,
    jobGenreId,
  ];

  static final String id = 'id';
  static final String jobGroupId = 'jobGroupId';
  static final String jobGenreId = 'jobGenreId';
}

class JobGroup {
  final int jobGroupId;
  final String name;
  final String description;
  final String colourCode;

  JobGroup({
    required this.jobGroupId,
    required this.name,
    this.description = '',
    this.colourCode = '',
  });

  factory JobGroup.fromJson(Map<String, dynamic> json) => JobGroup(
        jobGroupId: json['jobGroupId'],
        name: json['name'],
        description: json['description'],
        colourCode: json['colourCode'],
      );

  Map<String, dynamic> toJson() => {
        'jobGroupId': jobGroupId,
        'name': name,
        'description': description,
        'colourCode': colourCode,
      };
}

class JobGroupGenre {
  final int id;
  final int jobGroupId;
  final int jobGenreId;

  JobGroupGenre({
    required this.id,
    required this.jobGroupId,
    required this.jobGenreId,
  });

  factory JobGroupGenre.fromJson(Map<String, dynamic> json) => JobGroupGenre(
        id: json['id'],
        jobGroupId: json['jobGroupId'],
        jobGenreId: json['jobGenreId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'jobGroupId': jobGroupId,
        'jobGenreId': jobGenreId,
      };
}
