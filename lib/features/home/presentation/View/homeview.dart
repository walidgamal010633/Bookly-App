import 'package:booklyapp/features/home/presentation/View/widget/Home_View_Body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: SafeArea(child: Home_View_Body(),) 
    );
  }
}
