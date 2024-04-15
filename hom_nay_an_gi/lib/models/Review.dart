// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Review {
  String? name;
  double? rating;
  String? comment;
  String? user;
  Review({
    this.name,
    this.rating,
    this.comment,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rating': rating,
      'comment': comment,
      'user': user,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      name: map['name'] != null ? map['name'] as String : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      user: map['user'] != null ? map['user'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);
}
