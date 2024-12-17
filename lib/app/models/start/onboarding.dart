const String onBoardingPagesTable = 'on_boarding_pages';

class OnBoardingPageFields {
  static final List<String> values = [text, description, image];

  static final String text = 'text';
  static final String description = 'description';
  static final String image = 'image';
}

class OnBoardingPage {
  final String text;
  final String description;
  final String image;

  OnBoardingPage(
      {required this.text, required this.description, required this.image});

  factory OnBoardingPage.fromJson(Map<String, dynamic> json) => OnBoardingPage(
      text: json['text'],
      description: json['description'],
      image: json['image']);

  Map<String, dynamic> toJson() =>
      {'text': text, 'description': description, 'image': image};
}
