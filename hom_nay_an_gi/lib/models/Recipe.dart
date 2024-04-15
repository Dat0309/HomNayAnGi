// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';
import 'package:hom_nay_an_gi/models/Source.dart';

class Recipe {
  String? id;
  String? title;
  String? description;
  int? prepTime;
  String? prepTimeUnit;
  int? cookTime;
  String? cookTimeUnit;
  String? yields;
  String? image;
  num? rating;
  String? categoriesId;
  String? calories;
  List<dynamic>? reviews;
  int? numReview;
  String? instruction;
  String? processing;
  int? difficulty;
  String? allergies;
  List<dynamic>? ingredients;
  SourceModel? source;

  Recipe({
    this.id,
    this.title,
    this.description,
    this.prepTime,
    this.prepTimeUnit,
    this.cookTime,
    this.cookTimeUnit,
    this.yields,
    this.image,
    this.rating,
    this.categoriesId,
    this.calories,
    this.reviews,
    this.numReview,
    this.instruction,
    this.processing,
    this.difficulty,
    this.allergies,
    this.ingredients,
    this.source,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'prep_time': prepTime,
      'prep_time_unit': prepTimeUnit,
      'cook_time': cookTime,
      'cook_time_unit': cookTimeUnit,
      'yields': yields,
      'image': image,
      'rating': rating,
      'categories_id': categoriesId,
      'calories': calories,
      'reviews': reviews,
      'num_revies': numReview,
      'instruction': instruction,
      'processing': processing,
      'difficulty': difficulty,
      'allergies': allergies,
      'ingredients': ingredients,
      'source': source?.toJson(),
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['_id'] != null ? map['_id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      prepTime: map['prep_time'] != null ? map['prep_time'] as int : null,
      prepTimeUnit: map['prep_time_unit'] != null
          ? map['prep_time_unit'] as String
          : null,
      cookTime: map['cook_time'] != null ? map['cook_time'] as int : null,
      cookTimeUnit: map['cook_time_unit'] != null
          ? map['cook_time_unit'] as String
          : null,
      yields: map['yields'] != null ? map['yields'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      categoriesId:
          map['categories_id'] != null ? map['categories_id'] as String : null,
      calories: map['calories'] != null ? map['calories'] as String : null,
      reviews: map['reviews'] != null
          ? List<dynamic>.from((map['reviews'] as List<dynamic>))
          : null,
      numReview: map['num_revies'] != null ? map['num_revies'] as int : null,
      instruction:
          map['instruction'] != null ? map['instruction'] as String : null,
      processing:
          map['processing'] != null ? map['processing'] as String : null,
      difficulty: map['difficulty'] != null ? map['difficulty'] as int : null,
      allergies: map['allergies'] != null ? map['allergies'] as String : null,
      ingredients: map['ingredients'] != null
          ? List<dynamic>.from((map['ingredients'] as List<dynamic>))
          : null,
      source: map['source'] != null
          ? SourceModel.fromJson(map['source'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) =>
      Recipe.fromMap(json.decode(source) as Map<String, dynamic>);
}
