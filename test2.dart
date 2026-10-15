class Person {
  String firstname;
  String lastname;

  Person (this.firstname, this.lastname);

  String get fullname => this.firstname + " " + this.lastname;
  
}

class Point {
  final int x;
  final int y;

  const Point(int this.x, int this.y);


  Point translate(int dx, int dy) {
    return Point(x + dx, y + dy);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "x = $x y = $y";
  }
}

void main() {
  Point p1 = Point(1, 2);
  Point p2 = p1.translate(2,2);

  print(p1);
  print(p2);

  // Person p1 = Person("labubu", "cake");
  // print(p1.fullname);

}