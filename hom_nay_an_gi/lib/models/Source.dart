// ignore_for_file: file_names

class SourceModel {
  String? name;
  String? uid;
  String? image;

  SourceModel({
    this.name,
    this.uid,
    this.image,
  });

  factory SourceModel.fromJson(Map<String, dynamic> res) {
    return SourceModel(
      name: res['name'],
      uid: res['uid'],
      image: res['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uid': uid,
      'image': image,
    };
  }
}
