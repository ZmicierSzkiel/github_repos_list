part of core_ui;

class AppListTile extends StatelessWidget {
  final String title;
  final bool isRepo;
  final bool isFavorite;
  final VoidCallback? onPressed;

  const AppListTile({
    super.key,
    required this.title,
    required this.isRepo,
    this.isFavorite = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 16.0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        tileColor: colors.layer2,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 18.0,
          ),
          child: Text(
            title,
            style: AppTextTheme.sora14Normal.copyWith(
              color: colors.primary,
            ),
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
          ),
          child: isRepo
              ? IconButton(
                  icon: isFavorite
                      ? AppIcons.favoriteSelectedIcon.call()
                      : AppIcons.favoriteButtonIcon.call(),
                  onPressed: onPressed,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
