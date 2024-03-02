import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo ;
  Future<void> fetch_SimilarBooks ({required String catogry}) async {
    emit(SimilarBooksLoding());
    var Result = await homeRepo.fetchSimilarBooks(catogry:catogry );
    Result.fold((failur) {
        emit(SimilarBooksFailer(ErrorMassage: failur.errorMassage),);
      },
      (books) {
        emit(
          SimilarBooksSuccess(Books: books),
        );
      });
  }
}
