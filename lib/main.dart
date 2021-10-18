import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pomodoro(),
    ));

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  // late int _minutos = 0;
  double percentual = 0.00;
  int _min = 00;
  int _seg = 00;
  Color _cor = Colors.white;
  late Timer _timer;

  int _min5 = 5;
  int _min15 = 15;
  int _min25 = 25;

  _startTimer() {
    _cor = Colors.white;
    _seg = 0;
    percentual = 0.00;
    var _temp = ((100 / _min) / 100) - 0.00000002;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seg > 0) {
          _seg--;
        } else {
          if (_min > 0) {
            _seg = 59;
            _min--;
            percentual += _temp;
          } else {
            _timer.cancel();
            _cor = Colors.green;
            print("Timer Complete");
          }
        }
      });
    });
  }

  _stopTimer() {
    setState(() {
      if (_timer != null) {
        _timer.cancel();
        _min = 00;
        _seg = 00;
        percentual = 0.00;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xff143f61),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Pomodoro",
                  style: TextStyle(color: Colors.white, fontSize: 35.0),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percentual,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 250.0,
                  lineWidth: 12.0,
                  progressColor: _cor,
                  backgroundColor: Colors.black12,
                  center: Text(
                    "$_min:$_seg",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              // ignore: todo
                              //TODO fazer edição do tempo de estudo e tempo de descanço
                              // ignore: todo
                              //TODO nos itens abaixo
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RaisedButton(
                                    color: const Color(0xff143f61),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "$_min5",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_timer != null) {
                                          _stopTimer();
                                        }
                                        _min = _min5;
                                        _cor = Colors.white;
                                      });
                                    },
                                  ),
                                  RaisedButton(
                                    color: const Color(0xff143f61),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "$_min15",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_timer != null) {
                                          _stopTimer();
                                        }
                                        _min = _min15;
                                        _cor = Colors.white;
                                      });
                                    },
                                  ),
                                  RaisedButton(
                                    color: const Color(0xff143f61),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "$_min25",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_timer != null) {
                                          _stopTimer();
                                        }
                                        _min = _min25;
                                        _cor = Colors.white;
                                      });
                                    },
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 28.0),
                              child: RaisedButton(
                                color: const Color(0xff143f61),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Parar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                                onPressed: _stopTimer,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 28.0),
                              child: RaisedButton(
                                color: const Color(0xff143f61),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Iniciar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                                onPressed: _startTimer,
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
