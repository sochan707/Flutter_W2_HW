class Point {
  double x;
  double y;

  Point(this.x, this.y);
}

class Rectangle {
  Point p1;
  Point p2;

  Rectangle(this.p1, this.p2);

  double get width => (p1.x - p2.x).abs();

  double get height => (p1.y - p2.y).abs();

  double get area => width * height;

  Point get topLeft {
    return Point(
      p1.x < p2.x ? p1.x : p2.x,
      p1.y < p2.y ? p1.y : p2.y,
    );
  }

  Point get bottomRight {
    return Point(
      p1.x > p2.x ? p1.x : p2.x,
      p1.y > p2.y ? p1.y : p2.y,
    );
  }
}

void main() {
  var a = Point(2, 3);
  var b = Point(8, 10);

  var rectangle = Rectangle(a, b);

  print('Width: ${rectangle.width}');
  print('Height: ${rectangle.height}');
  print('Area: ${rectangle.area}');
}