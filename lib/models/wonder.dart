import 'package:isar/isar.dart';

part 'wonder.g.dart';
@collection
class Wonder{
  Id id ;

  @Index(type: IndexType.value)
  final String title;
  @Index(type: IndexType.value)
  final String description;
  @Index(type: IndexType.value)
  final String imageUrl;
  @Index(type: IndexType.value)
  final String country;
  @Index(type: IndexType.value)
  final String region;
  @Index(type: IndexType.value)
 final bool isFavorite;
  final Coordinates coordinates;

  Wonder( {
    this.id= Isar.autoIncrement,
     this.isFavorite=false,
    required this.coordinates
    ,required this.country,
    required this.region,
    required this.title,
    required this.description,
    required this.imageUrl
  });
}

@embedded
class Coordinates{
  double? latitude;
  double? longitude;

  Coordinates( {
    this.latitude,
    this.longitude
  });
}

