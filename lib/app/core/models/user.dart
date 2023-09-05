class User {
  String? id;
  List? history;
  List? travels;

  User({this.id, this.history, this.travels});

  Map<String, dynamic> toMap() {
    return {
      'userId': id,
      'history': history,
      'travels': travels,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'] as String?,
      history: json['history'] as List?,
      travels: json['travels'] as List?,
    );
  }
}
