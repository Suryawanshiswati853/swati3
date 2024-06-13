import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class SlideInWidget extends StatelessWidget {
  final Widget child;
  final int delay;

  SlideInWidget({required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: delay)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Opacity(opacity: 0, child: child);
        } else {
          return TweenAnimationBuilder(
            tween: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: (context, Offset offset, Widget? child) {
              return Transform.translate(
                offset: offset,
                child: FadeInWidget(child: child!),
              );
            },
            child: child,
          );
        }
      },
    );
  }
}

class FadeInWidget extends StatelessWidget {
  final Widget child;

  FadeInWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (context, double opacity, Widget? child) {
        return Opacity(
          opacity: opacity,
          child: child,
        );
      },
      child: child,
    );
  }
}


// class SlideInWidget extends StatelessWidget {
//   final Widget child;
//   final int delay;

//   SlideInWidget({required this.child, this.delay = 0});

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       tween: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)),
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//       builder: (context, Offset offset, Widget? child) {
//         return Transform.translate(
//           offset: offset,
//           child: child,
//         );
//       },
//       child: child,
//     );
//   }
// }
