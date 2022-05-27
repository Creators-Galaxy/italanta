part of components;

class FullScreenShowStatusScaffold extends StatelessWidget {
  const FullScreenShowStatusScaffold(
      {Key? key,
      required this.bodyBuilder,
      this.appBar,
      this.backgroundColor,
      this.statusBrightness = Brightness.dark})
      : super(key: key);

  final Widget Function(BoxConstraints constraints) bodyBuilder;
  final AppBar? appBar;
  final Color? backgroundColor;
  final Brightness statusBrightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: ConfigConstants.statusBarColor(brightness: statusBrightness),
        child: Scaffold(
            backgroundColor: backgroundColor??Theme.of(context).backgroundColor,
            appBar: appBar,
            body: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return bodyBuilder(viewportConstraints);
            })));
  }
}
