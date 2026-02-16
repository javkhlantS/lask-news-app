class Picture {
  final int id;
  final String documentId;
  final String url;

  const Picture({
    required this.id,
    required this.documentId,
    required this.url,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentId': documentId,
      'url': url,
    };
  }
}
