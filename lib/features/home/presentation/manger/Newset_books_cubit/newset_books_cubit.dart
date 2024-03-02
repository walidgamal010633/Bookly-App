import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetch_NewsetBooks() async {
    emit(NewsetBooksLoding());
    var Result = await homeRepo.fetchNewsetBooks();
    Result.fold((failur) {
        emit(NewsetBooksFailure(failur.errorMassage),);
      },
      (books) {
        emit(
          NewsetBooksSuccess(books),
        );
      });
  }
}
