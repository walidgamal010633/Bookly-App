import 'package:flutter/material.dart';

class Custom_Fading_Widget extends StatefulWidget {
  const Custom_Fading_Widget({super.key, required this.child});
  final Widget child;
  @override
  State<Custom_Fading_Widget> createState() => _Custom_Fading_WidgetState();
}

class _Custom_Fading_WidgetState extends State<Custom_Fading_Widget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 0.2, end: 0.8).animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
