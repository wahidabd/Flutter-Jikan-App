import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class WishList {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String imageUrl;

  WishList({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}
