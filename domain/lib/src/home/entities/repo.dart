part of home;

@HiveType(typeId: 0)
class Repo extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isFavorite;

  Repo({
    required this.id,
    required this.name,
    required this.isFavorite,
  });

  Repo copyWith({
    int? id,
    String? name,
    String? url,
    bool? isFavorite,
  }) {
    return Repo(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
