part of map;

class CityMap extends StatefulWidget {
  const CityMap({Key? key, required this.cityActive}) : super(key: key);

  final CityTypes cityActive;

  @override
  State<CityMap> createState() => _CityMapState();
}

class _CityMapState extends State<CityMap> with SingleTickerProviderStateMixin {
  late Animation<double> growthAnimation;
  late AnimationController _animationController;
  double _animationFactor = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    growthAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation)
          ..addListener(() {
            if (_animationController.isCompleted) {
              // _animationController.reset();
            }
            setState(() {
              _animationFactor = growthAnimation.value;
            });
          });

    // Delayed Start
    delayedAnimationStart();
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<double> activeCityPolygon = [];
    switch (widget.cityActive) {
      case CityTypes.turkana:
        activeCityPolygon = CityPolygons.turkana;
        break;
      case CityTypes.nairobi:
        activeCityPolygon = CityPolygons.nairobi;
        break;
      case CityTypes.garissa:
        activeCityPolygon = CityPolygons.garissa;
        break;
      case CityTypes.mombasa:
        activeCityPolygon = CityPolygons.mombasa;
        break;
      case CityTypes.kisumu:
        activeCityPolygon = CityPolygons.kisumu;
        break;
      case CityTypes.marsabit:
        activeCityPolygon = CityPolygons.marsabit;
        break;
      case CityTypes.wajir:
        activeCityPolygon = CityPolygons.wajir;
        break;
      case CityTypes.mandera:
        activeCityPolygon = CityPolygons.mandera;
        break;
      case CityTypes.narok:
        activeCityPolygon = CityPolygons.narok;
        break;
      case CityTypes.kajiado:
        activeCityPolygon = CityPolygons.kajiado;
        break;
      case CityTypes.samburu:
        activeCityPolygon = CityPolygons.samburu;
        break;
      case CityTypes.kitui:
        activeCityPolygon = CityPolygons.kitui;
        break;
      case CityTypes.nyeri:
        activeCityPolygon = CityPolygons.nyeri;
        break;
      case CityTypes.isiolo:
        activeCityPolygon = CityPolygons.isiolo;
        break;
      case CityTypes.westPokot:
        activeCityPolygon = CityPolygons.westPokot;
        break;
      default:
        activeCityPolygon = [0, 0];
        break;
    }
    return LayoutBuilder(builder: (context, constraints) {
      return CustomPaint(
          painter: _CityPainter(
              animationFactor: _animationFactor,
              cityPolygon: activeCityPolygon),
          size: Size(constraints.maxWidth, constraints.maxHeight));
    });
  }

  void delayedAnimationStart() async {
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => _animationController.forward());
  }

  @override
  void didUpdateWidget(CityMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cityActive != widget.cityActive) {
      _animationController.reset();
      _animationController.forward(from: 0.0);
    }
  }
}

class _CityPainter extends CustomPainter {
  final double animationFactor;
  final List<double> cityPolygon;

  _CityPainter({required this.animationFactor, required this.cityPolygon});

  final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 5.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final Offset center = rect.center;
    final double radius = rect.shortestSide / 2.0;

    Path path = Path();

    path.addPath(
        createAnimatedPath(
            (Path()
              ..addPolygon(
                  Helpers.getOffsetFromList(
                      points: cityPolygon, scaleFactor: .8),
                  false)),
            animationFactor),
        Offset(rect.centerLeft.dx, rect.topCenter.dy));

    canvas.drawPath(path, _paint);
  }

  Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
