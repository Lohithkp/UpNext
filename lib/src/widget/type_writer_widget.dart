import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration speed;
  final Color color;

  const TypewriterText(
      {Key? key,
      required this.text,
      this.style = const TextStyle(fontSize: 18.0, color: Colors.black),
      this.speed = const Duration(milliseconds: 100),
      required this.color})
      : super(key: key);

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int _currentLength = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.speed, (timer) {
      if (_currentLength < widget.text.length) {
        if (mounted) {
          setState(() {
            _currentLength++;
          });
        }
      } else {
        _timer?.cancel();
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _currentLength = 0; // Reset the text and start over
              _startTyping(); // Restart the typing effect after the pause
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [widget.color.withOpacity(0.5), widget.color],
          tileMode: TileMode.clamp,
        ).createShader(bounds);
      },
      child: Text(
        widget.text.substring(0, _currentLength),
        style: widget.style.copyWith(
          fontSize: 18.0, // Adjust font size for emphasis
          fontWeight: FontWeight.normal,
          //  fontStyle: FontStyle.italic, //// Make it bold
          letterSpacing: 1.4, // Add space between letters
          shadows: [
            Shadow(
              blurRadius: 1.0,
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(1.0, 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
