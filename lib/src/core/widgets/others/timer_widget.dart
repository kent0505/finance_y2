import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    required this.seconds,
    this.style,
    this.onTimerStart,
    this.onTimerEnd,
  });

  final int seconds;
  final TextStyle? style;
  final void Function()? onTimerStart;
  final void Function()? onTimerEnd;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int seconds;
  Timer? _timer;

  String formatTime(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    return '$formattedHours:$formattedMinutes';
  }

  void startTimer() {
    if (widget.onTimerStart != null) widget.onTimerStart!();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        _timer?.cancel();
        if (widget.onTimerEnd != null) widget.onTimerEnd!();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    seconds = widget.seconds;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    logger('DISPOSE TIMER');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(seconds),
      style: widget.style,
    );
  }
}
