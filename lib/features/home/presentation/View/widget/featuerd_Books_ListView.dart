import 'package:booklyapp/core/utils/Styles.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';

import 'package:booklyapp/features/home/presentation/View/widget/feathuredbookslistviewblocsonsumer.dart';
import 'package:booklyapp/features/home/presentation/View/widget/featuredBooksloadingIndecator.dart';
import 'package:booklyapp/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class featuerd_Books_ListView extends StatefulWidget {
  const featuerd_Books_ListView({super.key});

  @override
  State<featuerd_Books_ListView> createState() =>
      _featuerd_Books_ListViewState();
}

class _featuerd_Books_ListViewState extends State<featuerd_Books_ListView> {
  List<BookModel> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) async {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksFailurepagination) {
          const featuredBooksloadingIndecator ();
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksFailurepagination ||
            state is FeaturedBookspaginationLoding) {
          return feathuredbookslistviewblocsonsumer(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(
            state.ErrorMassage,
            style: Styles.textStyle20,
          );
        } else {
          return const featuredBooksloadingIndecator();
        }
      },
    );
  }
}

