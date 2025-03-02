import 'package:cy_road_signs/gen/assets.gen.dart';

class RoadSign {
  final String name;
  final String image;

  const RoadSign({required this.name, required this.image});

  String get signName => name;
  String get signImage => image;
}

final List<Map<String, String>> mandatorySigns =
    Assets.images.mandatory.values.map((image) {
  String name = image.path.split('/').last.split('.').first;
  return {
    'name': name,
    'image': image.path,
  };
}).toList();
final List<Map<String, String>> prohibitorySigns =
    Assets.images.prohibitory.values.map((image) {
  String name = image.path.split('/').last.split('.').first;
  return {
    'name': name,
    'image': image.path,
  };
}).toList();
final List<Map<String, String>> warningsSigns =
    Assets.images.warnings.values.map((image) {
  String name = image.path.split('/').last.split('.').first;
  return {
    'name': name,
    'image': image.path,
  };
}).toList();

final List<Map<String, String>> allSigns = [
  ...mandatorySigns,
  ...prohibitorySigns,
  ...warningsSigns,
];
List<RoadSign> getAllSigns() {
  return allSigns
      .map((sign) => RoadSign(name: sign['name']!, image: sign['image']!))
      .toList();
}
