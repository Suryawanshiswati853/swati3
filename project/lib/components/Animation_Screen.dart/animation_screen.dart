import 'package:flutter/material.dart';

class SlideInAnimatedContainer extends StatefulWidget {
  final Widget child;
  final int delay;

  SlideInAnimatedContainer({required this.child, this.delay = 0});

  @override
  _SlideInAnimatedContainerState createState() => _SlideInAnimatedContainerState();
}

class _SlideInAnimatedContainerState extends State<SlideInAnimatedContainer> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(_isVisible ? 0 : 300, 0, 0),
      child: widget.child,
    );
  }
}
