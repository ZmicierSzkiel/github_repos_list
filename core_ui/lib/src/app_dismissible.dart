part of core_ui;

class AppDismissible extends StatelessWidget {
  final String title;
  final bool isRepo;
  final void Function(DismissDirection?) onDismissed;

  const AppDismissible({
    super.key,
    required this.title,
    required this.isRepo,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 16.0,
        ),
        margin: const EdgeInsets.only(right: 16.0),
        child: AppIcons.deleteIcon.call(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: colors.error,
        ),
      ),
      onDismissed: onDismissed,
      child: AppListTile(
        title: title,
        isRepo: isRepo,
      ),
    );
  }
}
