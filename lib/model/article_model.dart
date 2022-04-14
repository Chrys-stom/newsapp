class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel(
      {required this.author,
      required this.title,
      required this.url,
      required this.description,
      required this.content,
      required this.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        author: json['author'] as String,
        title: json['title'] as String,
        url: json['url'] as String,
        description: json['description'] as String,
        content: json['content'] as String,
        urlToImage: json['urlToImage'] as String);
  }
}
