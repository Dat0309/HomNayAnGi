// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Food {
  String? name;
  String? description;
  String? categoriesId;
  String? calories;
  String? nutrition;
  String? image;
  Food({
    this.name,
    this.description,
    this.categoriesId,
    this.calories,
    this.nutrition,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'categories_id': categoriesId,
      'calories': calories,
      'nutrition': nutrition,
      'image': image,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      categoriesId:
          map['categories_id'] != null ? map['categories_id'] as String : null,
      calories: map['calories'] != null ? map['calories'] as String : null,
      nutrition: map['nutrition'] != null ? map['nutrition'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);
}
