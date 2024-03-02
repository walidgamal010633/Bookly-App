import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/Home_repo_impl.dart';
import 'package:booklyapp/features/home/presentation/manger/similar%20Books%20cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/BookDetailsViewBody.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
  BookModel books = ModalRoute.of(context)!.settings.arguments as BookModel;
    return  BlocProvider(
      create: (context) => SimilarBooksCubit(getit.get<Home_repo_impl>()),
      child: Scaffold(
        body: SafeArea(child: BookDetailsViewBody(bookModel: books,)),
      ),
    );
  }
}
