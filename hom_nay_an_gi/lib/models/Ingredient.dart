// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ingredient {
  String? id;
  String? name;
  String? image;
  String? foodId;
  String? measurement;
  String? measureUnit;
  String? note;
  Ingredient({
    this.id,
    this.name,
    this.image,
    this.foodId,
    this.measurement,
    this.measureUnit,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'foodId': foodId,
      'measurement': measurement,
      'measure_unit': measureUnit,
      'note': note,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      foodId: map['foodId'] != null ? map['foodId'] as String : null,
      measurement:
          map['measurement'] != null ? map['measurement'] as String : null,
      measureUnit:
          map['measure_unit'] != null ? map['measure_unit'] as String : null,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source) as Map<String, dynamic>);
}
