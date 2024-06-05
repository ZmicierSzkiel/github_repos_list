part of core_ui;

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isAnotherScreen;
  final VoidCallback? onPush;
  final VoidCallback? onPop;

  @override
  final Size preferredSize;

  const AppHeader({
    super.key,
    required this.title,
    required this.isAnotherScreen,
    this.onPush,
    this.onPop,
  }) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: Container(
        decoration: BoxDecoration(
          color: colors.layer1,
          boxShadow: [
            BoxShadow(
              color: colors.shadow.withOpacity(0.1),
              offset: Offset(0, 6),
              blurRadius: 20,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: colors.shadow.withOpacity(0.06),
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: AppBar(
          title: Text(title),
          scrolledUnderElevation: 0.0,
          leading: isAnotherScreen
              ? Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: AppHeaderButton(
                    icon: AppIcons.arrowIcon.call(),
                    onPressed: onPop,
                  ),
              )
              : const SizedBox.shrink(),
          actions: <Widget>[
            isAnotherScreen
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: AppHeaderButton(
                      icon: AppIcons.favoriteUnselectedIcon.call(),
                      onPressed: onPush,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
