part of home;

class RepoMapper extends Repo {
  RepoMapper({
    required int id,
    required String name,
    required String url,
    required bool isFavorite,
  }) : super(
          id: id,
          name: name,
          url: url,
          isFavorite: false,
        );

  static RepoMapper fromJson(Map<String, dynamic> json) {
    return RepoMapper(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      isFavorite: false,
    );
  }
}
