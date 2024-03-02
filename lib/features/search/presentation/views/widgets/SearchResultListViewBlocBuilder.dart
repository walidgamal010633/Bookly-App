import 'package:booklyapp/core/utils/Styles.dart';
import 'package:booklyapp/features/home/presentation/View/widget/BookListViewItemlodingandicator.dart';
import 'package:booklyapp/features/search/Data/models/book_model/book_model.dart';

import 'package:booklyapp/features/search/presentation/Manger/SearchBooksCubit/search_books_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/Resultsearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchResultListView(
            books: state.Books,
          );
        } else if (state is SearchBooksFailure) {
          return Text(
            state.ErrMassage,
            style: Styles.textStyle20,
          );
        } else if (state is SearchBooksLoading) {
          return const BookListViewItemlodingandicator();
        } else {
          return const Center(
            child: Text(
              " Search for a book",
              style: Styles.textStyle30,
            ),
          );
        }
      },
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.books,
  });
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Search Result",
          style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold, color: const Color(0xffffeb3a)),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: books.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Resultsearch(books: books[index]),
                );
              }),
        ),
      ],
    );
  }
}


// SearchResultListView