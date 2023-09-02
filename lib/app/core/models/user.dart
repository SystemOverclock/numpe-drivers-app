class User {
  String? id;
  List? history;

  User({
    this.id,
    this.history,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': id,
      'history': history,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'] as String?,
      history: json['history'] as List?,
    );
  }
}
