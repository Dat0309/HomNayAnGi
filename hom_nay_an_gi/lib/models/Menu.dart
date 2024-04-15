// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Menu {
  String? title;
  String? description;
  String? thumb;
  List<dynamic>? recipes;
  Menu({
    this.title,
    this.description,
    this.thumb,
    this.recipes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'thumb': thumb,
      'recipes': recipes,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      thumb: map['thumb'] != null ? map['thumb'] as String : null,
      recipes: map['recipes'] != null ? map['recipes'] as List<dynamic> : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) =>
      Menu.fromMap(json.decode(source) as Map<String, dynamic>);
}
