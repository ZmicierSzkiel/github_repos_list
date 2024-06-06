part of core_ui;

class AppHeaderButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const AppHeaderButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: colors.accent,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
