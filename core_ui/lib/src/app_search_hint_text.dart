part of core_ui;

class AppSearchHintText extends StatelessWidget {
  final bool isSearching;

  const AppSearchHintText({
    super.key,
    required this.isSearching,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Text(
      isSearching ? 'What we found' : 'Search History',
      style: AppTextTheme.sora16Normal.copyWith(
        color: colors.accent,
      ),
    );
  }
}
