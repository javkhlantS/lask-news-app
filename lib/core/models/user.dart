import 'package:lask_news_app/core/models/article.dart';

class User {
  final int id;
  final String documentId;
  final String username;
  final String email;
  final bool confirmed;
  final bool blocked;
  final List<Article> bookmarkArticles;
  final List<Article> clappedArticles;

  const User({
    required this.id,
    required this.documentId,
    required this.username,
    required this.email,
    required this.confirmed,
    required this.blocked,
    required this.bookmarkArticles,
    required this.clappedArticles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      confirmed: json['confirmed'] as bool,
      blocked: json['blocked'] as bool,
      bookmarkArticles:
          (json['bookmark_articles'] as List<dynamic>?)
              ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      clappedArticles:
          (json['clapped_articles'] as List<dynamic>?)
              ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'username': username,
      'email': email,
      'confirmed': confirmed,
      'blocked': blocked,
      'bookmark_articles': bookmarkArticles.map((e) => e.toJson()).toList(),
      'clapped_articles': clappedArticles.map((e) => e.toJson()).toList(),
    };
  }
}
