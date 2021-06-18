class MyTime {
  int minutes;
  int seconds;
  MyTime({required this.minutes, required this.seconds});

  MyTime copyWith() {
    return MyTime(minutes: this.minutes, seconds: this.seconds);
  }
}

MyTime secondsToMinutes(int totalSeconds) {
  int minutes = totalSeconds ~/ 60;
  int seconds = totalSeconds % 60;
  return MyTime(minutes: minutes, seconds: seconds);
}

int minutesToSeconds(MyTime myTime) {
  return myTime.minutes * 60 + myTime.seconds;
}

String timeToString(MyTime myTime) {
  String timeString = "";
  if (myTime.minutes <= 9) {
    timeString += "0";
  }
  timeString += myTime.minutes.toString() + ":";
  if (myTime.seconds <= 9) {
    timeString += "0";
  }
  timeString += myTime.seconds.toString();
  return timeString;
}
