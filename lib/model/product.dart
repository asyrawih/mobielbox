class Product {
  final int id;
  final int shopId;
  final int categoryId;
  final String name;
  final String status;
  final String price;
  final String salePrice;
  final String saleType;
  final String description;
  final int stock;
  final String images;
  final String options;
  final bool featured;

  Product(this.id, this.shopId, this.categoryId, this.name, this.status, this.price, this.salePrice, this.saleType, this.description, this.stock, this.images, this.options, this.featured);

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
      shopId = json["shop_id"],
      categoryId = json["category_id"],
      name = json["name"],
      status = json["status"],
      price = json["price"],
      salePrice = json["sale_price"],
      saleType = json["sale_type"],
      description = json["description"],
      stock = json["stock"],
      images = json["images"],
      options = json["options"],
      featured = json["featured"];
}
