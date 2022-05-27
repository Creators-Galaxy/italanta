part of screens;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return FullScreenShowStatusScaffold(
        bodyBuilder: (BoxConstraints viewPortConstraints) {
      return Column(
        children: [
          const Expanded(
              flex: 2,
              child: CityAnimation(
                type: CityAnimationType.constructionCity1,
                fit: BoxFit.contain,
              )),
          Flexible(
              flex: 6,
              child: TextButton(
                child: Text(LocaleKeys.appTitle.tr().camelCase()),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(RoutePaths.home);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.grey.shade600,
                  backgroundColor: CityScapeColors.cityBackground2,
                  elevation: 4,
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),


                      side: BorderSide(
                          width: 5,
                          color: Colors.white
                      )
                  ),
                ),
              ))
        ],
      );
    });
  }
}
