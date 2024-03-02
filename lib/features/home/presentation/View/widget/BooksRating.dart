import 'package:booklyapp/core/utils/Styles.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksRating extends StatelessWidget {
  const BooksRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.averageRating,
    this.ratingsCount,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num? averageRating, ratingsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 18,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "$averageRating",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.5,
          child: Text("( $ratingsCount )", style: Styles.textStyle14),
        )
      ],
    );
  }
}
