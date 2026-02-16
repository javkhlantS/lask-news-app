import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/models/category.dart';

class Home {
  final int id;
  final String documentId;
  final List<Article> featuredArticles;
  final List<Category> featuredCategories;

  const Home({
    required this.id,
    required this.documentId,
    required this.featuredArticles,
    required this.featuredCategories,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      featuredArticles: (json['featured_articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredCategories: (json['featured_categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'featured_articles': featuredArticles.map((e) => e.toJson()).toList(),
      'featured_categories': featuredCategories.map((e) => e.toJson()).toList(),
    };
  }
}
