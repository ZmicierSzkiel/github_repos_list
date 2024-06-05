part of home;

class RepoMapper extends Repo {
  RepoMapper({
    required int id,
    required String name,
    required bool isFavorite,
  }) : super(
          id: id,
          name: name,
          isFavorite: false,
        );

  static RepoMapper fromJson(Map<String, dynamic> json) {
    return RepoMapper(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      isFavorite: false,
    );
  }
}
