part of core_ui;

class AppPlaceholder extends StatelessWidget {
  final String titleText;
  final String bottomText;
  final double padding;

  const AppPlaceholder({
    super.key,
    required this.titleText,
    required this.bottomText,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppIcons.noResultIcon.call(),
            const SizedBox(
              height: 10.0,
            ),
            Text(titleText),
            Text(bottomText),
          ],
        ),
      ),
    );
  }
}
