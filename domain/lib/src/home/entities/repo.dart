part of home;

@HiveType(typeId: 0)
class Repo{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String url;

  @HiveField(3)
  final bool isFavorite;

  const Repo({
    required this.id,
    required this.name,
    required this.url,
    required this.isFavorite,
  });
}
