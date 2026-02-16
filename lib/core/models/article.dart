import 'package:lask_news_app/core/models/author.dart';
import 'package:lask_news_app/core/models/category.dart';
import 'package:lask_news_app/core/models/picture.dart';

class Article {
  final int id;
  final String documentId;
  final String title;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final Picture picture;
  final List<Category>? categories;
  final Author author;

  const Article({
    required this.id,
    required this.documentId,
    required this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    required this.picture,
    this.categories,
    required this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      title: json['title'] as String,
      content: json['content'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'] as String)
          : null,
      picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'title': title,
      'content': content,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'publishedAt': publishedAt?.toIso8601String(),
      'picture': picture.toJson(),
      'categories': categories?.map((e) => e.toJson()).toList(),
      'author': author.toJson(),
    };
  }
}
