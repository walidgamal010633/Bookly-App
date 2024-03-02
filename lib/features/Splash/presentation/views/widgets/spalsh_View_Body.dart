
import 'package:booklyapp/core/utils/assaes.dart';
import 'package:booklyapp/features/home/presentation/View/homeview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class spalsh_view_body extends StatefulWidget {
  const spalsh_view_body({super.key});

  @override
  State<spalsh_view_body> createState() => _spalsh_view_bodyState();
}

class _spalsh_view_bodyState extends State<spalsh_view_body>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidinganimation;

  @override
  void initState() {
    super.initState();
    init_sliding_animation();
    NavigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
       const SizedBox(
          height: 8,
        ),
        SlideTransition(
          position: slidinganimation,
          child:const Text(
            textAlign: TextAlign.center,
            "Read Free Books",
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }

  void init_sliding_animation() {
    animationController = AnimationController(
      vsync: this,
      duration:const Duration(seconds: 3),
    );
    slidinganimation =
        Tween<Offset>(begin: const Offset(0, 8), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(milliseconds: 3500), () {
      Get.to(()=>const HomeView(), transition: Transition.leftToRightWithFade,
        duration:const Duration(
          seconds: 3,
        ),);

    });
  }
}