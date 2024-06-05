part of core_ui;

class AppPlaceholder extends StatelessWidget {
  final String titleText;
  final String bottomText;

  const AppPlaceholder({
    super.key,
    required this.titleText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
