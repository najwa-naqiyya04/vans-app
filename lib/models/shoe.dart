class Shoe {
  final String id;
  final String brand;
  final String name;
  final String category;
  final String description;

  final double price;
  final double? oldPrice;

  final double rating;
  final int reviewCount;

  final String image;
  final List<String> detailImages;

  final bool isNew;
  final bool isPopular;

  Shoe({
    required this.id,
    required this.brand,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviewCount,
    required this.image,
    required this.detailImages,
    this.isNew = false,
    this.isPopular = false,
  });
}