import 'package:booklyapp/core/utils/Styles.dart';
import 'package:booklyapp/features/home/presentation/View/widget/SimilarBooksListView.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You Can Also Like",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListView(),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
