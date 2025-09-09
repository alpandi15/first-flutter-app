import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int seconds; // durasi awal dalam detik
  final VoidCallback? onFinished; // callback ketika habis
  final TextStyle? timeStyle; // custom style waktu
  final TextStyle? textStyle; // custom style text
  final String prefixText; // teks sebelum waktu
  final String suffixText; // teks setelah waktu
  final bool autoStart; // otomatis jalan saat build
  final CountdownController? controller;

  const CountdownTimer({
    super.key,
    required this.seconds,
    this.onFinished,
    this.timeStyle,
    this.textStyle,
    this.prefixText = "Kode anda akan kadaluarsa dalam ",
    this.suffixText = "",
    this.autoStart = true,
    this.controller,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;

    // kasih akses ke controller
    widget.controller?._attach(this);

    if (widget.autoStart) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    remainingSeconds = widget.seconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds <= 1) {
        timer.cancel();
        setState(() {
          remainingSeconds = 0;
        });
        widget.onFinished?.call();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  void _resetTimer() {
    _startTimer();
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return remainingSeconds > 0
        ? Text.rich(
            TextSpan(
              text: widget.prefixText,
              style: widget.textStyle ?? const TextStyle(color: Colors.grey),
              children: [
                TextSpan(
                  text: _formatTime(remainingSeconds),
                  style: widget.timeStyle ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                if (widget.suffixText.isNotEmpty)
                  TextSpan(text: widget.suffixText),
              ],
            ),
            textAlign: TextAlign.center,
          )
        : const SizedBox.shrink();
  }
}

class CountdownController {
  _CountdownTimerState? _state;

  void _attach(_CountdownTimerState state) {
    _state = state;
  }

  void reset() {
    _state?._resetTimer();
  }

  /// Opsional, cukup putus referensi
  void dispose() => _state = null;
}
