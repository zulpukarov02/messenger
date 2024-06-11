import 'package:flutter/material.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({
    super.key,
    required this.size,
  });

  final double size;

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.forward();

    controller.addStatusListener((status) {});

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: SizedBox(
        height: controller.value * widget.size,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
