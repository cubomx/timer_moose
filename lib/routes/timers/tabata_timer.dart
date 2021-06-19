import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_glow/flutter_glow.dart';
// widgets
import 'package:timer_moose/effects/circle_neon.dart';
import 'package:timer_moose/helpers/convert.dart';
// helpers
import 'package:timer_moose/helpers/my_time.dart';

class TabataTimer extends StatefulWidget {
  final MyTime rest, work;
  final int rounds;
  const TabataTimer(
      {required this.rest, required this.work, required this.rounds});
  @override
  _TabataTimerState createState() => _TabataTimerState();
}

enum TabataStates { REST, WORK, DONE, READY }

TabataState getState(TabataStates actualState) {
  switch (actualState) {
    case TabataStates.WORK:
      return TabataState("WORK", Colors.green);
    case TabataStates.REST:
      return TabataState("REST", Colors.red);
    case TabataStates.READY:
      return TabataState("WORK", createMaterialColor(Colors.white));
    default:
      return TabataState("DONE", Colors.yellow);
  }
}

class TabataState {
  String stateText;
  MaterialColor colorText;

  TabataState(this.stateText, this.colorText);
}

class _TabataTimerState extends State<TabataTimer> {
  TabataStates myState = TabataStates.READY;
  late int actualRound = 1;
  late String state = "WORK";
  late MaterialColor color;
  late MyTime time;
  String hintText = "TAP TO PAUSE";
  late Timer _timer;
  late int totalTime = 0;
  late int missingTime = 0;
  bool isPaused = false;
  bool istWorking = false;
  bool itStarted = false;
  @override
  void initState() {
    super.initState();

    time = widget.work.copyWith();
    restartTimer();
  }

  void restartState() {
    TabataState actualState = getState(myState);
    state = actualState.stateText;
    color = actualState.colorText;
  }

  void restartTimer() {
    setState(() {
      totalTime = minutesToSeconds(time);
      missingTime = totalTime;
      restartState();
    });
  }

  void startTimer() {
    istWorking = true;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      if (missingTime == 0) {
        setState(() {
          if (actualRound == widget.rounds && myState == TabataStates.WORK) {
            actualRound++;
            istWorking = false;
            myState = TabataStates.DONE;
          }
          switch (myState) {
            case TabataStates.READY:
              break;
            case TabataStates.WORK:
              myState = TabataStates.REST;
              time = widget.rest.copyWith();
              restartTimer();
              break;
            case TabataStates.REST:
              myState = TabataStates.WORK;
              time = widget.work.copyWith();
              actualRound++;
              restartTimer();
              break;
            case TabataStates.DONE:
              timer.cancel();
              restartState();
              break;
          }
        });
      } else {
        setState(() {
          changeTimer();
          missingTime--;
        });
      }
    });
  }

  void changeTimer() {
    setState(() {
      time.seconds -= 1;
      if (time.seconds < 0) {
        if (time.minutes > 0) {
          time.minutes--;
          time.seconds = 59;
        } else {
          time.seconds = 0;
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void pause() {
    setState(() {
      if (itStarted) {
        if (!isPaused) {
          isPaused = true;
          hintText = "TAP TO PLAY";
          _timer.cancel();
        } else {
          isPaused = false;
          hintText = "TAP TO PAUSE";
          startTimer();
        }
      } else {
        itStarted = true;
        myState = TabataStates.WORK;
        restartState();
        startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GlowText(
                  myState == TabataStates.DONE
                      ? ""
                      : this.actualRound.toString() +
                          "/" +
                          widget.rounds.toString() +
                          " - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20)),
              GlowText(
                state,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: color, fontSize: 20),
              )
            ],
          ),
          CircleNeon(
            child: GlowText(
                myState == TabataStates.DONE
                    ? "NICE WORK"
                    : myState == TabataStates.READY
                        ? "TAP TO START"
                        : timeToString(this.time),
                style: TextStyle(
                    fontSize: myState == TabataStates.DONE
                        ? 30
                        : myState == TabataStates.READY
                            ? 24
                            : 50,
                    color: color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: myState == TabataStates.READY ? 2.0 : 5.0)),
            color: Colors.white,
            key: Key("Circle Neon Tabata"),
            radius: 150,
            shadowSpread: 3,
            spreadValue: 3,
            strokeWidth: 3,
            quantity: myState == TabataStates.READY
                ? pi * 2
                : (pi * 2) * ((totalTime - missingTime) / totalTime),
            callback: pause,
            hintText: hintText,
            itsWorking: istWorking,
          ),
        ],
      ),
    );
  }
}
