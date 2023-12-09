class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;

  Product.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      title = json['title'],
      price = json['price'],
      description = json['description'],
      category = json['category'],
      image = json['image'];
}
