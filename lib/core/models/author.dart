class Author {
  final int id;
  final String documentId;
  final String firstName;
  final String lastName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  const Author({
    required this.id,
    required this.documentId,
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
      firstName: json['firstname'] as String,
      lastName: json['lastname'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'firstname': firstName,
      'lastname': lastName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'publishedAt': publishedAt.toIso8601String(),
    };
  }
}
