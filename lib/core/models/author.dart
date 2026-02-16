import 'package:lask_news_app/core/models/picture.dart';

class Author {
  final int id;
  final String documentId;
  final String firstName;
  final String lastName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final Picture avatar;

  const Author({
    required this.id,
    required this.documentId,
    required this.avatar,
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.publishedAt,
    required this.updatedAt,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      avatar: Picture.fromJson(json['avatar'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'publishedAt': publishedAt.toIso8601String(),
      'avatar': avatar.toJson(),
    };
  }
}
