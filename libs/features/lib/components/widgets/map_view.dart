part of components;

class MapView extends StatelessWidget {
  const MapView({Key? key, required this.constraints, required this.city})
      : super(key: key);

  final BoxConstraints constraints;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        width: constraints.maxWidth,
        height: constraints.maxHeight * .75,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Kenya(),
            if (CityTypes.values
                .where((cty) => cty.name == city.toLowerCase())
                .isNotEmpty)
              if (city.isNotEmpty)
                CityMap(cityActive: CityTypes.values.byName(city.toLowerCase()))
          ],
        ));
  }
}
