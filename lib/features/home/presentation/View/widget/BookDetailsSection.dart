import 'package:booklyapp/core/utils/Styles.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/View/widget/BooksRating.dart';
import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImage.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: custom_BookImage(
            urlimage: book.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          book.volumeInfo.title as String,
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors![0],
            style: Styles.textstyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BooksRating(
          averageRating: book.volumeInfo.averageRating ?? 0,
          ratingsCount: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
