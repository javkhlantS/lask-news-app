class Category {
  final int id;
  final String documentId;
  final String title;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final int order;

  const Category({
    required this.id,
    required this.documentId,
    required this.title,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.order,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'title': title,
      'slug': slug,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'publishedAt': publishedAt.toIso8601String(),
      'order': order,
    };
  }
}
