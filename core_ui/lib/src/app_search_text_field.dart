part of core_ui;

class AppSearchTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
  final bool isFocused;
  final VoidCallback onClearTextField;

  const AppSearchTextField({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.isFocused,
    required this.onClearTextField,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return TextField(
      focusNode: focusNode,
      controller: controller,
      style: AppTextTheme.sora14Normal.copyWith(
        color: colors.primary,
      ),
      cursorColor: colors.accent,
      decoration: InputDecoration(
        hintStyle: AppTextTheme.sora14Normal.copyWith(
          color: colors.placeholder,
        ),
        hintText: hintText,
        fillColor: isFocused ? colors.layer3 : colors.layer2,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 6.0,
            bottom: 6.0,
            left: 6.0,
            right: 10.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: isFocused
                ? null
                : BoxDecoration(
                    color: colors.layer1,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
            child: AppIcons.searchIcon.call(),
          ),
        ),
        suffixIcon: isFocused
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 6.0,
                  bottom: 6.0,
                  right: 6.0,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: onClearTextField,
                  icon: AppIcons.closeIcon.call(),
                ),
              )
            : const SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.accent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
