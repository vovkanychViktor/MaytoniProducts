class MaytoniDataModel {
  final String id;
  final String name;
  final String article;
  final int colorTemperature;
  final int power;
  final String protectionLevel;
  final int height;
  final int width;
  final int length;
  final double price;
  final String imageUrl;

  MaytoniDataModel(
      {required this.id,
      required this.name,
      required this.article,
      required this.colorTemperature,
      required this.power,
      required this.protectionLevel,
      required this.height,
      required this.width,
      required this.length,
      required this.price,
      required this.imageUrl});
}
