import 'package:hive/hive.dart';

import '../hive/favorites_hive.dart';

class Boxes {
  static Box<FavoritesHive> getData() => Hive.box<FavoritesHive>('data');
}
