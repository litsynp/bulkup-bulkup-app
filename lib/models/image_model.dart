class Image {
  final int? id;
  final String url;

  Image({
    this.id,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
    };
  }

  static Image fromJson(Map<String, dynamic> map) {
    return Image(
      id: map['id'],
      url: map['url'],
    );
  }
}
