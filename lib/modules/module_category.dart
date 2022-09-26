import 'dart:convert';

class Category {
  Category({
    required this.name,
    required this.description,
    required this.image,
    required this.isActive,
    required this.children,
  });

  final String name;
  final String description;
  final String image;
  final bool? isActive;
  final List<dynamic> children;
  List<Category> categoryFromJson(String str) =>
      List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

  String categoryToJson(List<Category> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        isActive: json["is_active"],
        children: List<dynamic>.from(json["children"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "is_active": isActive,
        "children": List<dynamic>.from(children.map((x) => x)),
      };
}
