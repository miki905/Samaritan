import 'dart:convert';

TopHeadlines topHeadlinesFromJson(String str) {
  // print('topHeadlinesFromJson method running');
  return TopHeadlines.fromJson(json.decode(str));
}

String topHeadlinesToJson(TopHeadlines data) => json.encode(data.toJson());

class TopHeadlines {
  String status;
  int totalResults;
  List<Article> articles;

  TopHeadlines({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory TopHeadlines.fromJson(Map<String, dynamic> json) {
    // print('top headline fromJson');
    return TopHeadlines(
      status: json["status"],
      totalResults: json["totalResults"],
      articles:
          List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  String title;
  String? author;
  Source source;
  DateTime publishedAt;
  String? description;
  String url;

  Article({
    required this.title,
    this.author,
    this.description,
    required this.source,
    required this.publishedAt,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        author: json["author"],
        description: json['description'],
        source: Source.fromJson(json["source"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "source": source.toJson(),
        "description": description,
        "publishedAt": publishedAt.toIso8601String(),
        "url": url,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["Id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
      };
}
