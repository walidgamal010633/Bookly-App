import 'package:booklyapp/core/utils/Styles.dart';

import 'package:booklyapp/features/home/presentation/View/widget/BookListViewItem.dart';
import 'package:booklyapp/features/home/presentation/View/widget/BookListViewItemlodingandicator.dart';
import 'package:booklyapp/features/home/presentation/View/widget/Custom_Fading_Widget.dart';
import 'package:booklyapp/features/home/presentation/View/widget/custom_BookImageloadingIndecator.dart';
import 'package:booklyapp/features/home/presentation/manger/Newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Newset_Books extends StatelessWidget {
  const Newset_Books({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
         
        if (state is NewsetBooksSuccess) {
          
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.Books.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: BookListViewItem(bookModel: state.Books[index]),
                );
              });
        } else if (state is NewsetBooksFailure) {
          return Text(
            state.ErrorMassage,
            style: Styles.textStyle20,
          );
        } else {
          return const BookListViewItemlodingandicator();
        }
      },
    );
  }
}

