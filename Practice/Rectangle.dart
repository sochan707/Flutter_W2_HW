class Point {
  int x;
  int y;

  Point({required this.x, required this.y}) {}

  @override
  String toString() {
    return "x = $x, y = $y";
  }
}

class Rectangle {
  Point p1;
  Point p2;

  Rectangle({required this.p1, required this.p2}) {}

  int getWidth() {
    return (p1.x - p2.x).abs();
  }

  int getHeight() {
    return (p1.y - p2.y).abs();
  }

  int getArea() {
    return getWidth() * getHeight();
  }

  Point getTopLeft() {
    int x;
    int y;

    if (p1.x < p2.x) {
      x = p1.x;
    } else {
      x = p2.x;
    }

    if (p1.y > p2.y) {
      y = p1.y;
    } else {
      y = p2.y;
    }

    return Point(x: x, y: y);
  }

  Point getBottomRight() {
    int x;
    int y;

    if (p1.x > p2.x) {
      x = p1.x;
    } else {
      x = p2.x;
    }

    if (p1.y < p2.y) {
      y = p1.y;
    } else {
      y = p2.y;
    }

    return Point(x: x, y: y);
  }
}

void main() {
  Point p1 = Point(x: 2, y: 3);
  Point p2 = Point(x: 8, y: 10);

  Rectangle r1 = Rectangle(p1: p1, p2: p2);

  print("Width: ${r1.getWidth()}");
  print("Height: ${r1.getHeight()}");
  print("Area: ${r1.getArea()}");

  print("Top Left: ${r1.getTopLeft()}");
  print("Bottom Right: ${r1.getBottomRight()}");
}