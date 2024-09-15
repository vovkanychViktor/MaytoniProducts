class MaytoniDataModel {
  MaytoniDataModel({
    required this.id,
    required this.name,
    required this.article,
    required this.colorTemperature,
    required this.power,
    required this.protectionLevel,
    required this.height,
    required this.width,
    required this.length,
    required this.price,
    required this.imageUrl,
  });

  factory MaytoniDataModel.fromJson(Map<String, dynamic> json) =>
      MaytoniDataModel(
        id: json['id'] as String,
        name: json['name'] as String,
        article: json['article'] as String,
        colorTemperature: json['colorTemperature'] as int,
        power: json['power'] as int,
        protectionLevel: json['protectionLevel'] as String,
        height: json['height'] as int,
        width: json['width'] as int,
        length: json['length'] as int,
        price: json['price'] as double,
        imageUrl: json['imageUrl'] as String,
      );

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
}
