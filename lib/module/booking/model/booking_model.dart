class BookingModel {
  int id;
  String name;
  String address;
  double price;
  double rating;
  bool isAvailable;
  String imageUrl;

  BookingModel({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
    required this.isAvailable,
    required this.imageUrl,
  });
}
