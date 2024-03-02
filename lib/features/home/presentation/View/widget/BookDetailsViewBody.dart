import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/View/widget/BookDetailsSection.dart';
import 'package:booklyapp/features/home/presentation/View/widget/BooksAction.dart';

import 'package:booklyapp/features/home/presentation/View/widget/CustomBookDetailsAppBar.dart';
import 'package:booklyapp/features/home/presentation/View/widget/SimilarBooksSection.dart';

import 'package:booklyapp/features/home/presentation/manger/similar%20Books%20cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetch_SimilarBooks(
        catogry: widget.bookModel.volumeInfo.categories?[0] ?? "science");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(book: widget.bookModel),
                BooksAction(bookModel: widget.bookModel),
                const Expanded(
                  child: SizedBox(
                    height: 0,
                  ),
                ),
                const SimilarBooksSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
