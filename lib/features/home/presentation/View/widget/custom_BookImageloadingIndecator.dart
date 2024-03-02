import 'package:flutter/material.dart';

class custom_BookImageloadingIndecator extends StatelessWidget {
  const custom_BookImageloadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            color: Colors.grey[500],
          )),
    );
  }
}
