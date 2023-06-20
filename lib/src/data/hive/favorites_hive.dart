import 'package:hive/hive.dart';

part 'favorites_hive.g.dart';

@HiveType(typeId: 1)
class FavoritesHive extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String img;

  @HiveField(3)
  String type;

  @HiveField(4)
  double weight;

  FavoritesHive({
    required this.id,
    required this.name,
    required this.img,
    required this.type,
    required this.weight,
  });
}
