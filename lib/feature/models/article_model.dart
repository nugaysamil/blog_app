class ArticleModel {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  ArticleModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
