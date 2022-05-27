part of map;

class Kenya extends StatefulWidget {
  const Kenya({Key? key, this.cityActive}) : super(key: key);

  final String? cityActive;
  @override
  State<Kenya> createState() => _KenyaState();
}

class _KenyaState extends State<Kenya> with SingleTickerProviderStateMixin {
  late Animation<double> growthAnimation;
  late AnimationController _animationController;
  double _animationFactor = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
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
    return LayoutBuilder(builder: (context, constraints) {
      return CustomPaint(
          painter: _MapPainter(animationFactor: _animationFactor),
          size: Size(constraints.maxWidth, constraints.maxHeight));
    });
  }

  void delayedAnimationStart() async {
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => _animationController.forward());
  }
}

class _MapPainter extends CustomPainter {
  final double animationFactor;

  _MapPainter({required this.animationFactor});

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
                      points: CountryPolygons.kenya, scaleFactor: .8),
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
