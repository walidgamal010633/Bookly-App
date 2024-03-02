import 'package:booklyapp/features/home/presentation/View/widget/Custom_Fading_Widget.dart';
import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImageloadingIndecator.dart';
import 'package:flutter/material.dart';


class lodingandicatorNewsetBooks extends StatelessWidget {
  const lodingandicatorNewsetBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Custom_Fading_Widget(
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            const custom_BookImageloadingIndecator(),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Container(
                      height: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}