import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/search/Data/models/book_model/book_model.dart';
import 'package:booklyapp/features/search/Data/repos/SearchRepo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchrepo) : super(SearchBooksInitial());
  final Searchrepo searchrepo;
  Future<void> SearchBooks({required String? BookName}) async {
    emit(SearchBooksLoading());
    var Result = await searchrepo.SearchBooks(BookName ?? "");
    Result.fold(
      (failur) {
        emit(SearchBooksFailure(ErrMassage: failur.errorMassage));
      },
      (books) {
        emit(
          SearchBooksSuccess(Books: books),
        );
      },
    );
  }
}
