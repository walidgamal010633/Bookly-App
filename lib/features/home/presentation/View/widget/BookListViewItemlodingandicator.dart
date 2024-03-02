import 'package:booklyapp/features/home/presentation/View/widget/lodingandicatorNewsetBooks.dart';
import 'package:flutter/material.dart';

class BookListViewItemlodingandicator extends StatelessWidget {
  const BookListViewItemlodingandicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: lodingandicatorNewsetBooks(),
            );
          }),
    );
  }
}
