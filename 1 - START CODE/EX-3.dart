class MyDuration {
  final int _milliseconds;

  // MyDuration(this._milliseconds) : assert(_milliseconds >= 0);
  // MyDuration.fromHours(int hours) : assert(hours >= 0), _milliseconds = hours * 3600000;
  // MyDuration.fromMinutes(int minutes) : assert(minutes >= 0), _milliseconds = minutes * 60000;
  // MyDuration.fromSeconds(int seconds) : assert(seconds >= 0), _milliseconds = seconds * 1000;

  MyDuration._(this._milliseconds);

  factory MyDuration(int milliseconds) {
    if (milliseconds < 0) {
      throw ArgumentError("Milliseconds cannot be negative.");
    }
    return MyDuration._(milliseconds);
  }

  factory MyDuration.fromHours(int hours) {
    if (hours < 0) {
      throw ArgumentError("Hours cannot be negative.");
    }
    return MyDuration._(hours * 3600000);
  }

  factory MyDuration.fromMinutes(int minutes) {
    if (minutes < 0) {
      throw ArgumentError("Minutes cannot be negative.");
    }
    return MyDuration._(minutes * 60000);
  }

  factory MyDuration.fromSeconds(int seconds) {
    if (seconds < 0) {
      throw ArgumentError("Seconds cannot be negative.");
    }
    return MyDuration._(seconds * 1000);
  }

  bool operator >(MyDuration other){
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator +(MyDuration other){
    return MyDuration(_milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other){
    if (other._milliseconds > _milliseconds){
      throw Exception("Negative.");
    }

    return MyDuration(_milliseconds - other._milliseconds);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
