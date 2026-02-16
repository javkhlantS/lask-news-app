import 'package:lask_news_app/core/models/article.dart';

class Home {
  final int id;
  final String documentId;
  final List<Article> featuredArticles;

  const Home({
    required this.id,
    required this.documentId,
    required this.featuredArticles,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      featuredArticles: (json['featured_articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'featured_articles': featuredArticles.map((e) => e.toJson()).toList(),
    };
  }
}
