class Movie {
  String title;
  String posterUrl;
  int year;
  String caption;

  Movie({
    required this.title,
    required this.posterUrl,
    required this.year,
    required this.caption,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['titleText']['text'],
      year: json['releaseYear']['year'],
      posterUrl: '',
      caption: '',
    );
  }
}
