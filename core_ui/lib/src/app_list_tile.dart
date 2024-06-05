part of core_ui;

class AppListTile extends StatelessWidget {
  final String title;
  final Widget? icon;
  final VoidCallback? onPressed;

  const AppListTile({
    super.key,
    required this.title,
    this.icon,
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
          child: IconButton(
            icon: icon ?? const SizedBox.shrink(),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
