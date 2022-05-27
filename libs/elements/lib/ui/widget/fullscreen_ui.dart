part  of ui;

class FullscreenUi extends StatelessWidget {
  const FullscreenUi(
      {Key? key, required this.child, this.bottomNavCallback})
      : super(key: key);

  final Widget child;
  final Function? bottomNavCallback;

  @override
  Widget build(BuildContext context) {
    /// Enables users to be able to bring back the system bars by simply
    /// swiping from any edge where a system bar is hidden
    enterFullScreen(FullScreenMode.EMERSIVE_STICKY);

    return child;
  }

  ///To enter FullScreenMode
  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  /// To exit the fullscreen mode.
  void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }
}
