import 'package:flutter/material.dart';
import '../animations/OpacityAnimation.dart';

class InitialAnimateLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpacityAnimation(),
    );
  }
}
