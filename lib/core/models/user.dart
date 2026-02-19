class User {
  final int id;
  final String documentId;
  final String username;
  final String email;
  final bool confirmed;
  final bool blocked;

  const User({
    required this.id,
    required this.documentId,
    required this.username,
    required this.email,
    required this.confirmed,
    required this.blocked,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      documentId: json['documentId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      confirmed: json['confirmed'] as bool,
      blocked: json['blocked'] as bool,
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
    };
  }
}
