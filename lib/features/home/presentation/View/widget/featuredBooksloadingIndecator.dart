import 'package:booklyapp/features/home/presentation/View/widget/Custom_Fading_Widget.dart';
import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImageloadingIndecator.dart';

import 'package:flutter/material.dart';



class featuredBooksloadingIndecator extends StatelessWidget {
  const featuredBooksloadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Custom_Fading_Widget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: custom_BookImageloadingIndecator());
            }),
      ),
    );
  }
}

