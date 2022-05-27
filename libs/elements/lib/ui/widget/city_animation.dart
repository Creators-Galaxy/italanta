part of ui;

class CityAnimation extends StatelessWidget {
  const CityAnimation({Key? key, required this.type, this.fit = BoxFit.fill, this.isAnimating=true})
      : super(key: key);

  final CityAnimationType type;
  final BoxFit fit;
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    String animationFile;
    switch (type) {
      case CityAnimationType.movingCity:
        animationFile = "31673-moving-city.json";
        break;
      case CityAnimationType.beautifulCity:
        animationFile = "39090-beautiful-city.json";
        break;
      case CityAnimationType.mbtCity:
        animationFile = "79925-mbt-city.json";
        break;
      case CityAnimationType.constructionCity1:
        animationFile = "91414-city-building-construction.json";
        break;
      case CityAnimationType.constructionCity2:
        animationFile = "97493-city-building.json";
        break;
      case CityAnimationType.jente:
        print("I am here");
        animationFile = "jente_standing.json";
        break;
    }

    return Container(
      alignment: Alignment.center,
      child: Lottie.asset("assets/lottie/$animationFile", fit: fit, animate: isAnimating),
    );
  }
}
