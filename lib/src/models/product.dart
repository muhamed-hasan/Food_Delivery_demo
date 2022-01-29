class Product {
  final String name;
  final String image;
  final double rating;
  final double price;
  final String? vendor;
  final bool wishList;

  Product(
      {required this.name,
      required this.image,
      required this.rating,
      required this.price,
      this.vendor,
      this.wishList = false});
}
