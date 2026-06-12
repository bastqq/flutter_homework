import 'package:flutter/material.dart';

class BallAnimationScreen extends StatefulWidget {
  const BallAnimationScreen({super.key});

  @override
  State<BallAnimationScreen> createState() => _BallAnimationScreenState();
}

class _BallAnimationScreenState extends State<BallAnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat(reverse: true);
  late final AnimationController _rotator = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  );
  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.decelerate),
      reverseCurve: Curves.bounceOut.flipped,
    ),
  );

  late final Animation<double> _rotation = CurvedAnimation(
    parent: _rotator,

    curve: Interval(0.2, 1.0, curve: Curves.decelerate),
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _rotator.repeat();
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // ignore: inference_failure_on_instance_creation
        await Future.delayed(const Duration(seconds: 1));

        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _rotator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Ball')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 3,
            child: Stack(
              children: [
                Container(decoration: BoxDecoration(color: Colors.blue)),

                AlignTransition(
                  alignment: _animation,

                  child: RotationTransition(
                    turns: _rotation,
                    child: Image.asset(
                      'images/ball.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(child: Container(color: Colors.green[300])),
          ),
        ],
      ),
    );
  }
}
