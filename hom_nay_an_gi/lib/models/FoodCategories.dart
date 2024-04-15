// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodCategories {
  String? name;
  String? description;
  String? image;
  FoodCategories({
    this.name,
    this.description,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory FoodCategories.fromMap(Map<String, dynamic> map) {
    return FoodCategories(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodCategories.fromJson(String source) =>
      FoodCategories.fromMap(json.decode(source) as Map<String, dynamic>);
}
