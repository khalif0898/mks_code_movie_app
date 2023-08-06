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
  // modeling = API -> Entity
  factory Movie.fromJson(Map<String, dynamic> json) {
    var primaryImage = json['primaryImage'];
    String url =
        'https://marketplace.canva.com/EAFH3gODxw4/1/0/1131w/canva-black-%26-white-modern-mystery-forest-movie-poster-rLty9dwhGG4.jpg';
    String caption = 'Ini Movie';
    if (primaryImage != null) {
      url = primaryImage['url'];
      caption = primaryImage['caption']['plainText'];
    }

    return Movie(
      title: json['titleText']['text'],
      year: json['releaseYear']['year'],
      posterUrl: url,
      caption: caption,
    );
  }
}
