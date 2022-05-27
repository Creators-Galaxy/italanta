import 'dart:ui';

abstract class Helpers {
  static List<Offset> getOffsetFromList(
      {required List<double> points, double scaleFactor = 1.0}) {
    assert(points.length % 2 == 0);
    List<Offset> listOfOffset = [];
    for (var index = 0; index < points.length; index += 2) {
      Offset offset = Offset(points[index], points[index + 1]);
      offset *= scaleFactor;
      listOfOffset.add(offset);
    }
    return listOfOffset;
  }

  static getEnumTypeFromObject(objectType, enumClass){
    return objectType?? enumClass.values.byName(objectType);
  }
}
