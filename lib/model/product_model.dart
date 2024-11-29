class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['images'] = images;
    return map;
  }
}
