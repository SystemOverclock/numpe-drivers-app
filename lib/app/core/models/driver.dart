class Driver {
  int? id;
  String? name;
  String? image;
  double? avgRate;
  double? rate;
  String? comment;

  Driver({
    this.id,
    this.name,
    this.image,
    this.avgRate,
    this.rate,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': image,
      'avgRate': avgRate,
      'rate': rate,
      'comment': comment,
    };
  }

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['picture'] as String?,
      avgRate: double.parse(json['avgRate'].toString()),
      rate: json['rate'] != null ? double.parse(json['rate'].toString()) : null,
      comment: json['comment'] as String?,
    );
  }
}
